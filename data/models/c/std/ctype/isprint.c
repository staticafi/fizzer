#include "isprint.h"
int __fizzer_model__isprint(int c)
{
    if (c >= 32 && c <= 126)
    {
        return 1;
    }
    return 0;
}
