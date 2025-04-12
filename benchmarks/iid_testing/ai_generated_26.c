#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

// Simple struct definition
typedef struct {
    char status; // e.g., 'A'ctive, 'I'nactive
} Item;

#define MAX_ITEMS 40

int main()
{
    Item inventory[ MAX_ITEMS ]; // Array of structs
    short num_items;
    int active_count = 0; // State variable

    // 1. Fill data structure (array of structs) in an initial loop
    num_items = __VERIFIER_nondet_short();
    if ( num_items <= 0 || num_items > MAX_ITEMS ) {
        return -1;
    }
    for ( short i = 0; i < num_items; ++i ) {
        inventory[ i ].status = __VERIFIER_nondet_char(); // Assign status
    }

    // 2. Core logic in loop iterating through the array of structs
    for ( short i = 0; i < num_items; ++i ) {
        // 3. Modify internal state based on struct member
        // 5. Change is constant (+1)
        if ( inventory[ i ].status == 'A' ) {
            active_count++; // Constant change
        }
    } // Loop always completes

    // 4. Final condition based on internal variable
    if ( active_count >= 10 ) { // Check if at least half are active
        return 1;
    } else {
        return 0;
    }
}