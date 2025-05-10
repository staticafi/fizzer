/* File: gen_case_53_char_two_loops_dep_PQ_ge_7.c */
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
    int k = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    size = __VERIFIER_nondet_short();
    if (size <= 0 || size > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < size; ++i) {
        data[i] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop(s)

    // Loop 1
    for (short i = 0; i < size; ++i) {
        if (data[i] == 'P') ++k;
    }
    // Loop 2
    for (short i = 0; i < size; ++i) {
         if (data[i] == 'Q') --k;
    }
    // 4. Final condition based on internal variable(s)
    if (k >= 7) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
