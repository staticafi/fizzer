#if defined(_WIN64)
    typedef unsigned long long size_t;
#elif defined(_WIN32)
    typedef unsigned int size_t;
#elif defined(__x86_64__) || defined(__ppc64__)
    typedef unsigned long size_t;
#else
    typedef unsigned int size_t;
#endif

extern int __fizzer_model__optind;
extern char *__fizzer_model__optarg;
extern int __fizzer_model__opterr;
extern int __fizzer_model__optopt;

extern int __fizzer_model__getopt(int argc, char * const argv[], const char *optstring);
struct option;

int __fizzer_model__getopt_long(int argc, char * const argv[], const char *optstring,
                                const struct option *longopts, int *longindex);
