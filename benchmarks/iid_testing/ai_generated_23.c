#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 90

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int f_count = 0; // State variable

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop using 'continue'
    for ( short i = 0; i < size; ++i ) {
        if ( data[ i ] == 'S' ) { // Skip character 'S'
            continue;             // Jumps to the next iteration
        }
        // 3. Modify internal state if not skipped
        // 5. Change is constant (+1)
        if ( data[ i ] == 'F' ) {
            f_count++; // Constant change
        }
        // Potentially other processing for non-'S' characters here
    } // Loop always completes (though iterations might be skipped)

    // 4. Final condition based on internal variable
    if ( f_count >= 10 ) { // Check if 'F' was found enough times
        return 1;
    } else {
        return 0;
    }
}