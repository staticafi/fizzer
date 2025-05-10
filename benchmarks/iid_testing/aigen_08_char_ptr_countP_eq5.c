#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 60

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int p_count = 0; // State variable

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop using pointer arithmetic
    char* ptr = data;
    char* end_ptr = data + size; // Pointer to one past the last element

    while ( ptr < end_ptr ) {
        // 3. Modify internal state based on data accessed via pointer
        // 6. Change is static (+1)
        if ( *ptr == 'P' ) {
            p_count++; // Static change
        }
        ptr++; // Move pointer to the next element
    }

    // 4. Final condition based on internal variable
    // 5. Condition check is linear
    if ( p_count == 5 ) { // Check if 'P' was never found
        return 1;
    } else {
        return 0;
    }
}