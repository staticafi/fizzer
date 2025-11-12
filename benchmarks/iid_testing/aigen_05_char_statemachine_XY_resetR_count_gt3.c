#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 150

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int state = 0;          // State variable (e.g., 0=Start, 1=SeenX, 2=SeenY)
    int state2_entries = 0; // Counts entries into state 2

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
        // 6. State change is static (assignment), counter change is static (+1)
        if ( state == 0 && data[ i ] == 'X' ) {
            state = 1; // Static change (assignment)
        } else if ( state == 1 && data[ i ] == 'Y' ) {
            state = 2;                   // Static change (assignment)
            state2_entries++;            // Static change (+1)
        } else if ( data[ i ] == 'R' ) { // Reset condition
            state = 0;                   // Static change (assignment)
        }
        // Stay in current state otherwise, or remain in state 2
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( state2_entries > 3 ) {
        return 1;
    } else {
        return 0;
    }
}