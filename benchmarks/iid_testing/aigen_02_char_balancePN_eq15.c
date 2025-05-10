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
    int balance = 0;
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify internal state based on data/condition (linear update)
        if ( data[ i ] == 'P' ) {
            balance++; // Linear change (+1)
        } else if ( data[ i ] == 'N' ) {
            balance--; // Linear change (-1)
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( balance == 15 ) {
        return 1; // Balanced
    } else {
        return 0; // Not balanced
    }
}