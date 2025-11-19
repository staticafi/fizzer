#include "sprintf.h"
int __fizzer_model__sprintf(char *str, const char *format, ...)
{
    va_list ap;
    va_start(ap, format);
    int result = __fizzer_model__vsprintf(str, format, ap);
    va_end(ap);
    return result;
}
