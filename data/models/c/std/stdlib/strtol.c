#include "strtol.h"
long __fizzer_model__strtol(const char *nptr, char **endptr, int base)
{
    long result = 0;
    int sign = 1;
    size_t i = 0;

    if (base != 10)
    {
        /* Only base 10 modeled */
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

    if (nptr[i] == '+')
    {
        i++;
    }
    else if (nptr[i] == '-')
    {
        sign = -1;
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

    return sign * result;
}
