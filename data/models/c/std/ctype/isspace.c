#include "isspace.h"
int __fizzer_model__isspace(int c)
{
    if (c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' || c == '\v')
    {
        return 1;
    }
    return 0;
}
