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
    Node nodes[ MAX_NODES ];
    Node* head = NULL;
    Node* current = NULL;
    short size;
    int count_gt_10 = 0;

    size = __VERIFIER_nondet_short();
    if ( size < 0 || size > MAX_NODES ) {
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

    current = head;
    while ( current != NULL ) {
        if ( current->value == 10 ) {
            count_gt_10++;
        }

        current = current->next;
    }

    if ( count_gt_10 >= 10 ) {
        return 1;
    } else {
        return 0;
    }
}