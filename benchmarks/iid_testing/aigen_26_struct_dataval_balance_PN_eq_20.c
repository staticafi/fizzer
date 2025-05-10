/* File: gen_case_26_struct_dataval_balance_PN_eq_20.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

typedef struct {
    char code; // 'P', 'N'
    int value; // irrelevant for this logic, just for struct complexity
} DataVal;


#define MAX_SIZE 50

int main()
{
    DataVal items[MAX_SIZE];
    short num_items;
    int balance = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    num_items = __VERIFIER_nondet_short();
    if (num_items <= 0 || num_items > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < num_items; ++i) {
        items[i].code = __VERIFIER_nondet_char();
        items[i].value = __VERIFIER_nondet_int();

    }

    // 2. Core logic in loop(s)

    for (short i = 0; i < num_items; ++i) {
        if (items[i].code == 'P') {
            balance++;
        } else if (items[i].code == 'N') {
            balance--;
        }
    }
    // 4. Final condition based on internal variable(s)
    if (balance == 20) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
