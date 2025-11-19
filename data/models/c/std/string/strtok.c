#include "strtok.h"
char *__fizzer_model__strtok(char *s, const char *delim)
{
    static char *next = 0;

    if (s == 0)
    {
        s = next;
    }

    if (s == 0)
    {
        return 0;
    }

    /* Skip leading delimiters */
    while (*s != 0)
    {
        const char *d = delim;
        while (*d != 0 && *d != *s)
        {
            d++;
        }
        if (*d == 0)
        {
            break;
        }
        s++;
    }

    if (*s == 0)
    {
        next = 0;
        return 0;
    }

    char *token = s;

    /* Find end of token */
    while (*s != 0)
    {
        const char *d = delim;
        while (*d != 0 && *d != *s)
        {
            d++;
        }
        if (*d != 0)
        {
            break;
        }
        s++;
    }

    if (*s != 0)
    {
        *s = 0;
        s++;
        next = s;
    }
    else
    {
        next = 0;
    }

    return token;
}
