#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 100
#define UPPER_BOUND 10
#define LOWER_BOUND -10

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int bounded_counter = 0; // State variable with bounds

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
        // 3. Modify internal state based on data/condition
        // 6. Changes are static (+1 or -1), but bounded
        if ( data[ i ] == 'U' ) {
            if ( bounded_counter < UPPER_BOUND ) {
                bounded_counter++; // Static change
            }
        } else if ( data[ i ] == 'D' ) {
            if ( bounded_counter > LOWER_BOUND ) {
                bounded_counter--; // Static change
            }
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( bounded_counter == 5 ) { // Check final value against a specific target
        return 1;
    } else {
        return 0;
    }
}