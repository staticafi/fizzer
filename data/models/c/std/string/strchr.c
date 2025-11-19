#include "strchr.h"
char *__fizzer_model__strchr(const char *s, int c)
{
    while (*s != 0)
    {
        if (*s == (char)c)
        {
            return (char *)s;
        }
        s++;
    }
    if ((char)c == 0)
    {
        return (char *)s;
    }
    return 0;
}
