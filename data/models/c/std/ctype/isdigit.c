#include "isdigit.h"
int __fizzer_model__isdigit(int c)
{
    if (c >= '0' && c <= '9')
    {
        return 1;
    }
    return 0;
}
