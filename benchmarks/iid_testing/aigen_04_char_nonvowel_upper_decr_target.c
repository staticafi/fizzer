#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 50
#define START_COUNT 100 // Start high and decrement

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
    int non_vowel_upper_count = START_COUNT;
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify internal state based on data/condition (nested)
        // 6. Change is static (-1)
        if ( data[ i ] >= 'A' && data[ i ] <= 'Z' ) { // Is uppercase?
            if ( data[ i ] != 'A' && data[ i ] != 'E' && data[ i ] != 'I' && data[ i ] != 'O' &&
                 data[ i ] != 'U' ) {    // Is not a vowel?
                non_vowel_upper_count--; // Static change
            }
        }
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear (< START_COUNT - 5)
    // Checks if at least 6 non-vowel uppercase letters were found
    if ( non_vowel_upper_count < START_COUNT - 5 ) {
        return 1;
    } else {
        return 0;
    }
}