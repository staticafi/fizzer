#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 80

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int counter = 0; // State variable

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
        // 3. Modify internal state based on data and current state
        // 6. Change is static (+1 or +2)
        if ( data[ i ] == 'X' ) {
            if ( counter % 2 == 0 ) { // Check if counter is even
                counter += 1;         // Static change +1
            } else {                  // Counter is odd
                counter += 2;         // Static change +2
            }
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( counter > 50 ) {
        return 1;
    } else {
        return 0;
    }
}