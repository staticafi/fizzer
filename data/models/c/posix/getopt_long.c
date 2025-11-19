#include "getopt_long.h"
#include <getopt.h>
int __fizzer_model__getopt_long(int argc, char * const argv[], const char *optstring,
                                const struct option *longopts, int *longindex)
{
    if (__fizzer_model__optind >= argc)
    {
        return -1;
    }

    char *current = argv[__fizzer_model__optind];

    if (current[0] != '-' || current[1] != '-')
    {
        return __fizzer_model__getopt(argc, argv, optstring);
    }

    size_t i = 0;
    while (longopts[i].name != 0)
    {
        size_t j = 0;
        int match = 1;

        while (longopts[i].name[j] != 0 && current[2 + j] != 0)
        {
            if (longopts[i].name[j] != current[2 + j])
            {
                match = 0;
                break;
            }
            j++;
        }

        if (match && longopts[i].name[j] == 0 && current[2 + j] == 0)
        {
            if (longindex != 0)
            {
                *longindex = (int)i;
            }

            if (longopts[i].has_arg == 1)
            {
                if (__fizzer_model__optind + 1 < argc)
                {
                    __fizzer_model__optarg = argv[__fizzer_model__optind + 1];
                    __fizzer_model__optind += 2;
                }
                else
                {
                    __fizzer_model__optarg = 0;
                    __fizzer_model__optind++;
                }
            }
            else
            {
                __fizzer_model__optarg = 0;
                __fizzer_model__optind++;
            }

            if (longopts[i].flag != 0)
            {
                *longopts[i].flag = longopts[i].val;
                return 0;
            }

            return longopts[i].val;
        }

        i++;
    }

    __fizzer_model__optind++;
    return '?'; /* unknown long option */
}
