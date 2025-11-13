int __fizzer_model__vsnprintf(char *str, size_t size, const char *format, va_list ap)
{
    size_t i = 0; /* index for format string */
    size_t j = 0; /* index for output str */

    if (size == 0)
    {
        return 0;
    }

    while (format[i] != 0 && j < size - 1)
    {
        if (format[i] == '%')
        {
            i++;
            if (format[i] == 0)
            {
                break;
            }

            char buf[32];
            size_t k = 0;

            if (format[i] == 'd')
            {
                int val = va_arg(ap, int);
                __fizzer_model__helper_itoa(val, buf, 10);
            }
            else if (format[i] == 'u')
            {
                unsigned int val = va_arg(ap, unsigned int);
                __fizzer_model__helper_itoa((int)val, buf, 10);
            }
            else if (format[i] == 'x')
            {
                unsigned int val = va_arg(ap, unsigned int);
                __fizzer_model__helper_itoa((int)val, buf, 16);
            }
            else if (format[i] == 'c')
            {
                buf[0] = (char)va_arg(ap, int);
                buf[1] = 0;
            }
            else if (format[i] == 's')
            {
                char *s = va_arg(ap, char *);
                k = 0;
                while (s[k] != 0 && j < size - 1)
                {
                    str[j] = s[k];
                    j++;
                    k++;
                }
                i++;
                continue;
            }
            else
            {
                buf[0] = format[i];
                buf[1] = 0;
            }

            k = 0;
            while (buf[k] != 0 && j < size - 1)
            {
                str[j] = buf[k];
                j++;
                k++;
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
