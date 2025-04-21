/* File: gen_case_35_char_pointer_loop_count_P_eq_5.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 60

int main()
{
    char data[MAX_SIZE];
    short size;
    int p_count = 0; // State variable(s)

    // 1. Fill data structure in an initial loop
    size = __VERIFIER_nondet_short();
    if (size <= 0 || size > MAX_SIZE) {
        return -1; // Invalid size
    }

    for (short i = 0; i < size; ++i) {
        data[i] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop(s)

    char* ptr = data;
    char* end_ptr = data + size; // Pointer to one past the last element

    while (ptr < end_ptr) {
        if (*ptr == 'P') {
            p_count++; // Static change
        }
        ptr++; // Move pointer to the next element
    }
    // 4. Final condition based on internal variable(s)
    if (p_count == 5) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
