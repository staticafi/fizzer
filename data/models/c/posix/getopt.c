#include "getopt.h"
int __fizzer_model__getopt(int argc, char * const argv[], const char *optstring)
{
    if (__fizzer_model__optind >= argc)
    {
        return -1; /* no more arguments */
    }

    char *current = argv[__fizzer_model__optind];

    if (current[0] != '-' || current[1] == 0)
    {
        return -1; /* not an option */
    }

    char opt = current[1];
    size_t i = 0;
    int found = 0;

    while (optstring[i] != 0)
    {
        if (optstring[i] == opt)
        {
            found = 1;
            break;
        }
        i++;
    }

    if (!found)
    {
        __fizzer_model__optopt = opt;
        __fizzer_model__optind++;
        return '?';
    }

    /* check if option expects an argument */
    if (optstring[i + 1] == ':')
    {
        if (current[2] != 0)
        {
            __fizzer_model__optarg = &current[2];
        }
        else if (__fizzer_model__optind + 1 < argc)
        {
            __fizzer_model__optind++;
            __fizzer_model__optarg = argv[__fizzer_model__optind];
        }
        else
        {
            __fizzer_model__optarg = 0;
            if (__fizzer_model__opterr)
            {
                /* Normally would print error */
            }
            __fizzer_model__optind++;
            return ':';
        }
        __fizzer_model__optind++;
    }
    else
    {
        __fizzer_model__optarg = 0;
        __fizzer_model__optind++;
    }

    return opt;
}
