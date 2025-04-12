#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 100

int main()
{
    char data[ MAX_SIZE ];
    short size;
    short first_F_index = -1; // State variable 1
    short last_L_index = -1;  // State variable 2

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify internal state variables based on data/condition
        // 6. Change is static (assignment of index, happens at most once for first_F)
        if ( data[ i ] == 'F' ) {
            if ( first_F_index == -1 ) { // Assign only if not already found
                first_F_index = i;       // Static change (assignment)
            }
        } else if ( data[ i ] == 'L' ) {
            last_L_index = i; // Update last known L index (Static change - assignment)
        }
    }

    // 4. Final condition based on multiple internal variables
    // 5. Condition check is linear (last_L_index - first_F_index > 10)
    // Check if both were found and the distance is large enough
    if ( first_F_index != -1 && last_L_index != -1 && last_L_index > first_F_index + 10 ) {
        return 1;
    } else {
        return 0;
    }
}