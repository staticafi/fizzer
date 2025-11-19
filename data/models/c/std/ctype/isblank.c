#include "isblank.h"
int __fizzer_model__isblank(int c)
{
    if (c == ' ' || c == '\t')
    {
        return 1;
    }
    return 0;
}
