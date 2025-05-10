#include <stdbool.h>

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern int __VERIFIER_nondet_int(); // Use int for values

#define MAX_SIZE 60

int main()
{
    int data[ MAX_SIZE ];
    short size;
    int pos_count = 0; // State variable 1
    int neg_count = 0; // State variable 2

    // 1. Fill data structure in a loop
    size = __VERIFIER_nondet_short();
    if ( size <= 0 || size > MAX_SIZE ) {
        return -1;
    }
    for ( short i = 0; i < size; ++i ) {
        data[ i ] = __VERIFIER_nondet_int(); // Fill with non-det integers
    }

    // 2. Core logic in loop
    for ( short i = 0; i < size; ++i ) {
        // 3. Modify internal state variables based on data
        // 5. Changes are constant (+1)
        if ( data[ i ] > 0 ) {
            pos_count++; // Constant change
        } else if ( data[ i ] < 0 ) {
            neg_count++; // Constant change
        }
        // Ignore zeros
    } // Loop always completes

    // 4. Multiple final conditions based on internal variables
    // if ( pos_count > neg_count + 2 ) {        // Check relation 1
    //     return 1;                             // More positives by a margin
    // } else if ( neg_count > pos_count + 2 ) { // Check relation 2
    //     return 2;                             // More negatives by a margin
    // } else {
    //     return 0; // Neither condition met (counts are close or equal)
    // }

    if ( pos_count > 20 ) {        // Check relation 1
        return 1;                  // More positives by a margin
    } else if ( neg_count > 20 ) { // Check relation 2
        return 2;                  // More negatives by a margin
    } else {
        return 0; // Neither condition met (counts are close or equal)
    }
}