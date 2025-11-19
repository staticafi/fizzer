#include "ctime.h"
char *__fizzer_model__ctime(const time_t *timep, char *buffer)
{
    const char template[] = "Wed Jan 01 00:00:00 1970\n";
    size_t i = 0;

    while (template[i] != 0)
    {
        buffer[i] = template[i];
        i++;
    }

    buffer[i] = 0;
    return buffer;
}
