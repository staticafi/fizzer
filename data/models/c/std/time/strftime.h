#if defined(_WIN64)
    typedef unsigned long long size_t;
#elif defined(_WIN32)
    typedef unsigned int size_t;
#elif defined(__x86_64__) || defined(__ppc64__)
    typedef unsigned long size_t;
#else
    typedef unsigned int size_t;
#endif

struct tm;

extern void __fizzer_model__helper_itoa(int value, char *buffer, int base);

size_t __fizzer_model__strftime(char *s, size_t max, const char *format, const struct tm *tm);
