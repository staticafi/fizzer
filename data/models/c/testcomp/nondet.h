#if defined(_WIN64)
    typedef unsigned long long size_t;
#elif defined(_WIN32)
    typedef unsigned int size_t;
#elif defined(__x86_64__) || defined(__ppc64__)
    typedef unsigned long size_t;
#else
    typedef unsigned int size_t;
#endif

void __fizzer_model____VERIFIER_nondet_memory(void* mem, size_t size);
