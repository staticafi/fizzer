#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 50

int main()
{
    char data[ MAX_SIZE ];
    short size;

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop
    int value = 0;
    short idx = 0;
    while ( idx < size ) {
        // 3. Modify internal state based on data/condition
        // 6. Change is static (+2 or +1)
        if ( data[ idx ] == 'A' ) {
            value += 2; // Static change
        } else if ( data[ idx ] == 'B' ) {
            value += 1; // Static change
        }
        idx++;
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( value == 25 ) {
        return 1;
    } else {
        return 0;
    }
}