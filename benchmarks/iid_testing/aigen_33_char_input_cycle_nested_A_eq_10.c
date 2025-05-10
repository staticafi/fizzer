/* File: gen_case_39_char_input_cycle_nested_A_eq_10.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 50

int main()
{
    char data[MAX_SIZE];
    short size;
    int k = 0;
    short loop_count_1 = 0;
    short loop_count_2 = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    size = __VERIFIER_nondet_short();
    if (size <= 0 || size > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < size; ++i) {
        data[i] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop(s)

    loop_count_1 = __VERIFIER_nondet_short();
    loop_count_2 = __VERIFIER_nondet_short();

    if (loop_count_1 < 0 || loop_count_1 > 10) loop_count_1 = 3; // Bound loops
    if (loop_count_2 < 0 || loop_count_2 > 10) loop_count_2 = 4; // Bound loops

    for (short index_1 = 0; index_1 < loop_count_1; ++index_1) {
        for (short index_2 = 0; index_2 < loop_count_2; ++index_2) {
             int i = 0;
             while (i < size) { // Assuming non-null terminated for simplicity here
                  if (data[i] == 'A') ++k;
                  i++;
             }
        }
    }

    // 4. Final condition based on internal variable(s)
    if (k == 10) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
