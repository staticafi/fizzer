/* File: gen_case_24_struct_item_status_A_ge_10.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

typedef struct {
    int id;
    char status; // e.g., 'A'ctive, 'I'nactive
} Item;


#define MAX_SIZE 50

int main()
{
    Item inventory[MAX_SIZE];
    short num_items;
    int active_count = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    num_items = __VERIFIER_nondet_short();
    if (num_items <= 0 || num_items > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < num_items; ++i) {
        inventory[i].id = __VERIFIER_nondet_int();
        inventory[i].status = __VERIFIER_nondet_char();

    }

    // 2. Core logic in loop(s)

    for (short i = 0; i < num_items; ++i) {
        if (inventory[i].status == 'A') {
            active_count++; // Constant change
        }
    }
    // 4. Final condition based on internal variable(s)
    if (active_count >= 10) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
