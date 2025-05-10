#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 50

int main()
{
    char data1[ MAX_SIZE ];
    char data2[ MAX_SIZE ];
    short size;
    int match_count = 0;

    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data1[ i ] = __VERIFIER_nondet_char();
        data2[ i ] = __VERIFIER_nondet_char();
    }

    for ( short i = 0; i < size; ++i ) {
        if ( data1[ i ] == 'S' && data2[ i ] == 'T' ) {
            match_count++;
        }
    }

    if ( match_count > 10 ) {
        return 1;
    } else {
        return 0;
    }
}