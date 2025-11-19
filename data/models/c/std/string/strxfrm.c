#include "strxfrm.h"
size_t __fizzer_model__strxfrm(char *dest, const char *src, size_t n)
{
    size_t len = 0;
    const char *s = src;

    /* Compute the length of src */
    while (*s != 0)
    {
        len++;
        s++;
    }

    /* Copy at most n-1 characters to dest if n > 0, then null-terminate */
    if (n > 0)
    {
        size_t i = 0;
        while (i < n - 1 && src[i] != 0)
        {
            dest[i] = src[i];
            i++;
        }
        dest[i] = 0;
    }

    return len;
}
