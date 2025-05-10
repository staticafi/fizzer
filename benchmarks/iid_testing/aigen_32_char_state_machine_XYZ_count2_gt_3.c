/* File: gen_case_33_char_state_machine_XYZ_count2_gt_3.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 150

int main()
{
    char data[MAX_SIZE];
    short size;
    int state = 0;
    int state2_entries = 0; // State variable(s)

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
        if (state == 0 && data[i] == 'X') {
            state = 1;
        } else if (state == 1 && data[i] == 'Y') {
            state = 2;
            state2_entries++; // Static change +1
        } else if (data[i] == 'R') { // Reset condition
            state = 0;
        }
    }
    // 4. Final condition based on internal variable(s)
    if (state2_entries > 3) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
