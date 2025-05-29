#include <fuzzing/branching_node.hpp>
#include <fuzzing/fuzzer.hpp>
#include <fuzzing/iid_vector_analysis.hpp>
#include <instrumentation/instrumentation_types.hpp>
#include <iostream>
#include <ranges>
#include <string>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>

namespace fuzzing
{

//                                        mean_counter
// ------------------------------------------------------------------------------------------------
template < typename T >
inline void fuzzing::mean_counter< T >::add( T value )
{
    mean = ( mean * count + value ) / ( count + 1 );
    count++;
}

//                                        node_counts
// ------------------------------------------------------------------------------------------------
int node_counts::get_max_count() const { return std::max( left_count, right_count ); }

//                                       node_props_in_path
// ------------------------------------------------------------------------------------------------
bool node_props_in_path::get_desired_direction() const
{
    INVARIANT( computed_counts.left_count + computed_counts.right_count > 0 );

    if ( is_loop_head ) {
        return get_preferred_direction_loop_head();
    }

    bool can_go_left = taken_counts.left_count < computed_counts.left_count;
    bool can_go_right = taken_counts.right_count < computed_counts.right_count;

    INVARIANT( can_go_left || can_go_right );

    if ( can_go_left && can_go_right && iid_dependencies::random_direction_in_path ) {
        return rand() % 2 == 0;
    }

    if ( can_go_left ) {
        return false;
    }

    if ( can_go_right ) {
        return true;
    }

    throw std::runtime_error( "No direction to go" );
}

// ------------------------------------------------------------------------------------------------
bool node_props_in_path::can_go_direction( bool direction ) const
{
    if ( direction ) {
        return taken_counts.right_count < computed_counts.right_count;
    } else {
        return taken_counts.left_count < computed_counts.left_count;
    }
}

// ------------------------------------------------------------------------------------------------
void node_props_in_path::go_direction( bool direction )
{
    if ( direction ) {
        taken_counts.right_count++;
    } else {
        taken_counts.left_count++;
    }

    // Reset the counts if the loop ended
    if ( is_loop_head && direction == loop_head_end_direction ) {
        taken_counts = { 0, 0 };
    }
}

// ------------------------------------------------------------------------------------------------
bool node_props_in_path::can_take_next_direction() const
{
    return taken_counts.left_count < computed_counts.left_count ||
           taken_counts.right_count < computed_counts.right_count;
}

// ------------------------------------------------------------------------------------------------
float_32_bit node_props_in_path::get_false_direction_probability() const
{
    INVARIANT( computed_counts.left_count + computed_counts.right_count > 0 );

    return float_32_bit( computed_counts.left_count ) /
           ( computed_counts.left_count + computed_counts.right_count );
}

// ------------------------------------------------------------------------------------------------
bool node_props_in_path::get_preferred_direction_loop_head() const
{
    auto is_depleted = []( int computed, int taken ) { return computed == taken; };

    if ( !loop_head_end_direction ) {
        return !is_depleted( computed_counts.right_count, taken_counts.right_count );
    } else {
        return is_depleted( computed_counts.left_count, taken_counts.left_count );
    }
}

//                                         generated_path
// ------------------------------------------------------------------------------------------------
bool generated_path::contains( location_id::id_type id ) const { return path.contains( id ); }

// ------------------------------------------------------------------------------------------------
std::map< location_id::id_type, node_props_in_path > generated_path::get_path() const { return path; }

//                                          equation
// ------------------------------------------------------------------------------------------------
equation equation::operator+( const equation& other ) const
{
    INVARIANT( values.size() == other.values.size() );

    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] + other.values[ i ] );
    }

    return { new_values, best_value + other.best_value };
}

// ------------------------------------------------------------------------------------------------
equation equation::operator+( int scalar ) const
{
    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] + scalar );
    }

    return { new_values, best_value };
}

// ------------------------------------------------------------------------------------------------
equation equation::operator-( const equation& other ) const
{
    INVARIANT( values.size() == other.values.size() );

    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] - other.values[ i ] );
    }

    return { new_values, best_value - other.best_value };
}

// ------------------------------------------------------------------------------------------------
equation equation::operator*( int scalar ) const
{
    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] * scalar );
    }

    return { new_values, best_value * scalar };
}

// ------------------------------------------------------------------------------------------------
equation equation::operator*( double scalar ) const
{
    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] * scalar );
    }

    return { new_values, best_value * scalar };
}

// ------------------------------------------------------------------------------------------------
equation equation::operator/( const equation& other ) const
{
    INVARIANT( values.size() == other.values.size() );

    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        if ( other.values[ i ] == 0 ) {
            new_values.push_back( 0 );
        } else {
            new_values.push_back( values[ i ] / other.values[ i ] );
        }
    }


    return { new_values, best_value / other.best_value };
}

// ------------------------------------------------------------------------------------------------
equation equation::add_to_positive( int value ) const
{
    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        if ( values[ i ] != 0 ) {
            new_values.push_back( values[ i ] + value );
        } else {
            new_values.push_back( values[ i ] );
        }
    }

    return { new_values, best_value };
}

// ------------------------------------------------------------------------------------------------
equation fuzzing::equation::add_to_values( const equation& other ) const
{
    INVARIANT( values.size() == other.values.size() );

    std::vector< int > new_values;
    for ( int i = 0; i < values.size(); ++i ) {
        new_values.push_back( values[ i ] + other.values[ i ] );
    }

    return { new_values, best_value };
}

// ------------------------------------------------------------------------------------------------
int fuzzing::equation::simplify_by_gcd()
{
    if ( values.empty() ) {
        return 1;
    }

    int gcd = std::abs( best_value );
    for ( int i = 0; i < values.size(); ++i ) {
        gcd = std::gcd( gcd, values[ i ] );
    }

    if ( gcd == 0 || std::abs( gcd ) == 1 ) {
        return 1;
    }

    for ( int i = 0; i < values.size(); ++i ) {
        values[ i ] /= gcd;
    }

    best_value /= gcd;

    return gcd;
}


// ------------------------------------------------------------------------------------------------
int equation::get_vector_size() const
{
    return std::accumulate( values.begin(), values.end(), 0, []( int sum, int val ) { return sum + val; } );
}

// ------------------------------------------------------------------------------------------------
int equation::get_one_way_branching_count() const
{
    return std::count_if( values.begin(), values.end(), []( int val ) { return val == 0; } );
}

// ------------------------------------------------------------------------------------------------
int equation::get_biggest_value() const { return *std::max_element( values.begin(), values.end() ); }

// ------------------------------------------------------------------------------------------------
const std::unordered_set< location_id::id_type >& fuzzing::equation_matrix::get_node_ids() const
{
    return node_ids;
}

// ------------------------------------------------------------------------------------------------
bool equation::is_any_negative() const
{
    return std::any_of( values.begin(), values.end(), []( int val ) { return val < 0; } );
}

// ------------------------------------------------------------------------------------------------
bool equation::same_values() const
{
    for ( int i = 0; i < values.size(); ++i ) {
        if ( values[ i ] != best_value && values[ i ] != 0 ) {
            return false;
        }
    }

    return true;
}

// ------------------------------------------------------------------------------------------------
bool equation::is_linear_dependent( const equation& other ) const
{
    INVARIANT( values.size() == other.values.size() );

    double ratio = std::numeric_limits< double >::quiet_NaN();
    for ( int i = 0; i < values.size(); ++i ) {
        if ( values[ i ] == 0 && other.values[ i ] == 0 ) {
            continue;
        }

        if ( values[ i ] == 0 || other.values[ i ] == 0 ) {
            return false;
        }

        double current_ratio = double( values[ i ] ) / other.values[ i ];
        if ( std::isnan( ratio ) ) {
            ratio = current_ratio;
        } else if ( std::abs( ratio - current_ratio ) > 1e-9 ) {
            return false;
        }
    }

    if ( best_value == 0 && other.best_value == 0 ) {
        return true;
    }

    if ( best_value == 0 || other.best_value == 0 ) {
        return false;
    }

    if ( std::isnan( ratio ) ) {
        return ( best_value - other.best_value ) < 1e-7;
    }

    return std::abs( best_value / other.best_value - ratio ) < 1e-7;
}

//                                     node_id_with_direction
// ------------------------------------------------------------------------------------------------
auto node_id_with_direction::operator<=>( node_id_with_direction const& other ) const
{
    if ( auto const cmp = node_id <=> other.node_id; cmp != 0 )
        return cmp;

    return branching_direction <=> other.branching_direction;
}

//                                    loop_properties
// ------------------------------------------------------------------------------------------------
bool fuzzing::loop_properties::is_same( const std::unordered_set< location_id::id_type >& other_ids ) const
{
    TMPROF_BLOCK();
    return all_ids == other_ids;
}

// ------------------------------------------------------------------------------------------------
const std::unordered_set< location_id::id_type >& fuzzing::loop_properties::get_all_ids() const
{
    TMPROF_BLOCK();
    return all_ids;
}

// ------------------------------------------------------------------------------------------------
const std::unordered_set< location_id::id_type >& fuzzing::loop_properties::get_loop_head_ids() const
{
    TMPROF_BLOCK();
    return loop_head_ids;
}

// ------------------------------------------------------------------------------------------------
location_id::id_type fuzzing::loop_properties::get_smallest_loop_head_id() const
{
    TMPROF_BLOCK();

    location_id::id_type smallest_id = *loop_head_ids.begin();

    for ( const auto& id : loop_head_ids ) {
        if ( id < smallest_id ) {
            smallest_id = id;
        }
    }

    return smallest_id;
}

