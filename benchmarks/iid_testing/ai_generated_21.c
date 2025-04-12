#include <stdbool.h>
#include <stdlib.h> // For NULL potentially, though not strictly needed here

// Assume these functions are provided externally
extern short __VERIFIER_nondet_short();
extern int __VERIFIER_nondet_int();

// Simple Node structure for linked list
typedef struct Node {
    int value;
    struct Node* next;
} Node;

#define MAX_NODES 50

int main()
{
    Node nodes[ MAX_NODES ]; // Pre-allocate nodes for simplicity
    Node* head = NULL;
    Node* current = NULL;
    short size;
    int count_gt_10 = 0; // State variable

    // 1. Fill data structure (linked list) in an initial loop
    size = __VERIFIER_nondet_short();
    if ( size < 0 || size > MAX_NODES ) { // Allow size 0
        return -1;
    }

    for ( short i = 0; i < size; ++i ) {
        nodes[ i ].value = __VERIFIER_nondet_int();
        nodes[ i ].next = NULL;
        if ( head == NULL ) {
            head = &nodes[ i ];
            current = head;
        } else {
            current->next = &nodes[ i ];
            current = current->next;
        }
    }

    // 2. Core logic in loop iterating through the data structure (linked list)
    current = head; // Start iteration from head
    while ( current != NULL ) {
        // 3. Modify internal state based on data elements
        // 5. Change is constant (+1)
        if ( current->value == 10 ) {
            count_gt_10++; // Constant change
        }
        current = current->next; // Move to next node
    } // Loop completes when end of list is reached

    // 4. Final condition based on internal variable
    if ( count_gt_10 >= 10 ) { // Non-trivial check
        return 1;
    } else {
        return 0;
    }
}