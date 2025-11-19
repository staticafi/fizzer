#include "strlen.h"
size_t __fizzer_model__strlen(const char *s)
{
    size_t n = 0;
    while (s[n] != 0)
    {
        n++;
    }
    return n;
}
