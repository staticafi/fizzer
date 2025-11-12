#pragma once

#include <array>
#include <iostream>
#include <map>
#include <optional>
#include <set>
#include <unordered_map>
#include <vector>

#include <fuzzing/branching_node.hpp>


namespace fuzzing
{
template < typename T >
struct mean_counter {
    T mean;
    int count;

    void add( T value );
};

struct node_id_with_direction {
    location_id node_id;
    bool branching_direction;

    auto operator<=>( node_id_with_direction const& other ) const;
    bool operator==( node_id_with_direction const& other ) const = default;
    friend std::ostream& operator<<( std::ostream& os, const node_id_with_direction& nav )
    {
        return os << nav.node_id << " " << ( nav.branching_direction ? "True" : "False" );
    }
};

enum generation_state {
    STATE_NOT_COVERED,
    STATE_GENERATING_ARTIFICIAL_DATA,
    STATE_GENERATION_MORE,
    STATE_COVERED,
    STATE_GENERATION_DATA_FOR_NEXT_NODE,

    STATE_COVERED_BY_OTHER
};

enum failed_generation_method {
    METHOD_NONE,
    METHOD_GENERATE_FROM_OTHER_NODE,
    METHOD_GENERATE_ARTIFICIAL_DATA,
    METHOD_DO_NOT_GENERATE
};

struct iid_node_generations_stats {
    int method_calls = 0;
    int generation_starts = 0;
    int successful_generations = 0;
    int successful_generations_artificial_data = 0;
    int failed_generations = 0;

    int generated_for_other_node_count = 0;
    int generate_artificial_data_count = 0;

    // Not saved values, because they are cleared multiple times through out the run
    int failed_generations_in_row = 0;

    int generated_after_covered_max = 0;
    int generated_after_covered = 0;

    int generated_for_other_node = 0;
    int generated_for_other_node_max = 0;

    int generate_artificial_data = 0;
    int generate_artificial_data_max = 0;

    int do_not_generate_counter = 0;

    generation_state state = generation_state::STATE_NOT_COVERED;

    failed_generation_method last_failed_method = METHOD_NONE;
};

struct loaded_bits_props {
    mean_counter< float > average_bits_read;
    natural_32_bit minimal_bit_offset = std::numeric_limits< natural_32_bit >::max();
    mean_counter< float > average_bits_used;
};

struct loop_head_properties {
    int count;
};

struct loop_properties {
    std::optional< node_id_with_direction > chosen_loop_head;
    std::map< node_id_with_direction, loop_head_properties > heads;
    std::set< node_id_with_direction > bodies;

    bool is_loading_loop;
    std::set< node_id_with_direction > nodes_dependent_by_loading;
    mean_counter< float > loaded_bits_per_loop;
    std::map< location_id, loaded_bits_props > bits_read_by_node;

    bool is_same( const std::unordered_set< location_id >& other_ids ) const;
    const std::unordered_set< location_id >& get_all_ids() const;
    const std::unordered_set< location_id >& get_loop_head_ids() const;
    location_id get_smallest_loop_head_id() const;
    std::optional< location_id > get_smallest_body_id() const;
    location_id get_smallest_id() const;
    void set_chosen_loop_head();
    void update_stored_ids();

private:
    std::unordered_set< location_id > all_ids = {};
    std::unordered_set< location_id > loop_head_ids = {};
};

struct loop_dependencies {
    std::vector< loop_properties > loops;

    loop_properties& get_props( const std::unordered_set< location_id >& ids,
                                location_id loop_head_id );
    void merge_properties();
    const loop_properties& get_props_by_loop_head_id( location_id loop_head_id ) const;
    loop_properties& get_props_by_loop_head_id( location_id loop_head_id );
    std::set< location_id > get_loop_heads( bool include_loading_loops ) const;
    bool compute_node_subsets_for_computation( std::set< node_id_with_direction >& computation_subset,
                                               const std::unordered_set< location_id >& matrix_ids ) const;
    void print_dependencies() const;
};

struct iid_vector_analysis_statistics_per_node {
    iid_node_generations_stats generation_stats;
    std::pair< std::size_t, std::size_t > vector_dimensions;
    std::vector< location_id > node_ids;
    bool matrix_generated;
};

struct iid_vector_analysis_statistics {
    std::map< location_id, iid_vector_analysis_statistics_per_node > iid_nodes_stats;
    std::vector< location_id > ignored_node_ids;
    std::vector< location_id > covered_node_ids;
    loop_dependencies loop_to_properties;
    int processed_nodes;
    int dependencies_computed;
};


struct node_counts {
    int left_count;
    int right_count;

