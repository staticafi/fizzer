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
    typedef char *va_list;
#else
    typedef __builtin_va_list va_list;
    #define va_start(ap, param) __builtin_va_start(ap, param)
    #define va_end(ap) __builtin_va_end(ap)
    #define va_arg(ap, type) __builtin_va_arg(ap, type)
    #define va_copy(dest, src) __builtin_va_copy(dest, src)
#endif

extern int __fizzer_model__vsnprintf(char *str, size_t size, const char *format, va_list ap);

int __fizzer_model__snprintf(char *str, size_t size, const char *format, ...);
