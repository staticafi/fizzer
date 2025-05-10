/* File: gen_case_07_char_continue_S_count_F_ge_10.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 90

int main()
{
    char data[MAX_SIZE];
    short size;
    int f_count = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    size = __VERIFIER_nondet_short();
    if (size <= 0 || size > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < size; ++i) {
        data[i] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop(s)

    for (short i = 0; i < size; ++i) {
        if (data[i] == 'S') {
            continue; // 3. Control flow modification
        }
        if (data[i] == 'F') {
            f_count++; // 6. Static change
        }
    }
    // 4. Final condition based on internal variable(s)
    if (f_count >= 10) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