    int get_max_count() const;
    int get_total_count() const { return left_count + right_count; }
};


struct node_props_in_path {
    node_props_in_path( node_counts computed_counts, bool is_loop_head, bool loop_head_end_direction )
        : computed_counts( computed_counts )
        , taken_counts( { 0, 0 } )
        , is_loop_head( is_loop_head )
        , loop_head_end_direction( loop_head_end_direction )
    {}

    bool get_desired_direction() const;
    bool can_go_direction( bool direction ) const;
    void go_direction( bool direction );
    bool can_take_next_direction() const;

    float_32_bit get_false_direction_probability() const;

    friend std::ostream& operator<<( std::ostream& os, const node_props_in_path& eq )
    {
        os << "L-" << eq.computed_counts.left_count << " R-" << eq.computed_counts.right_count;
        if ( eq.is_loop_head ) {
            os << " " << ( eq.loop_head_end_direction ? "R" : "L" );
        }

        return os;
    }

private:
    node_counts computed_counts;
    node_counts taken_counts;
    bool is_loop_head;
    bool loop_head_end_direction;

    bool get_preferred_direction_loop_head() const;
};


struct generated_path {
    generated_path( std::map< location_id, node_props_in_path > path )
        : path( std::move( path ) )
        , iid_node_id( std::nullopt )
    {}

    generated_path() = default;

    bool contains( location_id id ) const;
    std::map< location_id, node_props_in_path > get_path() const;
    node_props_in_path& get_props( location_id id ) { return path.at( id ); }
    std::optional< location_id > get_iid_node_id() const { return iid_node_id; }
    void set_iid_node_id( location_id iid_node_id ) { this->iid_node_id = iid_node_id; }
    bool empty() const { return path.empty(); }

    friend std::ostream& operator<<( std::ostream& os, const generated_path& eq )
    {
        for ( const auto& [ id, props ] : eq.path ) {
            os << id << ": " << props << std::endl;
        }

        return os;
    }

private:
    std::map< location_id, node_props_in_path > path;
    std::optional< location_id > iid_node_id;
};

struct equation {
    equation( std::vector< int > values, double best_value )
        : values( std::move( values ) )
        , best_value( best_value )
    {}

    std::vector< int > values;
    double best_value;

    equation operator+( const equation& other ) const;
    equation operator+( int scalar ) const;
    equation operator-( const equation& other ) const;
    equation operator*( int scalar ) const;
    equation operator*( double scalar ) const;
    equation operator/( const equation& other ) const;
    auto operator<=>( const equation& other ) const = default;
    bool operator==( const equation& other ) const = default;

    equation add_to_positive( int value ) const;
    equation add_to_values( const equation& other ) const;
    int simplify_by_gcd();
    int get_vector_size() const;
    int get_one_way_branching_count() const;
    int get_biggest_value() const;
    bool is_any_negative() const;
    bool same_values() const;
    bool is_linear_dependent( const equation& other ) const;


    friend std::ostream& operator<<( std::ostream& os, const equation& eq )
    {
        for ( int i = 0; i < eq.values.size(); ++i ) {
            os << ( i ? " " : "" ) << eq.values[ i ];
        }
        return os << " -> " << eq.best_value;
    }
};
} // namespace fuzzing

namespace std
{
template <>
struct hash< fuzzing::node_id_with_direction > {
    std::size_t operator()( const fuzzing::node_id_with_direction& key ) const noexcept
    {
        std::size_t h1 = std::hash< fuzzing::location_id >{}( key.node_id );
        std::size_t h2 = std::hash< bool >{}( key.branching_direction );
        return h1 ^ ( h2 << 1 );
    }
};

template <>
struct hash< fuzzing::equation > {
    std::size_t operator()( const fuzzing::equation& eq ) const noexcept
    {
        std::size_t h1 = std::hash< double >{}( eq.best_value );
        for ( int val : eq.values ) {
            h1 ^= std::hash< int >{}( val ) + 0x9e3779b9 + ( h1 << 6 ) + ( h1 >> 2 );
        }
        return h1;
    }
};
} // namespace std


