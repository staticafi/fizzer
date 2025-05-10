#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 90

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int odd_count = 0; // State variable

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
        // 3. Modify internal state based on bitwise check of data
        // 6. Change is static (+1)
        if ( ( data[ i ] & 1 ) != 0 ) { // Check if the LSB is 1 (ASCII value is odd)
            odd_count++;                // Static change
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( odd_count * 2 > size ) { // Check if more than half the chars had odd ASCII values
        return 1;
    } else {
        return 0;
    }
}