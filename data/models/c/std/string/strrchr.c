#include "strrchr.h"
char *__fizzer_model__strrchr(const char *s, int c)
{
    const char *last = 0;
    while (*s != 0)
    {
        if (*s == (char)c)
        {
            last = s;
        }
        s++;
    }
    if ((char)c == 0)
    {
        return (char *)s;
    }
    return (char *)last;
}
