#include "strcspn.h"
size_t __fizzer_model__strcspn(const char *s, const char *reject)
{
    size_t count = 0;
    while (*s != 0)
    {
        const char *r = reject;
        while (*r != 0 && *r != *s)
        {
            r++;
        }
        if (*r != 0)
        {
            break;
        }
        count++;
        s++;
    }
    return count;
}
