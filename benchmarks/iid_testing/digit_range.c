#include <stdbool.h>

extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 80

int main()
{
    char data[ MAX_SIZE ];
    short size;

    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    int special_count = 0;
    for ( short i = 0; i < size; ++i ) {
        if ( data[ i ] > '5' && data[ i ] < '9' ) {
            special_count++;
        }
    }

    if ( special_count == 3 ) {
        return 1;
    } else {
        return 0;
    }
}