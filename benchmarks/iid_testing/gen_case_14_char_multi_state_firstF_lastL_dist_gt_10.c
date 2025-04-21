/* File: gen_case_14_char_multi_state_firstF_lastL_dist_gt_10.c */
#include <stdbool.h>
#include <stdlib.h> // For NULL if needed

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 100

int main()
{
    char data[MAX_SIZE];
    short size;
    short first_F_index = -1;
    short last_L_index = -1; // State variable(s)

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
        if (data[i] == 'F') {
            if (first_F_index == -1) { // Assign only if not already found
                first_F_index = i; // Static change (assignment)
            }
        } else if (data[i] == 'L') {
            last_L_index = i; // Update last known L index (Static change - assignment)
        }
    }
    // 4. Final condition based on internal variable(s)
    if (first_F_index != -1 && last_L_index != -1 && last_L_index > first_F_index + 10) {
        return 1; // Condition met
    } else {
        return 0; // Condition not met
    }
}