namespace fuzzing
{
struct loaded_bits_counter {
    natural_32_bit min;
    natural_32_bit max;
    int loop_count;

    std::set< std::pair< natural_32_bit, natural_32_bit > > loaded_intervals;
};

struct FloatComparator {
    bool operator()( const float& a, const float& b ) const
    {
        const float epsilon = 1e-6f;
        return std::abs( a - b ) > epsilon && std::abs( a ) < std::abs( b );
    }
};


using path_id_direction_count = std::vector< location_id >;
using loop_head_to_loaded_bits_counter = std::unordered_map< location_id, loaded_bits_counter >;
using loop_endings = std::unordered_map< location_id, bool >;
using loop_head_to_bodies_t = std::unordered_map< location_id, std::unordered_set< location_id > >;
using nodes_to_counts = std::map< location_id, node_counts >;

struct equation_matrix {
    equation_matrix get_submatrix( std::set< node_id_with_direction > const& subset ) const;
    void process_node( branching_node* end_node,
                       bool compute_matrix,
                       const path_id_direction_count& directions_in_path,
                       bool add_columns,
                       std::size_t max_directions_in_path_index );
    void start_compute_matrix();
    bool contains( node_id_with_direction const& node ) const;
    std::pair< std::size_t, std::size_t > get_dimensions() const;
    const std::unordered_map< equation, int >& compute_vectors_with_hits();
    std::vector< equation >& get_matrix();
    std::optional< equation > get_new_subset_counts_from_vectors( const std::vector< equation >& vector,
                                                                  const iid_node_generations_stats& state );
    int get_desired_vector_direction() const;
    float get_biggest_branching_value() const;
    const std::unordered_set< location_id >& get_node_ids() const;
    bool empty() const { return matrix.empty(); }

    void print_matrix();

    atomic_predicate get_branching_predicate() const;
    int get_number_of_different_branchings() const { return branching_values.size(); }

    std::map< double, int, FloatComparator > branching_values;

    std::vector< std::map< int, int > > vector_counts_histogram;

private:
    void add_path( branching_node* end_node,
                   const path_id_direction_count& directions_in_path,
                   bool add_columns,
                   std::size_t max_directions_in_path_index );

    std::vector< equation > matrix;
    std::unordered_set< equation > unique_rows;
    std::vector< branching_node* > all_paths;
    std::vector< node_id_with_direction > nodes;
    std::unordered_set< location_id > node_ids;

    std::unordered_set< equation > vectors;
    std::unordered_map< equation, int > vectors_with_hits;
    int computed_vectors = 0;
};

struct iid_node_dependence_props {
    generated_path generate_probabilities( const loop_dependencies& loop_to_properties );
    void process_path_effective( branching_node* end_node,
                                 const path_id_direction_count& directions_in_path,
                                 std::size_t max_directions_in_path_index );
    iid_node_generations_stats& get_generations_stats() { return stats; }
    const equation_matrix& get_matrix() const { return matrix; }
    const iid_node_generations_stats& get_generations_stats() const { return stats; }

    bool is_covered() const;
    bool should_generate_new( const loop_dependencies& loop_to_properties ) const;
    failed_generation_method determine_recovery_strategy();
    bool too_much_failed_in_row();
    void set_as_generating_for_other_node( int minimal_max_generation_for_other_node );
    void set_as_generating_artificial_data( int minimal_max_generation_artificial_data );
    bool is_equal_branching_predicate() const;
    bool is_matrix_generated() const { return matrix_generated; }

