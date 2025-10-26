#include <stdbool.h>

extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();

#define MAX_SIZE 100

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int countA = 0;
    int countB = 0;

    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }

    for ( short i = 0; i < size; ++i ) {
        if ( data[ i ] == 'A' ) {
            countA++;
        } else if ( data[ i ] == 'B' ) {
            countB++;
        }
    }

    if ( countA > countB + 5 ) {
        return 1;
    } else {
        return 0;
    }
}