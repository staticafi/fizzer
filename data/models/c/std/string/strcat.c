#include "strcat.h"
char *__fizzer_model__strcat(char *dest, const char *src)
{
    char *d = dest;
    while (*d != 0)
    {
        d++;
    }
    while (*src != 0)
    {
        *d = *src;
        d++;
        src++;
    }
    *d = 0;
    return dest;
}