// ------------------------------------------------------------------------------------------------
std::optional< location_id::id_type > fuzzing::loop_properties::get_smallest_body_id() const
{
    TMPROF_BLOCK();

    std::optional< location_id::id_type > smallest_id;

    for ( const auto& body : bodies ) {
        if ( !smallest_id.has_value() || body.node_id < smallest_id.value() ) {
            smallest_id = body.node_id;
        }
    }

    return smallest_id;
}

// ------------------------------------------------------------------------------------------------
location_id::id_type fuzzing::loop_properties::get_smallest_id() const
{
    TMPROF_BLOCK();
    location_id::id_type smallest_id = *all_ids.begin();

    for ( const auto& id : all_ids ) {
        if ( id < smallest_id ) {
            smallest_id = id;
        }
    }

    return smallest_id;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::loop_properties::update_stored_ids()
{
    TMPROF_BLOCK();

    for ( const auto& [ head, props ] : heads ) {
        all_ids.insert( head.node_id );
    }

    for ( const auto& body : bodies ) {
        all_ids.insert( body.node_id );
    }

    if ( loop_head_ids.size() == heads.size() ) {
        return;
    }

    for ( const auto& [ head, props ] : heads ) {
        loop_head_ids.insert( head.node_id );
    }
}

// ------------------------------------------------------------------------------------------------
void fuzzing::loop_properties::set_chosen_loop_head()
{
    TMPROF_BLOCK();

    for ( const auto& [ head, props ] : heads ) {
        if ( !chosen_loop_head.has_value() ) {
            chosen_loop_head = head;
        }

        if ( props.count > heads.at( *chosen_loop_head ).count ) {
            chosen_loop_head = head;
        }
    }
}

//                                     loop_dependencies
// ------------------------------------------------------------------------------------------------
loop_properties& fuzzing::loop_dependencies::get_props( const std::unordered_set< location_id::id_type >& ids,
                                                        location_id::id_type loop_head_id )
{
    TMPROF_BLOCK();

    for ( loop_properties& loop : loops ) {
        for ( const auto& [ head, props ] : loop.heads ) {
            if ( head.node_id == loop_head_id ) {
                return loop;
            }
        }

        if ( loop.is_same( ids ) ) {
            return loop;
        }
    }

    loops.emplace_back();
    return loops.back();
}

// ------------------------------------------------------------------------------------------------
void fuzzing::loop_dependencies::merge_properties()
{
    TMPROF_BLOCK();

    for ( loop_properties& loop : loops ) {
        loop.update_stored_ids();
    }

    std::unordered_map< location_id::id_type, loop_properties > merged_loops;

    for ( const auto& loop : loops ) {
        location_id::id_type smallest_id = loop.get_smallest_id();

        auto [ it, inserted ] = merged_loops.try_emplace( smallest_id, std::move( loop ) );

        if ( !inserted ) {
            for ( const auto& [ head, props ] : loop.heads ) {
                it->second.heads[ head ].count += props.count;
            }
            it->second.bodies.insert( loop.bodies.begin(), loop.bodies.end() );
        }
    }

    for ( auto& [ id, loop ] : merged_loops ) {
        const std::unordered_set< location_id::id_type >& head_ids = loop.get_loop_head_ids();

        for ( auto body_it = loop.bodies.begin(); body_it != loop.bodies.end(); ) {
            if ( head_ids.contains( body_it->node_id ) ) {
                body_it = loop.bodies.erase( body_it );
            } else {
                ++body_it;
            }
        }
    }

    loops.clear();
    loops.reserve( merged_loops.size() );

    for ( auto& [ id, loop ] : merged_loops ) {
        loop.update_stored_ids();
        loops.push_back( std::move( loop ) );
    }
}

// ------------------------------------------------------------------------------------------------
const loop_properties& fuzzing::loop_dependencies::get_props_by_loop_head_id( location_id::id_type loop_head_id ) const
{
    for ( const loop_properties& loop : loops ) {
        for ( const auto& [ head, props ] : loop.heads ) {
            if ( head.node_id == loop_head_id ) {
                return loop;
            }
        }
    }

    throw std::runtime_error( "Loop head not found: " + std::to_string( loop_head_id ) );
}

// ------------------------------------------------------------------------------------------------
loop_properties& fuzzing::loop_dependencies::get_props_by_loop_head_id( location_id::id_type loop_head_id )
{
    return const_cast< loop_properties& >(
        static_cast< const fuzzing::loop_dependencies& >( *this ).get_props_by_loop_head_id( loop_head_id ) );
}

// ------------------------------------------------------------------------------------------------
std::set< location_id::id_type > fuzzing::loop_dependencies::get_loop_heads( bool include_loading_loops ) const
{
    std::set< location_id::id_type > loop_heads;
    for ( const auto& props : loops ) {
        if ( props.is_loading_loop && !include_loading_loops ) {
            continue;
        }

        for ( const auto& [ head, _ ] : props.heads ) {
            loop_heads.insert( head.node_id );
        }
    }

    return loop_heads;
}

// ------------------------------------------------------------------------------------------------
bool fuzzing::loop_dependencies::compute_node_subsets_for_computation(
    std::set< node_id_with_direction >& computation_subset,
    const std::unordered_set< location_id::id_type >& matrix_ids ) const
{
    TMPROF_BLOCK();

    bool changed = false;

    for ( const auto& loop : loops ) {
        if ( loop.is_loading_loop || !matrix_ids.contains( loop.get_smallest_loop_head_id() ) ) {
            continue;
        }

        for ( const auto& body : loop.bodies ) {
            auto [ it, inserted ] = computation_subset.insert( body );
            changed |= inserted;
        }

        for ( const auto& [ head, _ ] : loop.heads ) {
            auto [ it, inserted ] = computation_subset.insert( { head.node_id, !head.branching_direction } );
            changed |= inserted;

            auto it_head = computation_subset.find( head );
            if ( it_head != computation_subset.end() ) {
                computation_subset.erase( it_head );
                changed = true;
            }
        }
    }

    return changed;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::loop_dependencies::print_dependencies() const
{
    bool print_dependencies_by_loops = true;
    bool print_dependencies_by_loading = true;

    if ( !print_dependencies_by_loops && !print_dependencies_by_loading ) {
        return;
    }

    std::cout << "# Dependencies:" << std::endl;
    if ( print_dependencies_by_loops ) {
        std::cout << "## Dependencies by loops:" << std::endl;
        for ( const auto& loop : loops ) {
            if ( loop.is_loading_loop ) {
                continue;
            }

            std::cout << "Loop heads:" << std::endl;
            for ( const auto& [ head, head_props ] : loop.heads ) {
                std::cout << "- " << head << " (" << head_props.count << ")" << std::endl;
            }

            std::cout << "Loop bodies:" << std::endl;
            for ( const auto& body : loop.bodies ) {
                std::cout << "- " << body << std::endl;
            }

            if ( loop.is_loading_loop ) {
                std::cout << "Loading loop" << std::endl;
                std::cout << "Average bits per loop: " << loop.loaded_bits_per_loop.mean << std::endl;
                for ( const auto& [ body, body_props ] : loop.bits_read_by_node ) {
                    std::cout << "- " << body << ", Bits: " << body_props.average_bits_read.mean
                              << ", offset: " << body_props.minimal_bit_offset << std::endl;
                }
            }
        }
    }

    if ( print_dependencies_by_loading ) {
        std::cout << "## Dependencies by loading:" << std::endl;
        for ( const auto& loop : loops ) {
            if ( !loop.is_loading_loop ) {
                continue;
            }

            std::cout << "Loop heads:" << std::endl;
            for ( const auto& [ head, head_props ] : loop.heads ) {
                std::cout << "- " << head << " (" << head_props.count << ")" << std::endl;
            }

            std::cout << "Loop bodies:" << std::endl;
            for ( const auto& body : loop.bodies ) {
                std::cout << "- " << body << std::endl;
            }

            std::cout << "Dependent nodes:" << std::endl;
            for ( const auto& [ body, body_props ] : loop.bits_read_by_node ) {
                std::cout << "- " << body << ", Bits: " << body_props.average_bits_read.mean
                          << ", offset: " << body_props.minimal_bit_offset
                          << " bits used: " << body_props.average_bits_used.mean << std::endl;
            }

            std::cout << "Loaded bits per loop: " << loop.loaded_bits_per_loop.mean << std::endl;
        }
    }
}

//                                       equation_matrix
// ------------------------------------------------------------------------------------------------
equation_matrix equation_matrix::get_submatrix( std::set< node_id_with_direction > const& subset ) const
{
    TMPROF_BLOCK();

    equation_matrix result;
    result.nodes = std::vector< node_id_with_direction >( subset.begin(), subset.end() );

    for ( const node_id_with_direction& nav : result.nodes ) {
        result.node_ids.insert( nav.node_id );
    }

    for ( int i = 0; i < matrix.size(); ++i ) {
        const equation& row = matrix[ i ];

        std::vector< int > new_row_values;
        for ( const node_id_with_direction& nav : subset ) {
            auto it = std::find( nodes.begin(), nodes.end(), nav );
            if ( it != nodes.end() ) {
                new_row_values.push_back( row.values[ std::distance( nodes.begin(), it ) ] );
            } else {
                new_row_values.push_back( 0 );
            }
        }

        equation new_row = { new_row_values, row.best_value };

        auto [ it, inserted ] = result.unique_rows.insert( new_row );
        if ( inserted ) {
            result.matrix.push_back( new_row );
            result.all_paths.push_back( all_paths[ i ] );
            result.branching_values[ row.best_value ]++;
        }
    }

    return result;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::equation_matrix::process_node( branching_node* end_node,
                                             bool compute_matrix,
                                             const path_id_direction_count& directions_in_path,
                                             bool add_columns,
                                             std::size_t max_directions_in_path_index )
{
    TMPROF_BLOCK();

    if ( unique_rows.size() >= iid_dependencies::maximal_number_of_equations_in_matrix ) {
        return;
    }

    auto it = branching_values.find( end_node->best_coverage_value );

    if ( branching_values.size() >= iid_dependencies::maximal_number_of_branching_values && it == branching_values.end() ) {
        return;
    }

    if ( it != branching_values.end() &&
         it->second >= iid_dependencies::maximal_number_of_equations_with_same_branching_value ) {
        return;
    }

    all_paths.push_back( end_node );

    if ( !compute_matrix ) {
        return;
    }

    add_path( end_node, directions_in_path, add_columns, max_directions_in_path_index );
}

// ------------------------------------------------------------------------------------------------
void fuzzing::equation_matrix::start_compute_matrix()
{
    TMPROF_BLOCK();

    for ( branching_node* node : all_paths ) {
        if ( unique_rows.size() >= iid_dependencies::maximal_number_of_equations_in_matrix ) {
            return;
        }

        auto [ directions_in_path, max_directions_in_path_index ] = get_directions_in_path( node );
        add_path( node, directions_in_path, true, max_directions_in_path_index );
    }
}

// ------------------------------------------------------------------------------------------------
bool equation_matrix::contains( node_id_with_direction const& node ) const
{
    TMPROF_BLOCK();

    auto it = std::find( nodes.begin(), nodes.end(), node );
    return it != nodes.end();
}

// ------------------------------------------------------------------------------------------------
std::pair< std::size_t, std::size_t > equation_matrix::get_dimensions() const
{
    return { unique_rows.size(), nodes.size() };
}

// ------------------------------------------------------------------------------------------------
const std::unordered_map< equation, int >& equation_matrix::compute_vectors_with_hits()
{
    TMPROF_BLOCK();

    if ( computed_vectors == matrix.size() ) {
        return vectors_with_hits;
    }

    for ( int i = computed_vectors; i < matrix.size(); ++i ) {
        for ( int j = 0; j < matrix.size(); ++j ) {
            if ( i == j )
                continue;

            equation difference = matrix[ i ] - matrix[ j ];

            if ( difference.is_any_negative() || difference.best_value == 0 ||
                 difference.get_biggest_value() > iid_dependencies::biggest_value_in_difference_vector )
                continue;

            vectors.insert( difference );
        }

        computed_vectors++;
    }

    vectors_with_hits.clear();

    for ( const auto& vector : vectors ) {
        for ( const auto& row : matrix ) {
            equation new_possible_equation = row + vector;
            if ( std::find( unique_rows.begin(), unique_rows.end(), new_possible_equation ) != unique_rows.end() ) {
                equation vector_copy = vector;
                int gcd = vector_copy.simplify_by_gcd();
                vectors_with_hits[ vector_copy ] += gcd;
            }
        }
    }

    return vectors_with_hits;
}

// ------------------------------------------------------------------------------------------------
std::vector< equation >& equation_matrix::get_matrix() { return matrix; }

// ------------------------------------------------------------------------------------------------
int equation_matrix::get_desired_vector_direction() const
{
    TMPROF_BLOCK();

    auto is_positive = []( const equation& eq ) { return eq.best_value > 0; };
    auto is_negative = []( const equation& eq ) { return eq.best_value < 0; };

    if ( std::all_of( matrix.begin(), matrix.end(), is_positive ) ) {
        return -1;
    } else if ( std::all_of( matrix.begin(), matrix.end(), is_negative ) ) {
        return 1;
    } else {
        return 0;
    }
}

// ------------------------------------------------------------------------------------------------
float equation_matrix::get_biggest_branching_value() const
{
    TMPROF_BLOCK();

    float biggest_value = 0.0f;

    for ( const equation& row : matrix ) {
        if ( std::abs( row.best_value ) > biggest_value ) {
            biggest_value = std::abs( row.best_value );
        }
    }

    return biggest_value;
}

// ------------------------------------------------------------------------------------------------
std::optional< equation >
equation_matrix::get_new_subset_counts_from_vectors( const std::vector< equation >& vectors,
                                                     const iid_node_generations_stats& stats )
{
    TMPROF_BLOCK();

    INVARIANT( !vectors.empty() );
    INVARIANT( vectors[ 0 ].values.size() == nodes.size() );

    bool generate_more_data = should_generate_more_data( stats.state );

    std::vector< equation > paths;

    bool is_equal_sign = get_branching_predicate() == BRANCHING_PREDICATE::BP_EQUAL;

    for ( const auto& vector : vectors ) {
        for ( const auto& row : matrix ) {
            double counts = std::abs( row.best_value ) / std::abs( vector.best_value );
            int rounded_counts = static_cast< int >( std::round( counts ) );

            if ( std::abs( counts - double( rounded_counts ) ) > 1e-8 && !generate_more_data ) {
                continue;
            }

            equation new_path = vector * rounded_counts + row;

            if ( !is_equal_sign ) {
                new_path = new_path.add_to_values( vector );
                if ( generate_more_data ) {
                    double best_value = new_path.best_value;
                    float procents_to_add = 1 + iid_dependencies::percentage_to_add_to_path;

                    if ( stats.state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA ) {
                        // new_path = new_path.add_to_positive( stats.generate_artificial_data_count );
                        // new_path = new_path + vector * stats.generate_artificial_data_count;
                        procents_to_add += stats.generate_artificial_data_count / 3.0;
                    }

                    new_path = new_path * procents_to_add;
                    new_path.best_value = best_value;
                }
            }

            if ( !new_path.is_any_negative() ) {
                paths.push_back( new_path );
            }
        }
    }

    if ( paths.empty() ) {
        return std::nullopt;
    }

    auto compare_equations = []( const equation& a, const equation& b ) {
        if ( std::abs( a.best_value ) != std::abs( b.best_value ) ) {
            return std::abs( a.best_value ) < std::abs( b.best_value );
        }
        if ( a.get_vector_size() != b.get_vector_size() ) {
            return a.get_vector_size() < b.get_vector_size();
        }
        return a.get_one_way_branching_count() > b.get_one_way_branching_count();
    };

    auto min_it = std::min_element( paths.begin(), paths.end(), compare_equations );

    INVARIANT( min_it != paths.end() );
    return *min_it;
}

// ------------------------------------------------------------------------------------------------
void equation_matrix::print_matrix()
{
    std::cout << "# Matrix:" << std::endl;
    for ( const node_id_with_direction& nav : nodes ) {
        std::cout << nav << " ";
    }
    std::cout << std::endl;
    for ( size_t i = 0; i < matrix.size(); ++i ) {
        for ( size_t j = 0; j < matrix[ i ].values.size(); ++j ) {
            std::cout << ( j ? " " : "" ) << matrix[ i ].values[ j ];
        }
        std::cout << " -> | " << matrix[ i ].best_value << std::endl;
    }
}


// ------------------------------------------------------------------------------------------------
BRANCHING_PREDICATE equation_matrix::get_branching_predicate() const
{
    ASSUMPTION( all_paths.size() > 0 );
    return all_paths[ 0 ]->branching_predicate;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::equation_matrix::add_path( branching_node* end_node,
                                         const path_id_direction_count& directions_in_path,
                                         bool add_columns,
                                         std::size_t max_directions_in_path_index )
{
    auto branching_values_it = branching_values.find( end_node->best_coverage_value );

    if ( branching_values.size() >= iid_dependencies::maximal_number_of_branching_values &&
         branching_values_it == branching_values.end() ) {
        return;
    }

    if ( branching_values_it != branching_values.end() &&
         branching_values_it->second >= iid_dependencies::maximal_number_of_equations_with_same_branching_value ) {
        return;
    }

    TMPROF_BLOCK();

    if ( add_columns ) {
        int added_nodes = 0;
        INVARIANT( max_directions_in_path_index < directions_in_path.size() );

        for ( size_t i = 0; i < max_directions_in_path_index + 1; ++i ) {
            if ( directions_in_path[ i ] == 0 ) {
                continue;
            }

            int id = i / 2;
            bool direction = i % 2;

            auto [ it, inserted ] = node_ids.insert( id );
            if ( !inserted ) {
                continue;
            }

            for ( bool direction : { true, false } ) {
                nodes.push_back( { location_id::id_type( id ), direction } );
                added_nodes++;
            }
        }

        for ( int i = 0; i < added_nodes; ++i ) {
            for ( int j = 0; j < matrix.size(); ++j ) {
                matrix[ j ].values.push_back( 0 );
            }
        }
    }

    std::vector< int > values_in_path( nodes.size() );
    for ( size_t i = 0; i < nodes.size(); ++i ) {
        int index = 2 * nodes[ i ].node_id + ( nodes[ i ].branching_direction ? 1 : 0 );
        values_in_path[ i ] = directions_in_path[ index ];
    }

    equation row = { values_in_path, end_node->best_coverage_value };

    auto [ it, inserted ] = unique_rows.insert( row );
    if ( inserted ) {
        matrix.push_back( row );
        branching_values[ end_node->best_coverage_value ]++;
    }
}

//                                  iid_node_dependence_props
// ------------------------------------------------------------------------------------------------
generated_path iid_node_dependence_props::generate_probabilities( const loop_dependencies& loop_to_properties )
{
    TMPROF_BLOCK();

    stats.method_calls++;

    if ( !matrix_generated ) {
        matrix_generated = true;
        matrix.start_compute_matrix();
    }

    if ( loop_to_properties.loops.empty() ) {
        if ( iid_dependencies::verbose )
            std::cout << "No loops" << std::endl;

        return {};
    }

    bool subset_changed = loop_to_properties.compute_node_subsets_for_computation( computation_subset,
                                                                                   matrix.get_node_ids() );

    if ( computation_subset.empty() ) {
        if ( iid_dependencies::verbose )
            std::cout << "No nodes to compute" << std::endl;

        return {};
    }

    std::unordered_set< location_id::id_type > subset_ids;
    for ( const auto& nav : computation_subset ) {
        subset_ids.insert( nav.node_id );
    }

    stats.generation_starts++;

    if ( subset_changed ) {
        computation_submatrix = matrix.get_submatrix( computation_subset );
    }

    if ( computation_submatrix.empty() ) {
        if ( iid_dependencies::verbose )
            std::cout << "Empty submatrix" << std::endl;

        return return_empty_path();
    }

    if ( iid_dependencies::verbose ) {
        print_stats( false );
        loop_to_properties.print_dependencies();
        computation_submatrix.print_matrix();
    }

    std::optional< std::vector< equation > > best_vectors;

    if ( stats.state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA ) {
        best_vectors = generate_vectors_if_not_enough_data( computation_submatrix );
    } else {
        best_vectors = get_best_vectors( computation_submatrix, 1 );
    }

    if ( !best_vectors.has_value() ) {
        if ( iid_dependencies::verbose )
            std::cout << "No vectors" << std::endl;

        return return_empty_path();
    }

    std::optional< equation > new_subset_counts =
        computation_submatrix.get_new_subset_counts_from_vectors( *best_vectors, stats );

    if ( !new_subset_counts.has_value() ) {
        if ( iid_dependencies::verbose )
            std::cout << "No new subset counts" << std::endl;

        return return_empty_path();
    }

    if ( iid_dependencies::verbose ) {
        std::cout << "New subset counts: " << std::endl;
        for (size_t i = 0; i < new_subset_counts->values.size(); ++i) {
            std::cout << new_subset_counts->values[i] << " ";
        }
        std::cout << "-> Best Value: " << new_subset_counts->best_value << std::endl;
    }

    nodes_to_counts node_counts =
        compute_node_counts( *new_subset_counts, computation_subset, loop_to_properties, subset_ids );
    generated_path path = generate_path_from_node_counts( node_counts, loop_to_properties );

    if ( iid_dependencies::verbose ) {
        std::cout << "Generated path: " << std::endl << path << std::endl;
    }

    return return_path( path );
}


// ------------------------------------------------------------------------------------------------
void fuzzing::iid_node_dependence_props::process_path_effective( branching_node* end_node,
                                                                 const path_id_direction_count& directions_in_path,
                                                                 std::size_t max_directions_in_path_index )
{
    TMPROF_BLOCK();
    matrix.process_node( end_node, matrix_generated, directions_in_path, true, max_directions_in_path_index );

    if ( !computation_submatrix.empty() ) {
        computation_submatrix.process_node( end_node, true, directions_in_path, false, max_directions_in_path_index );
    }
}

// ------------------------------------------------------------------------------------------------
bool iid_node_dependence_props::is_covered() const
{
    return stats.state == generation_state::STATE_COVERED ||
           stats.state == generation_state::STATE_COVERED_BY_OTHER;
}

// ------------------------------------------------------------------------------------------------
bool iid_node_dependence_props::should_generate_new( const loop_dependencies& loop_to_properties ) const
{
    if ( stats.state == generation_state::STATE_COVERED ||
         stats.state == generation_state::STATE_COVERED_BY_OTHER ) {
        return false;
    }

    if ( !matrix_generated ) {
        return true;
    }

    if ( stats.state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA ||
         stats.state == generation_state::STATE_GENERATION_DATA_FOR_NEXT_NODE ||
         stats.state == generation_state::STATE_GENERATION_MORE ) {
        return true;
    }

    if ( matrix.get_number_of_different_branchings() <= 1 ) {
        return false;
    }

    std::set< fuzzing::node_id_with_direction > computation_subset;
    loop_to_properties.compute_node_subsets_for_computation( computation_subset, matrix.get_node_ids() );

    if ( !computation_subset.empty() ) {
        return true;
    }

    return false;
}

// ------------------------------------------------------------------------------------------------
failed_generation_method fuzzing::iid_node_dependence_props::determine_recovery_strategy()
{
    switch ( stats.last_failed_method ) {
        case failed_generation_method::METHOD_NONE:
            return failed_generation_method::METHOD_GENERATE_ARTIFICIAL_DATA;
        case failed_generation_method::METHOD_GENERATE_ARTIFICIAL_DATA:
            return failed_generation_method::METHOD_GENERATE_FROM_OTHER_NODE;
        case failed_generation_method::METHOD_GENERATE_FROM_OTHER_NODE:
            return failed_generation_method::METHOD_DO_NOT_GENERATE;
        case failed_generation_method::METHOD_DO_NOT_GENERATE:
            return failed_generation_method::METHOD_GENERATE_ARTIFICIAL_DATA;
    }
}

// ------------------------------------------------------------------------------------------------
bool iid_node_dependence_props::too_much_failed_in_row()
{
    if ( stats.state != generation_state::STATE_NOT_COVERED ) {
        return false;
    }

    if ( stats.failed_generations_in_row > iid_dependencies::max_failed_generations_in_row ) {
        return true;
    }

    if ( stats.do_not_generate_counter > 3 ) {
        return true;
    }

    return false;
}

// ------------------------------------------------------------------------------------------------
void iid_node_dependence_props::set_as_generating_for_other_node( int minimal_max_generation_for_other_node )
{
    if ( stats.state != generation_state::STATE_COVERED ) {
        return;
    }

    stats.state = generation_state::STATE_GENERATION_DATA_FOR_NEXT_NODE;
    stats.generated_for_other_node_max = minimal_max_generation_for_other_node;
    stats.generated_for_other_node = 0;
    stats.generated_for_other_node_count++;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_node_dependence_props::set_as_generating_artificial_data( int minimal_max_generation_artificial_data )
{
    stats.state = generation_state::STATE_GENERATING_ARTIFICIAL_DATA;
    stats.generate_artificial_data_max = minimal_max_generation_artificial_data;
    stats.generate_artificial_data = 0;
    stats.generate_artificial_data_count++;
}

// ------------------------------------------------------------------------------------------------
bool iid_node_dependence_props::is_equal_branching_predicate() const
{
    return matrix.get_branching_predicate() == BRANCHING_PREDICATE::BP_EQUAL;
}

// ------------------------------------------------------------------------------------------------
void iid_node_dependence_props::print_stats( bool only_state ) const
{
    switch ( stats.state ) {
        case generation_state::STATE_NOT_COVERED:
            std::cout << "Status: STATE_NOT_COVERED" << std::endl;
            if ( !only_state ) {
                std::cout << "Failed generations/Total generations: " << stats.failed_generations << "/"
                          << stats.generation_starts << std::endl;
                std::cout << "Failed generations in row: " << stats.failed_generations_in_row << std::endl;
            }
            break;
        case generation_state::STATE_GENERATION_MORE:
            std::cout << "Status STATE_GENERATION_MORE" << std::endl;
            if ( !only_state ) {
                std::cout << "Generated after covered: " << stats.generated_after_covered << "/"
                          << stats.generated_after_covered_max << std::endl;
            }
            break;
        case generation_state::STATE_COVERED: std::cout << "STATE_COVERED" << std::endl; break;
        case generation_state::STATE_GENERATION_DATA_FOR_NEXT_NODE: {
            std::cout << "Status: STATE_GENERATION_DATA_FOR_NEXT_NODE" << std::endl;
            if ( !only_state )
                std::cout << "Generated for other node: " << stats.generated_for_other_node << "/"
                          << stats.generated_for_other_node_max << std::endl;
        } break;
        case generation_state::STATE_GENERATING_ARTIFICIAL_DATA:
            std::cout << "Status: STATE_GENERATING_ARTIFICIAL_DATA" << std::endl;
            if ( !only_state ) {
                std::cout << "Generated artificial data: " << stats.generate_artificial_data << "/"
                          << stats.generate_artificial_data_max << std::endl;
            }
            break;
        case generation_state::STATE_COVERED_BY_OTHER:
            std::cout << "Status: STATE_COVERED_BY_OTHER" << std::endl;
            break;
    }
}

// ------------------------------------------------------------------------------------------------
std::optional< std::vector< equation > >
fuzzing::iid_node_dependence_props::generate_vectors_if_not_enough_data( equation_matrix& submatrix )
{
    TMPROF_BLOCK();

    std::vector< equation > best_vectors;
    int desired_direction = submatrix.get_desired_vector_direction();
    const std::unordered_map< equation, int >& vectors = submatrix.compute_vectors_with_hits();

    auto add_to_best_vectors = [ & ]( std::vector< int > values ) {
        if ( desired_direction == 0 ) {
            best_vectors.emplace_back( values, 1 );
            best_vectors.emplace_back( values, -1 );
        } else {
            best_vectors.emplace_back( values, desired_direction );
        }
    };

    if ( vectors.empty() ) {
        std::vector< int > values( submatrix.get_dimensions().second, 1 );
        add_to_best_vectors( values );
    } else {
        for ( auto& [ vector, hits ] : vectors ) {
            equation modified_vector = vector;

            for ( auto& value : modified_vector.values ) {
                if ( value != 0 ) {
                    value = 1;
                }
            }

            add_to_best_vectors( modified_vector.values );
        }
    }

    if ( best_vectors.empty() ) {
        return std::nullopt;
    }

    return best_vectors;
}

// ------------------------------------------------------------------------------------------------
std::optional< std::vector< equation > >
fuzzing::iid_node_dependence_props::get_best_vectors( equation_matrix& submatrix, int number_of_vectors )
{
    TMPROF_BLOCK();

    const std::unordered_map< equation, int >& vectors = submatrix.compute_vectors_with_hits();
    if ( vectors.empty() ) {
        return std::nullopt;
    }

    if ( iid_dependencies::verbose ) {
        for ( const auto& [ vector, hits ] : vectors ) {
            std::cout << "Vector: ";
            for ( const auto& value : vector.values ) {
                std::cout << value << " ";
            }
            std::cout << "-> Best Value: " << vector.best_value << " (" << hits << ")" << std::endl;
        }
    }


    int desired_vector_direction = submatrix.get_desired_vector_direction();
    float biggest_branching_value = submatrix.get_biggest_branching_value();
    std::vector< equation > best_vectors =
        compute_best_vectors( vectors, number_of_vectors, desired_vector_direction, biggest_branching_value );

    if ( best_vectors.empty() ) {
        return std::nullopt;
    }


    if ( iid_dependencies::verbose ) {
        for ( const auto& vector : best_vectors ) {
            std::cout << "Vector: ";
            for ( const auto& value : vector.values ) {
                std::cout << value << " ";
            }
            std::cout << "-> Best Value: " << vector.best_value << std::endl;
        }
    }

    return best_vectors;
}

// ------------------------------------------------------------------------------------------------
generated_path iid_node_dependence_props::return_empty_path()
{
    stats.failed_generations++;
    stats.failed_generations_in_row++;
    return generated_path();
}

// ------------------------------------------------------------------------------------------------
generated_path iid_node_dependence_props::return_path( const generated_path& path )
{
    stats.failed_generations_in_row = 0;
    if ( stats.state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA ) {
        stats.successful_generations_artificial_data++;
    } else {
        stats.successful_generations++;
    }

    if ( stats.state == generation_state::STATE_GENERATION_MORE ) {
        stats.generated_after_covered++;

        if ( stats.generated_after_covered > stats.generated_after_covered_max ) {
            stats.state = generation_state::STATE_COVERED;
        }
    }

    if ( stats.state == generation_state::STATE_GENERATION_DATA_FOR_NEXT_NODE ) {
        stats.generated_for_other_node++;

        if ( stats.generated_for_other_node > stats.generated_for_other_node_max ) {
            stats.state = generation_state::STATE_COVERED;
            stats.generated_for_other_node = 0;
        }
    }

    if ( stats.state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA ) {
        stats.generate_artificial_data++;

        if ( stats.generate_artificial_data > stats.generate_artificial_data_max ) {
            stats.state = generation_state::STATE_NOT_COVERED;
            stats.generate_artificial_data = 0;
        }
    }

    return path;
}

// ------------------------------------------------------------------------------------------------
void iid_node_dependence_props::compute_node_counts_for_nested_loops(
    nodes_to_counts& path_counts,
    std::map< location_id::id_type, int >& child_loop_counts,
    location_id::id_type loop_head_id,
    int minimum_count,
    const loop_dependencies& loop_to_properties,
    bool use_random )
{
    TMPROF_BLOCK();

    INVARIANT( !child_loop_counts.empty() );

    int max_child_count =
        std::max_element( child_loop_counts.begin(), child_loop_counts.end(), []( const auto& a, const auto& b ) {
            return a.second < b.second;
        } )->second;

    std::set< int > possible_counts;

    for ( int i = minimum_count; i <= max_child_count; ++i ) {
        bool is_good = true;
        for ( const auto& [ node_id, count ] : child_loop_counts ) {
            if ( count % i != 0 ) {
                is_good = false;
                break;
            }
        }

        if ( is_good ) {
            possible_counts.insert( i );
        }
    }

    if ( possible_counts.empty() ) {
        path_counts[ loop_head_id ] = { 1, 1 };
        return;
    }

    int highest_count = use_random ? *std::next( possible_counts.begin(), rand() % possible_counts.size() ) :
                                     *possible_counts.rbegin();

    for ( auto& [ node_id, count ] : child_loop_counts ) {
        const loop_properties& props = loop_to_properties.get_props_by_loop_head_id( node_id );

        for ( auto& [ head, _ ] : props.heads ) {
            auto& [ left_count, right_count ] = path_counts[ head.node_id ];

            if ( head.branching_direction ) {
                left_count = count / highest_count;
            } else {
                right_count = count / highest_count;
            }
        }
    }


    const loop_properties& props = loop_to_properties.get_props_by_loop_head_id( loop_head_id );
    for ( auto& [ head, _ ] : props.heads ) {
        if ( head.branching_direction ) {
            path_counts[ head.node_id ] = { highest_count, 1 };
        } else {
            path_counts[ head.node_id ] = { 1, highest_count };
        }
    }
}

// ------------------------------------------------------------------------------------------------
int fuzzing::iid_node_dependence_props::compute_loading_loop_interation(
    nodes_to_counts& path_counts,
    location_id::id_type id,
    const std::set< location_id::id_type >& loop_heads,
    const loop_properties& props,
    const loop_dependencies& loop_to_properties )
{
    TMPROF_BLOCK();

    float average_bits_read = props.bits_read_by_node.at( id ).average_bits_read.mean;
    natural_32_bit offset = props.bits_read_by_node.at( id ).minimal_bit_offset;
    float average_bits_used = props.bits_read_by_node.at( id ).average_bits_used.mean;

    float loaded_per_loop = std::min( props.loaded_bits_per_loop.mean, average_bits_used );
    loaded_per_loop = std::max( loaded_per_loop, 8.0f );

    if ( offset == natural_32_bit( props.loaded_bits_per_loop.mean - average_bits_used ) )
        offset = 0;

    bool is_loop_head = true;
    if ( !loop_heads.contains( id ) ) {
        for ( const auto& loop : loop_to_properties.loops ) {
            for ( const auto& body : loop.bodies ) {
                if ( body.node_id == id ) {
                    id = ( *loop.chosen_loop_head ).node_id;
                    is_loop_head = false;
                }
            }
        }
    }

    int total_count = is_loop_head ? path_counts[ id ].get_total_count() : path_counts[ id ].get_max_count();
    float bits_needed = average_bits_read * total_count + offset;

    return std::ceil( bits_needed / loaded_per_loop );
}

// ------------------------------------------------------------------------------------------------
void iid_node_dependence_props::compute_node_counts_for_loading_loops( nodes_to_counts& path_counts,
                                                                       const equation& path,
                                                                       const std::set< location_id::id_type >& loop_heads,
                                                                       const loop_dependencies& loop_to_properties )
{
    TMPROF_BLOCK();

    for ( const auto& loop_props : std::ranges::views::reverse( loop_to_properties.loops ) ) {
        if ( !loop_props.is_loading_loop ) {
            continue;
        }

        int loop_count = 1;
        std::map< location_id::id_type, int > child_loop_counts;

        for ( const auto& body : loop_props.nodes_dependent_by_loading ) {
            if ( !path_counts.contains( body.node_id ) ) {
                continue;
            }

            int minimal_count = compute_loading_loop_interation(
                path_counts, body.node_id, loop_heads, loop_props, loop_to_properties );
            loop_count = std::max( loop_count, minimal_count );
        }

        for ( const auto& body : loop_props.bodies ) {
            if ( loop_heads.contains( body.node_id ) ) {
                const auto& inner_loop_props = loop_to_properties.get_props_by_loop_head_id( body.node_id );
                if ( inner_loop_props.is_loading_loop ) {
                    loop_count = 1;
                }
            }
        }

        for ( const auto& body : loop_props.bodies ) {
            auto& [ left_count, right_count ] = path_counts[ body.node_id ];

            if ( loop_heads.contains( body.node_id ) ) {
                child_loop_counts[ body.node_id ] = std::max( left_count, right_count );
            } else {
                loop_count = std::max( loop_count, left_count + right_count );
            }
        }

        if ( child_loop_counts.empty() ) {
            for ( const auto& [ head, _ ] : loop_props.heads ) {
                int end_count = head == ( *loop_props.chosen_loop_head ) ? 1 : 0;

                if ( head.branching_direction ) {
                    path_counts[ head.node_id ] = { loop_count, end_count };
                } else {
                    path_counts[ head.node_id ] = { end_count, loop_count };
                }
            }
        } else {
            compute_node_counts_for_nested_loops( path_counts,
                                                  child_loop_counts,
                                                  ( *loop_props.chosen_loop_head ).node_id,
                                                  loop_count,
                                                  loop_to_properties,
                                                  iid_dependencies::random_nested_loop_counts );
        }
    }
}

// ------------------------------------------------------------------------------------------------
void iid_node_dependence_props::compute_node_counts_for_loops( nodes_to_counts& path_counts,
                                                               const equation& path,
                                                               const std::set< location_id::id_type >& loop_heads,
                                                               const loop_dependencies& loop_to_properties,
                                                               const std::unordered_set< location_id::id_type >& subset_ids )
{
    TMPROF_BLOCK();

    for ( const auto& props : std::ranges::views::reverse( loop_to_properties.loops ) ) {
        if ( props.bodies.empty() || props.is_loading_loop ||
             !subset_ids.contains( props.get_smallest_loop_head_id() ) ) {
            continue;
        }

        std::map< location_id::id_type, int > child_loop_counts;
        int non_loop_child_max_count = 1;

        for ( const auto& body : props.bodies ) {
            auto& [ left_count, right_count ] = path_counts[ body.node_id ];

            if ( loop_heads.contains( body.node_id ) ) {
                child_loop_counts[ body.node_id ] = std::max( left_count, right_count );
            } else {
                non_loop_child_max_count = std::max( non_loop_child_max_count, left_count + right_count );
            }
        }

        if ( child_loop_counts.empty() ) {
            continue;
        }

        compute_node_counts_for_nested_loops( path_counts,
                                              child_loop_counts,
                                              ( *props.chosen_loop_head ).node_id,
                                              non_loop_child_max_count,
                                              loop_to_properties,
                                              iid_dependencies::random_nested_loop_counts );
    }
}

// ------------------------------------------------------------------------------------------------
nodes_to_counts
iid_node_dependence_props::compute_node_counts( const equation& path,
                                                std::set< node_id_with_direction > const& computation_subset,
                                                const loop_dependencies& loop_to_properties,
                                                const std::unordered_set< location_id::id_type >& subset_ids )
{
    TMPROF_BLOCK();

    nodes_to_counts path_counts;

    auto leafs = std::vector< node_id_with_direction >( computation_subset.begin(), computation_subset.end() );
    INVARIANT( leafs.size() == path.values.size() );

    for ( int i = 0; i < leafs.size(); ++i ) {
        auto& [ left_count, right_count ] = path_counts[ leafs[ i ].node_id ];
        if ( leafs[ i ].branching_direction ) {
            right_count = path.values[ i ];
        } else {
            left_count = path.values[ i ];
        }
    }

    for ( const auto& loop_props : std::ranges::views::reverse( loop_to_properties.loops ) ) {
        if ( !subset_ids.contains( loop_props.get_smallest_loop_head_id() ) ) {
            continue;
        }

        int loop_count = 0;

        for ( const auto& body : loop_props.bodies ) {
            loop_count = std::max( loop_count, path_counts[ body.node_id ].get_total_count() );
        }

        for ( const auto& head : loop_props.heads ) {
            loop_count = std::max( loop_count, path_counts[ head.first.node_id ].get_total_count() );
        }

        if ( loop_count == 0 ) {
            continue;
        }

        for ( const auto& [ head, _ ] : loop_props.heads ) {
            int end_count = head == ( *loop_props.chosen_loop_head ) ? 1 : 0;

            if ( head.branching_direction ) {
                path_counts[ head.node_id ] = { loop_count, end_count };
            } else {
                path_counts[ head.node_id ] = { end_count, loop_count };
            }
        }
    }

    std::set< location_id::id_type > loop_heads = loop_to_properties.get_loop_heads( false );
    compute_node_counts_for_loops( path_counts, path, loop_heads, loop_to_properties, subset_ids );
    loop_heads = loop_to_properties.get_loop_heads( true );
    compute_node_counts_for_loading_loops( path_counts, path, loop_heads, loop_to_properties );

    return path_counts;
}

// ------------------------------------------------------------------------------------------------
std::vector< equation >
iid_node_dependence_props::compute_best_vectors( const std::unordered_map< equation, int >& vectors_with_hits,
                                                 int number_of_vectors,
                                                 int desired_direction,
                                                 float biggest_branching_value )
{
    TMPROF_BLOCK();

    if ( vectors_with_hits.empty() ) {
        throw std::invalid_argument( "Input map is empty." );
    }

    std::unordered_map< equation, int > filtered_vectors_with_hits;
    if ( desired_direction < 0 ) {
        std::copy_if( vectors_with_hits.begin(),
                      vectors_with_hits.end(),
                      std::inserter( filtered_vectors_with_hits, filtered_vectors_with_hits.end() ),
                      []( const auto& pair ) { return pair.first.best_value < 0; } );
    } else if ( desired_direction > 0 ) {
        std::copy_if( vectors_with_hits.begin(),
                      vectors_with_hits.end(),
                      std::inserter( filtered_vectors_with_hits, filtered_vectors_with_hits.end() ),
                      []( const auto& pair ) { return pair.first.best_value > 0; } );
    } else {
        filtered_vectors_with_hits = vectors_with_hits;
    }

    biggest_branching_value = std::abs( biggest_branching_value );
    std::erase_if( filtered_vectors_with_hits, [ biggest_branching_value ]( const auto& pair ) {
        return std::abs( pair.first.best_value ) > biggest_branching_value;
    } );

    if ( filtered_vectors_with_hits.empty() ) {
        return {};
    }

    std::vector< std::pair< equation, int > > sorted_vectors( filtered_vectors_with_hits.begin(),
                                                              filtered_vectors_with_hits.end() );

    std::sort( sorted_vectors.begin(), sorted_vectors.end(), []( const auto& a, const auto& b ) {
        if ( a.second == b.second ) {
            return std::abs( a.first.best_value ) > std::abs( b.first.best_value );
        }
        return a.second > b.second;
    } );

    if ( sorted_vectors.size() > 5 ) {
        sorted_vectors.erase( sorted_vectors.begin() + 5, sorted_vectors.end() );
    }

    std::sort( sorted_vectors.begin(), sorted_vectors.end(), []( const auto& a, const auto& b ) {
        if ( a.first.get_vector_size() == b.first.get_vector_size() )
            return a.second > b.second;

        return a.first.get_vector_size() < b.first.get_vector_size();
    } );

    std::vector< equation > best_vectors;
    best_vectors.push_back( sorted_vectors[ 0 ].first );

    return best_vectors;
}

// ------------------------------------------------------------------------------------------------
std::unordered_map< equation, int > iid_node_dependence_props::get_linear_dependent_vector(
    const std::unordered_map< equation, int >& vectors_with_hits,
    equation& best_vector )
{
    std::unordered_map< equation, int > dependent_vectors_with_hits;

    for ( const auto& [ vector, hits ] : vectors_with_hits ) {
        if ( best_vector.is_linear_dependent( vector ) ) {
            dependent_vectors_with_hits[ vector ] = hits;
        }
    }

    INVARIANT( !dependent_vectors_with_hits.empty() );
    return dependent_vectors_with_hits;
}

// ------------------------------------------------------------------------------------------------
generated_path iid_node_dependence_props::generate_path_from_node_counts( const nodes_to_counts& path_counts,
                                                                          const loop_dependencies& loop_to_properties )
{
    TMPROF_BLOCK();

    std::map< location_id::id_type, node_props_in_path > path;
    for ( const auto& [ id, counts ] : path_counts ) {
        if ( counts.left_count == 0 && counts.right_count == 0 ) {
            continue;
        }

        bool loop_head_end_direction = false;
        bool is_loop_head = false;

        for ( const auto& loop : loop_to_properties.loops ) {
            for ( const auto& [ head, _ ] : loop.heads ) {
                if ( head.node_id == id ) {
                    is_loop_head = true;
                    loop_head_end_direction = head.branching_direction;
                }
            }
        }

        node_props_in_path props = { counts, is_loop_head, loop_head_end_direction };
        path.emplace( id, props );
    }

    return generated_path( path );
}

//                                 iid_dependencies
// ------------------------------------------------------------------------------------------------
void iid_dependencies::update_ignored_nodes( sensitivity_analysis& sensitivity )
{
    for ( branching_node* node : sensitivity.get_changed_nodes() ) {
        if ( node->is_did_branching() ) {
            location_id::id_type location_id = node->get_location_id().id;
            if ( ignored_node_ids.insert( location_id ).second ) {
                node_id_to_equation_map.erase( location_id );
            }
        }
    }
}

// ------------------------------------------------------------------------------------------------
void iid_dependencies::process_node( branching_node* end_node )
{
    TMPROF_BLOCK();

    end_nodes.push_back( end_node );
}

// ------------------------------------------------------------------------------------------------
void iid_dependencies::remove_node_dependence( location_id id )
{
    auto it = node_id_to_equation_map.find( id );
    if ( it != node_id_to_equation_map.end() ) {
        iid_node_generations_stats& stats = it->second.get_generations_stats();
        stats.state = generation_state::STATE_COVERED;
        covered_node_ids.insert( id );

        if ( iid_dependencies::generate_more_data_after_coverage && !it->second.is_equal_branching_predicate() ) {
            stats.state = generation_state::STATE_GENERATION_MORE;
            int max_generation_after_covered = std::max( iid_dependencies::minimal_max_generation_after_covered,
                                                         stats.successful_generations / 2 );
            stats.generated_after_covered_max = max_generation_after_covered;
        }
    }
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::remove_all_covered( const std::unordered_set< location_id >& covered_branchings )
{
    std::set< location_id > covered_ids;
    for ( const auto& branching : covered_branchings ) {
        covered_ids.insert( branching.id );
    }

    for ( auto it = node_id_to_equation_map.begin(); it != node_id_to_equation_map.end(); ) {
        if ( covered_ids.contains( it->first ) &&
             it->second.get_generations_stats().state == generation_state::STATE_NOT_COVERED ) {
            covered_node_ids.insert( it->first );
            iid_node_generations_stats& stats = it->second.get_generations_stats();
            stats.state = generation_state::STATE_COVERED_BY_OTHER;
        }

        ++it;
    }
}

// ------------------------------------------------------------------------------------------------
iid_node_dependence_props& iid_dependencies::get_props( location_id id )
{
    return node_id_to_equation_map.at( id );
}

// ------------------------------------------------------------------------------------------------
std::vector< location_id > iid_dependencies::get_iid_nodes()
{
    std::vector< location_id > result;
    for ( const auto& [ key, _ ] : node_id_to_equation_map ) {
        result.push_back( key );
    }

    std::sort( result.begin(), result.end() );
    return result;
}

// ------------------------------------------------------------------------------------------------
std::optional< location_id > iid_dependencies::get_next_iid_node()
{
    TMPROF_BLOCK();

    std::vector< location_id > all_non_covered;
    std::vector< location_id > possible_nodes;

    for ( auto it = node_id_to_equation_map.begin(); it != node_id_to_equation_map.end(); ++it ) {
        iid_node_dependence_props& props = it->second;

        auto& stats = props.get_generations_stats();

        if ( !props.is_covered() )
            all_non_covered.push_back( it->first );

        if ( stats.last_failed_method == failed_generation_method::METHOD_DO_NOT_GENERATE ) {
            stats.do_not_generate_counter++;
        }

        if ( props.too_much_failed_in_row() ) {
            stats.failed_generations_in_row = 0;
            stats.do_not_generate_counter = 0;

            failed_generation_method recovery_method = props.determine_recovery_strategy();
            auto prev_it = std::prev( it );

            if ( recovery_method == failed_generation_method::METHOD_GENERATE_ARTIFICIAL_DATA ) {
                props.set_as_generating_artificial_data( iid_dependencies::minimal_max_generation_artificial_data );
                stats.last_failed_method = failed_generation_method::METHOD_GENERATE_ARTIFICIAL_DATA;
            } else if ( prev_it != node_id_to_equation_map.end() &&
                        recovery_method == failed_generation_method::METHOD_GENERATE_FROM_OTHER_NODE ) {
                iid_node_dependence_props& prev_props = prev_it->second;
                prev_props.set_as_generating_for_other_node(
                    iid_dependencies::minimal_max_generation_for_other_node );
                possible_nodes.push_back( prev_it->first );
                stats.last_failed_method = failed_generation_method::METHOD_GENERATE_FROM_OTHER_NODE;
            } else {
                stats.last_failed_method = failed_generation_method::METHOD_DO_NOT_GENERATE;
            }
        }

        if ( props.should_generate_new( loop_to_properties ) ) {
            possible_nodes.push_back( it->first );
        }
    }

    if ( possible_nodes.empty() ) {
        if ( verbose )
            std::cout << "No more nodes to generate." << std::endl;

        if ( generate_for_bad_nodes && !all_non_covered.empty() ) {
            return random_node_selection ? all_non_covered[ rand() % all_non_covered.size() ] :
                                           all_non_covered[ 0 ];
        }

        return std::nullopt;
    }

    if ( verbose ) {
        std::cout << "Possible nodes to generate: ";
        for ( const auto& node : possible_nodes ) {
            std::cout << node << " ";
        }
        std::cout << std::endl;
    }

    return iid_dependencies::random_node_selection ? possible_nodes[ rand() % possible_nodes.size() ] :
                                                     possible_nodes[ 0 ];
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::compute_dependencies()
{
    TMPROF_BLOCK();

    dependencies_computed++;

    for ( branching_node* end_node : end_nodes ) {
        auto it = node_id_to_equation_map.find( end_node->get_location_id() );
        if ( it != node_id_to_equation_map.end() &&
             ( it->second.get_generations_stats().state == generation_state::STATE_COVERED ||
               it->second.get_generations_stats().state == generation_state::STATE_COVERED_BY_OTHER ) ) {
            continue;
        }

        loop_head_to_bodies_t loop_heads_to_bodies;
        loop_endings loop_heads_ending = get_loop_heads_ending( end_node, loop_heads_to_bodies );

        compute_dependencies_by_loops( loop_heads_to_bodies, loop_heads_ending );
        compute_dependencies_by_loading( end_node, loop_heads_to_bodies, loop_heads_ending );

        for ( auto& loop : loop_to_properties.loops ) {
            loop.set_chosen_loop_head();
        }

        compute_paths( end_node );
    }

    end_nodes.clear();
}

// ------------------------------------------------------------------------------------------------
generated_path fuzzing::iid_dependencies::generate_probabilities()
{
    TMPROF_BLOCK();
    std::optional< location_id > id = get_next_iid_node();
    if ( !id.has_value() ) {
        if ( verbose )
            std::cout << "No more nodes to generate probabilities for." << std::endl;

        return {};
    }

    if ( verbose ) {
        std::cout << "Generating probabilities for node: " << *id << std::endl;
    }

    iid_node_dependence_props& props = get_props( id.value() );
    generated_path path = props.generate_probabilities( loop_to_properties );

    if ( !path.empty() ) {
        path.set_iid_node_id( id.value() );
    }

    return path;
}

// ------------------------------------------------------------------------------------------------
iid_vector_analysis_statistics fuzzing::iid_dependencies::get_stats() const
{
    iid_vector_analysis_statistics stats;

    for ( const auto& [ id, props ] : node_id_to_equation_map ) {
        iid_vector_analysis_statistics_per_node node_stats;
        node_stats.generation_stats = props.get_generations_stats();
        node_stats.node_ids = std::vector< location_id::id_type >( props.get_matrix().get_node_ids().begin(),
                                                                   props.get_matrix().get_node_ids().end() );
        std::sort( node_stats.node_ids.begin(), node_stats.node_ids.end() );
        node_stats.vector_dimensions = props.get_matrix().get_dimensions();
        node_stats.matrix_generated = props.is_matrix_generated();
        stats.iid_nodes_stats[ id ] = node_stats;
    }

    stats.ignored_node_ids = std::vector< location_id::id_type >( ignored_node_ids.begin(),
                                                                  ignored_node_ids.end() );
    std::sort( stats.ignored_node_ids.begin(), stats.ignored_node_ids.end() );

    stats.covered_node_ids = std::vector< location_id >( covered_node_ids.begin(), covered_node_ids.end() );
    std::sort( stats.covered_node_ids.begin(), stats.covered_node_ids.end() );

    stats.loop_to_properties = loop_to_properties;
    stats.processed_nodes = processed_nodes;
    stats.dependencies_computed = dependencies_computed;
    return stats;
}

// ------------------------------------------------------------------------------------------------
loop_endings fuzzing::iid_dependencies::get_loop_heads_ending( branching_node* end_node,
                                                               loop_head_to_bodies_t& loop_heads_to_bodies )
{
    TMPROF_BLOCK();

    std::vector< fuzzer::loop_boundary_props > loops;
    fuzzer::detect_loops_along_path_to_node( end_node, loop_heads_to_bodies, &loops );

    loop_endings loop_heads_ending;

    auto is_outside_loop = [ & ]( branching_node* successor,
                                  location_id loop_head_id,
                                  const std::unordered_set< location_id >& loop_bodies ) {
        if ( successor == nullptr ) {
            return false;
        }

        if ( successor->get_location_id() == loop_head_id ) {
            return false;
        }

        return !loop_bodies.contains( successor->get_location_id().id );
    };

    for ( const auto& loop : loops ) {
        location_id loop_head_id = loop.exit->get_location_id();

        const auto& loop_bodies = loop_heads_to_bodies.at( loop_head_id );

        branching_node* left_successor = loop.exit->successor( false ).pointer;
        branching_node* right_successor = loop.exit->successor( true ).pointer;

        if ( is_outside_loop( left_successor, loop_head_id, loop_bodies ) ) {
            loop_heads_ending[ loop.exit->get_location_id().id ] = false;
        } else if ( is_outside_loop( right_successor, loop_head_id, loop_bodies ) ) {
            loop_heads_ending[ loop.exit->get_location_id().id ] = true;
        }
    }

    return loop_heads_ending;
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::compute_dependencies_by_loading( branching_node* end_node,
                                                                 const loop_head_to_bodies_t& loop_heads_to_bodies,
                                                                 const loop_endings& loop_heads_ending )
{
    TMPROF_BLOCK();

    loop_head_to_loaded_bits_counter loading_loops;
    compute_loading_loops( end_node, loop_heads_to_bodies, loading_loops, loop_heads_ending );

    struct dependent_body_props {
        natural_32_bit min = std::numeric_limits< natural_32_bit >::max();
        natural_32_bit max = std::numeric_limits< natural_32_bit >::min();
        std::vector< natural_32_bit > sensitive_stdin_bit_counts;
        std::unordered_set< stdin_bit_index > sensitivity_bits = {};
    };

    std::unordered_map< location_id::id_type, std::unordered_map< location_id::id_type, dependent_body_props > > loop_head_to_props;
    std::unordered_map< location_id::id_type, dependent_body_props > node_id_to_props;

    branching_node* node = end_node;

    while ( node != nullptr ) {
        const auto node_id = node->get_location_id().id;
        const auto& sensitive_bits = node->sensitive_stdin_bits;
        if ( sensitive_bits.empty() ) {
            node = node->predecessor;
            continue;
        }

        auto& props = node_id_to_props[ node_id ];
        auto min_it = std::min_element( sensitive_bits.begin(), sensitive_bits.end() );
        auto max_it = std::max_element( sensitive_bits.begin(), sensitive_bits.end() );
        natural_32_bit node_min = ( min_it != sensitive_bits.end() ) ?
                                      *min_it :
                                      std::numeric_limits< natural_32_bit >::max();
        natural_32_bit node_max = ( max_it != sensitive_bits.end() ) ?
                                      *max_it :
                                      std::numeric_limits< natural_32_bit >::min();

        props.min = std::min( props.min, node_min );
        props.max = std::max( props.max, node_max );
        props.sensitive_stdin_bit_counts.push_back( sensitive_bits.size() );
        props.sensitivity_bits.insert( sensitive_bits.begin(), sensitive_bits.end() );

        node = node->predecessor;
    }

    for ( const auto& [ node_id, props ] : node_id_to_props ) {
        const auto& [ node_min, node_max, sensitive_counts, sensitive_bits ] = props;

        for ( const auto& [ loop_head, loop_props ] : loading_loops ) {
            if ( !loop_heads_ending.contains( loop_head ) ) {
                continue;
            }

            if ( node_max >= loop_props.min && node_min < loop_props.max ) {
                auto& loop_body_props = loop_head_to_props[ loop_head ][ node_id ];
                loop_body_props.min = std::min( loop_body_props.min, node_min );
                loop_body_props.max = std::max( loop_body_props.max, node_max );
                loop_body_props.sensitive_stdin_bit_counts.insert( loop_body_props.sensitive_stdin_bit_counts.end(),
                                                                   sensitive_counts.begin(),
                                                                   sensitive_counts.end() );
                loop_body_props.sensitivity_bits.insert( sensitive_bits.begin(), sensitive_bits.end() );
            }
        }
    }

    for ( const auto& [ loop_head_id, body ] : loop_head_to_props ) {
        const auto& loading_props = loading_loops.at( loop_head_id );
        natural_32_bit loaded_bits = loading_props.max - loading_props.min;

        if ( loading_props.loop_count == 0 || loaded_bits == 0 ) {
            continue;
        }

        double per_loop = double( loaded_bits ) / double( loading_props.loop_count );

        loop_properties& dependencies = loop_to_properties.get_props_by_loop_head_id( loop_head_id );
        dependencies.is_loading_loop = true;
        dependencies.loaded_bits_per_loop.add( per_loop );

        bool loop_head_end_direction = loop_heads_ending.at( loop_head_id );

        for ( const auto& [ body_id, props ] : body ) {
            auto& body_props = dependencies.bits_read_by_node[ body_id ];

            for ( const auto& [ start, end ] : loading_props.loaded_intervals ) {
                int count = 0;
                for ( int i = start; i < end; ++i ) {
                    if ( props.sensitivity_bits.contains( i ) ) {
                        count++;
                    }
                }

                if ( count == 0 ) {
                    continue;
                }

                body_props.average_bits_used.add( count );
            }

            natural_32_bit minimal_offset = props.min - loading_props.min;
            if ( props.min < loading_props.min ) {
                minimal_offset = 0;
            }

            INVARIANT( minimal_offset >= 0 );
            body_props.minimal_bit_offset = std::min( body_props.minimal_bit_offset, minimal_offset );

            for ( const auto& count : props.sensitive_stdin_bit_counts ) {
                body_props.average_bits_read.add( count );
            }

            for ( bool direction : { true, false } ) {
                node_id_with_direction node_id_direction = { body_id, direction };
                dependencies.nodes_dependent_by_loading.insert( node_id_direction );
            }
        }
    }
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::compute_dependencies_by_loops( const loop_head_to_bodies_t& loop_heads_to_bodies,
                                                               const loop_endings& loop_heads_ending )
{
    TMPROF_BLOCK();

    bool changed = false;

    for ( const auto& [ loop_head, loop_bodies ] : loop_heads_to_bodies ) {
        location_id::id_type loop_head_id = loop_head.id;

        auto loop_heads_ending_it = loop_heads_ending.find( loop_head_id );
        if ( loop_heads_ending_it == loop_heads_ending.end() ) {
            continue;
        }
        bool loop_head_end_direction = loop_heads_ending_it->second;

        node_id_with_direction loop_head_direction = { loop_head_id, loop_head_end_direction };

        std::unordered_set< location_id::id_type > all_ids;

        all_ids.reserve( loop_bodies.size() + 1 );
        all_ids.insert( loop_head_id );

        std::vector< location_id::id_type > temp_ids;
        temp_ids.reserve( loop_bodies.size() );
        std::transform( loop_bodies.begin(),
                        loop_bodies.end(),
                        std::back_inserter( temp_ids ),
                        []( const auto& loop_body ) { return loop_body.id; } );

        all_ids.insert( temp_ids.begin(), temp_ids.end() );

        loop_properties& props = loop_to_properties.get_props( all_ids, loop_head_id );

        auto [ props_heads_it, inserted ] = props.heads.insert( { loop_head_direction, {} } );
        props_heads_it->second.count++;
        changed |= inserted;

        const std::unordered_set< location_id::id_type >& all_props_ids = props.get_all_ids();

        for ( const auto& body : loop_bodies ) {
            if ( all_props_ids.contains( body.id ) || loop_head.context_hash != body.context_hash ) {
                continue;
            }

            for ( bool direction : { true, false } ) {
                auto [ it, inserted ] = props.bodies.emplace( body.id, direction );
                changed |= inserted;
            }
        }
    }

    if ( changed ) {
        loop_to_properties.merge_properties();

        std::sort( loop_to_properties.loops.begin(),
                   loop_to_properties.loops.end(),
                   []( const auto& a, const auto& b ) {
                       return a.get_smallest_loop_head_id() < b.get_smallest_loop_head_id();
                   } );
    }
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::compute_loading_loops( branching_node* end_node,
                                                       const loop_head_to_bodies_t& loop_heads_to_bodies,
                                                       loop_head_to_loaded_bits_counter& loading_loops,
                                                       const loop_endings& loop_heads_ending )
{
    TMPROF_BLOCK();

    for ( const auto& [ loop_head, loop_bodies ] : loop_heads_to_bodies ) {
        loading_loops[ loop_head.id ] = {
            std::numeric_limits< natural_32_bit >::max(), std::numeric_limits< natural_32_bit >::min(), 0, {}
        };
    }

    branching_node* node = end_node;
    while ( node != nullptr ) {
        location_id node_id = node->get_location_id();

        if ( auto it = loop_heads_to_bodies.find( node_id ); it != loop_heads_to_bodies.end() ) {
            auto& props = loading_loops[ node_id.id ];

            natural_32_bit bits_count = node->get_num_stdin_bits();

            if ( props.min != std::numeric_limits< natural_32_bit >::max() )
                props.loaded_intervals.insert( { bits_count, props.min } );

            props.min = std::min( props.min, bits_count );
            props.max = std::max( props.max, bits_count );
            props.loop_count++;
        }

        if ( node->predecessor != nullptr ) {
            branching_node* predecessor = node->predecessor;
            const auto predecessor_id = predecessor->get_location_id().id;

            if ( auto it = loop_heads_ending.find( predecessor_id ); it != loop_heads_ending.end() ) {
                bool node_direction = predecessor->successor( true ).pointer == node;
                if ( it->second == node_direction )
                    loading_loops[ predecessor_id ].loop_count--;
            }
        }

        node = node->predecessor;
    }

    // Remove all loops that did not load any data inside
    for ( auto it = loading_loops.begin(); it != loading_loops.end(); ) {
        if ( it->second.min == it->second.max ) {
            it = loading_loops.erase( it );
        } else {
            ++it;
        }
    }
}

// ------------------------------------------------------------------------------------------------
void fuzzing::iid_dependencies::compute_paths( branching_node* end_node )
{
    TMPROF_BLOCK();

    INVARIANT( end_node != nullptr );

    branching_node* current_node = end_node;
    while ( current_node->predecessor != nullptr ) {
        current_node = current_node->predecessor;
    }

    std::vector< node_id_with_direction > full_path = get_path( end_node );
    path_id_direction_count directions_in_path( iid_dependencies::biggest_node_id * 2 + 2 );
    std::size_t max_directions_in_path_index = 0;

    for ( auto it = full_path.rbegin(); it != full_path.rend(); ++it ) {
        processed_nodes++;
        const auto& path_node = *it;

        std::size_t index = 2 * path_node.node_id + ( path_node.branching_direction ? 1 : 0 );
        directions_in_path[ index ]++;

        max_directions_in_path_index = std::max( max_directions_in_path_index, index );

        current_node = current_node->successor( path_node.branching_direction ).pointer;
        location_id current_node_id = current_node->get_location_id();

        if ( !is_tracked( current_node_id ) ) {
            continue;
        }

        iid_node_dependence_props& props = node_id_to_equation_map[ current_node_id ];
        props.process_path_effective( current_node, directions_in_path, max_directions_in_path_index );
    }
}

// ------------------------------------------------------------------------------------------------
std::vector< node_id_with_direction > fuzzing::iid_dependencies::get_path( branching_node* end_node )
{
    TMPROF_BLOCK();

    std::vector< node_id_with_direction > result;

    bool iid_seen = false;
    branching_node* current = end_node;

    while ( current != nullptr ) {
        branching_node* predecessor = current->predecessor;
        iid_seen = iid_seen || is_tracked( current->get_location_id() );

        if ( iid_seen && predecessor != nullptr ) {
            node_id_with_direction nav = { predecessor->get_location_id().id,
                                           predecessor->successor_direction( current ) };
            result.push_back( nav );
        }

        current = predecessor;
    }

    return result;
}

// ------------------------------------------------------------------------------------------------
bool fuzzing::iid_dependencies::is_tracked( location_id id ) const
{
    TMPROF_BLOCK();

    return !ignored_node_ids.contains( id.id ) && !covered_node_ids.contains( id );
}

//                               non member functions
// ------------------------------------------------------------------------------------------------
std::pair< path_id_direction_count, std::size_t > get_directions_in_path( branching_node* node )
{
    TMPROF_BLOCK();

    path_id_direction_count result( iid_dependencies::biggest_node_id * 2 + 2 );
    std::size_t max_directions_in_path_index = 0;

    branching_node* current = node;
    while ( current != nullptr ) {
        branching_node* predecessor = current->predecessor;
        if ( predecessor != nullptr ) {
            int id = predecessor->get_location_id().id;
            bool direction = predecessor->successor_direction( current );
            std::size_t index = 2 * id + ( direction ? 1 : 0 );

            result[ index ]++;
            max_directions_in_path_index = std::max( max_directions_in_path_index, index );
        }

        current = predecessor;
    }

    return { result, max_directions_in_path_index };
}

// ------------------------------------------------------------------------------------------------
bool should_generate_more_data( const generation_state& state )
{
    return state == generation_state::STATE_GENERATION_MORE ||
           state == generation_state::STATE_GENERATION_DATA_FOR_NEXT_NODE ||
           state == generation_state::STATE_GENERATING_ARTIFICIAL_DATA;
}

} // namespace fuzzing
