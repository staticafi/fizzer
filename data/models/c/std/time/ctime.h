#if defined(_WIN64)
    typedef unsigned long long size_t;
#elif defined(_WIN32)
    typedef unsigned int size_t;
#elif defined(__x86_64__) || defined(__ppc64__)
    typedef unsigned long size_t;
#else
    typedef unsigned int size_t;
#endif

#if defined(_WIN64) || defined(_WIN32)
    typedef __int64 time_t;
#else
    typedef long time_t;
#endif
struct tm;

char *__fizzer_model__ctime(const time_t *timep, char *buffer);
