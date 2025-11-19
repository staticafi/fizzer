#include "strspn.h"
size_t __fizzer_model__strspn(const char *s, const char *accept)
{
    size_t count = 0;
    while (*s != 0)
    {
        const char *a = accept;
        while (*a != 0 && *a != *s)
        {
            a++;
        }
        if (*a == 0)
        {
            break;
        }
        count++;
        s++;
    }
    return count;
}
