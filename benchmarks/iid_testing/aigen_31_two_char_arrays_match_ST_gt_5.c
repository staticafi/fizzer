/* File: gen_case_32_two_char_arrays_match_ST_gt_5.c */
#include <stdbool.h>

extern short __VERIFIER_nondet_short();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();

#define MAX_SIZE 50

int main()
{
    char data1[MAX_SIZE];
    char data2[MAX_SIZE]; // Second array
    short size;
    int match_count = 0; // State variable

    // 1. Fill data structures in loops
    size = __VERIFIER_nondet_short();
    if (size <= 0 || size > MAX_SIZE) {
        return -1;
    }
    for (short i = 0; i < size; ++i) {
        data1[i] = __VERIFIER_nondet_char();
        data2[i] = __VERIFIER_nondet_char();
    }

    // 2. Core logic in loop iterating through data
    for (short i = 0; i < size; ++i) {
        // 3. Modify internal state based on data from both arrays
        if (data1[i] == 'S' && data2[i] == 'T') {
            match_count++; // 6. Static change (+1)
        }
    }

    // 4. Final condition based on internal variable
    if (match_count > 5) { // 5. Linear check
        return 1;
    } else {
        return 0;
    }
}
