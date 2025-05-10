#include <stdbool.h>
#include <stdlib.h>

extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 60

int main()
{
    char data[ MAX_SIZE ];
    short size;
    int p_count = 0;

    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }

    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_char();
    }


    char* ptr = data;
    char* end_ptr = data + size;

    while ( ptr < end_ptr ) {
        if ( *ptr == 'P' ) {
            p_count++;
        }
        ptr++;
    }
    if ( p_count == 5 ) {
        return 1;
    } else {
        return 0;
    }
}
