#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 80

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
    int special_count = 0;
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify internal state based on data/condition
        // Condition involves two checks on the same element
        // 6. Change is static (+1)
        if ( data[ i ] > '5' && data[ i ] < '9' ) { // Check if digit is 6, 7, or 8
            special_count++;                        // Static change
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( special_count == 3 ) {
        return 1;
    } else {
        return 0;
    }
}