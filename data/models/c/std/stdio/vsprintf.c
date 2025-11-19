#include "vsprintf.h"
int __fizzer_model__vsprintf(char *str, const char *format, va_list ap)
{
    size_t i = 0; /* index for format string */
    size_t j = 0; /* index for output str */

    while (format[i] != 0)
    {
        if (format[i] == '%')
        {
            i++;
            if (format[i] == 0)
            {
                break;
            }

            if (format[i] == 'd')
            {
                int val = va_arg(ap, int);
                char buf[32];
                __fizzer_model__helper_itoa(val, buf, 10);
                size_t k = 0;
                while (buf[k] != 0)
                {
                    str[j] = buf[k];
                    j++;
                    k++;
                }
            }
            else if (format[i] == 'u')
            {
                unsigned int val = va_arg(ap, unsigned int);
                char buf[32];
                __fizzer_model__helper_itoa((int)val, buf, 10);
                size_t k = 0;
                while (buf[k] != 0)
                {
                    str[j] = buf[k];
                    j++;
                    k++;
                }
            }
            else if (format[i] == 'x')
            {
                unsigned int val = va_arg(ap, unsigned int);
                char buf[32];
                __fizzer_model__helper_itoa((int)val, buf, 16);
                size_t k = 0;
                while (buf[k] != 0)
                {
                    str[j] = buf[k];
                    j++;
                    k++;
                }
            }
            else if (format[i] == 'c')
            {
                char c = (char)va_arg(ap, int);
                str[j] = c;
                j++;
            }
            else if (format[i] == 's')
            {
                char *s = va_arg(ap, char *);
                size_t k = 0;
                while (s[k] != 0)
                {
                    str[j] = s[k];
                    j++;
                    k++;
                }
            }
            else
            {
                str[j] = format[i];
                j++;
            }

            i++;
        }
        else
        {
            str[j] = format[i];
            i++;
            j++;
        }
    }

    str[j] = 0;

    return (int)j;
}
