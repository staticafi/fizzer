#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 100

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int countA = 0; // State variable for first loop
    int countB = 0; // State variable for second loop

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in sequence of loops
    // Loop 1
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify state variable (countA)
        // 5. Change is constant (+1)
        if ( data[ i ] == 'A' ) {
            countA++; // Constant change
        }
    }
    // Loop 2
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify state variable (countB)
        // 5. Change is constant (+1)
        if ( data[ i ] == 'B' ) {
            countB++; // Constant change
        }
    } // Both loops always complete

    // 4. Final condition based on multiple internal variables
    // if ( countA == countB && countA > 10 ) { // Check if counts are equal and non-zero
    //     return 1;
    // } else {
    //     return 0;
    // }

    if ( countA == 10 ) { // Check if counts are equal and non-zero
        return 1;
    }

    if ( countB == 10 ) {
        return 1;
    }

    return 0;
}