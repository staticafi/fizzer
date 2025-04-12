#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 100

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int countA = 0; // First state variable
    int countB = 0; // Second state variable

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
        // 6. Changes are static (+1)
        if ( data[ i ] == 'A' ) {
            countA++; // Static change
        } else if ( data[ i ] == 'B' ) {
            countB++; // Static change
        }
    }

    // 4. Final condition based on multiple internal variables
    // 5. Condition check is linear (countA - countB > 5)
    if ( countA > countB + 5 ) { // Check relation between the two counters
        return 1;
    } else {
        return 0;
    }
}