    void print_stats( bool only_state = false ) const;


private:
    std::optional< std::vector< equation > > generate_vectors_if_not_enough_data( equation_matrix& submatrix );
    std::optional< std::vector< equation > > get_best_vectors( equation_matrix& submatrix, int number_of_vectors );
    generated_path return_empty_path();
    generated_path return_path( const generated_path& path );
    void compute_node_counts_for_nested_loops( nodes_to_counts& path_counts,
                                               std::map< location_id, int >& child_loop_counts,
                                               location_id loop_head_id,
                                               int minimum_count,
                                               const loop_dependencies& loop_to_properties,
                                               bool use_random = false );
    int compute_loading_loop_interation( nodes_to_counts& path_counts,
                                         location_id id,
                                         const std::set< location_id >& loop_heads,
                                         const loop_properties& props,
                                         const loop_dependencies& loop_to_properties );
    void compute_node_counts_for_loading_loops( nodes_to_counts& path_counts,
                                                const equation& path,
                                                const std::set< location_id >& loop_heads,
                                                const loop_dependencies& loop_to_properties );
    void compute_node_counts_for_loops( nodes_to_counts& path_counts,
                                        const equation& path,
                                        const std::set< location_id >& loop_heads,
                                        const loop_dependencies& loop_to_properties,
                                        const std::unordered_set< location_id >& subset_ids );
    nodes_to_counts compute_node_counts( const equation& path,
                                         const std::set< node_id_with_direction >& all_leafs,
                                         const loop_dependencies& loop_to_properties,
                                         const std::unordered_set< location_id >& subset_ids );
    std::vector< equation > compute_best_vectors( const std::unordered_map< equation, int >& vectors_with_hits,
                                                  int number_of_vectors,
                                                  int desired_direction,
                                                  float biggest_branching_value );
    std::unordered_map< equation, int >
    get_linear_dependent_vector( const std::unordered_map< equation, int >& vectors_with_hits,
                                 equation& best_vector );
    generated_path generate_path_from_node_counts( const nodes_to_counts& path_counts,
                                                   const loop_dependencies& loop_to_properties );

    equation_matrix matrix;
    iid_node_generations_stats stats;

    std::set< node_id_with_direction > computation_subset;
    equation_matrix computation_submatrix;

    bool matrix_generated = false;
};

struct iid_dependencies {
    void update_ignored_nodes( std::unordered_set<fuzzing::branching_node *> const& changed_nodes );
    void process_node_dependence( branching_node* node );
    void process_node( branching_node* end_node );
    void remove_node_dependence( location_id id );
    void remove_all_covered( const std::unordered_set< location_id >& covered_branchings );
    iid_node_dependence_props& get_props( location_id id );
    std::vector< location_id > get_iid_nodes();
    std::optional< location_id > get_next_iid_node();
    void compute_dependencies();

    generated_path generate_probabilities();

    iid_vector_analysis_statistics get_stats() const;

private:
    loop_endings get_loop_heads_ending( branching_node* end_node, loop_head_to_bodies_t& loop_heads_to_bodies );
    void compute_dependencies_by_loading( branching_node* end_node,
                                          const loop_head_to_bodies_t& loop_heads_to_bodies,
                                          const loop_endings& loop_heads_ending );
    void compute_dependencies_by_loops( const loop_head_to_bodies_t& loop_heads_to_bodies,
                                        const loop_endings& loop_heads_ending );
    void compute_loading_loops( branching_node* end_node,
                                const loop_head_to_bodies_t& loop_heads_to_bodies,
                                loop_head_to_loaded_bits_counter& loading_loops,
                                const loop_endings& loop_heads_ending );
    void compute_paths( branching_node* end_node );
    std::vector< node_id_with_direction > get_path( branching_node* node );
    bool is_tracked( location_id id ) const;

    std::map< location_id, iid_node_dependence_props > node_id_to_equation_map;
    std::unordered_set< location_id > ignored_node_ids;
    std::unordered_set< location_id > covered_node_ids;
    loop_dependencies loop_to_properties;
    int processed_nodes = 0;
    int dependencies_computed = 0;

    std::vector< branching_node* > end_nodes;

public:
    inline static std::size_t biggest_node_id = 0;

    // Set configurations
    inline static int minimal_max_generation_after_covered = 10;
    inline static int minimal_max_generation_for_other_node = 10;
    inline static bool generate_for_bad_nodes = true;
    inline static int minimal_max_generation_artificial_data = 5;

    // Configurations
    inline static int biggest_value_in_difference_vector = 4;
    inline static bool generate_more_data_after_coverage = true;
    inline static int max_failed_generations_in_row = 3;
    inline static int maximal_number_of_branching_values = 30;
    inline static int maximal_number_of_equations_in_matrix = 500;
    inline static int maximal_number_of_equations_with_same_branching_value = 100;
    inline static float percentage_to_add_to_path = 0.5;
    inline static bool random_direction_in_path = false;
    inline static bool random_nested_loop_counts = false;
    inline static bool random_node_selection = true;

    inline static bool verbose = false;
    // inline static bool verbose = true;
};


std::pair< path_id_direction_count, std::size_t > get_directions_in_path( branching_node* node );
bool should_generate_more_data( const generation_state& state );
} // namespace fuzzing
