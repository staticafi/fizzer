#include "strtoul.h"
unsigned long __fizzer_model__strtoul(const char *nptr, char **endptr, int base)
{
    unsigned long result = 0;
    size_t i = 0;

    if (base != 10)
    {
        if (endptr != 0)
        {
            *endptr = (char *)nptr;
        }
        return 0;
    }

    while (nptr[i] != 0 && __fizzer_model__isspace(nptr[i]))
    {
        i++;
    }

    /* Optional '+' sign only, negative not allowed for unsigned */
    if (nptr[i] == '+')
    {
        i++;
    }

    size_t start = i;

    while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
    {
        result = result * 10 + (nptr[i] - '0');
        i++;
    }

    if (endptr != 0)
    {
        *endptr = (char *)(nptr + i);
    }

    return result;
}
