#include <stdbool.h>

extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

typedef struct {
    int id;
    char status;
} Item;

#define MAX_ITEMS 40

int main()
{
    Item inventory[ MAX_ITEMS ];
    short num_items;
    int active_count = 0;

    num_items = __VERIFIER_nondet_short();
    if ( num_items < 0 || num_items > MAX_ITEMS ) {
        return -1;
    }
    for ( short i = 0; i < num_items; ++i ) {
        inventory[ i ].id = __VERIFIER_nondet_int();
        inventory[ i ].status = __VERIFIER_nondet_char();
    }

    for ( short i = 0; i < num_items; ++i ) {
        if ( inventory[ i ].status == 'A' ) {
            active_count++;
        }
    }

    if ( active_count >= 10 ) {
        return 1;
    } else {
        return 0;
    }
}