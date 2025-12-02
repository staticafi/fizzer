#include "nondet.h"
extern char __VERIFIER_nondet_uchar(void);

void __fizzer_model____VERIFIER_nondet_memory(void* mem, size_t size)
{
    unsigned char* p = (unsigned char*)mem;
    unsigned char* e = p + size;
    for ( ; p != e; ++p)
        *p = __VERIFIER_nondet_uchar();
}
