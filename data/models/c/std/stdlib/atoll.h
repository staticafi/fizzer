#if defined(_WIN64)
    typedef unsigned long long size_t;
#elif defined(_WIN32)
    typedef unsigned int size_t;
#elif defined(__x86_64__) || defined(__ppc64__)
    typedef unsigned long size_t;
#else
    typedef unsigned int size_t;
#endif

extern int __fizzer_model__isspace(int c);
extern int __fizzer_model__isdigit(int c);

long long __fizzer_model__atoll(const char *nptr);
