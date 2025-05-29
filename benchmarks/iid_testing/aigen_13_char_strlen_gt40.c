#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 50 // Note: actual string length can be less

int main()
{
    char data[ MAX_SIZE ];
    short max_len;
    int len = 0; // State variable

    // 1. Fill data structure (making it a C string)
    max_len = __VERIFIER_nondet_short();
    if ( max_len <= 0 || max_len >= MAX_SIZE ) { // Need space for null terminator
        return -1;
    }
    // Fill up to max_len - 1
    for ( short i = 0; i < max_len; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }
    data[ max_len ] = '\0'; // Ensure null termination

    // 2. Core logic in loop to find length (simulates strlen)
    // 6. Uses break based on C string convention
    for ( int i = 0;; ++i ) { // Loop bound by buffer size
        if ( data[ i ] == '\0' ) {
            break; // Found null terminator
        }
        // 3. Modify internal state variable
        // 5. Change is constant (+1)
        len++; // Constant change
    } // Loop breaks on null terminator

    // 4. Final condition based on internal variable (calculated length)
    if ( len > 40 ) {
        return 1; // Length is greater than 10
    } else {
        return 0; // Length is 10 or less
    }
}