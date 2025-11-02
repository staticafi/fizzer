size_t __fizzer_model__strftime(char *s, size_t max, const char *format, const struct tm *tm)
{
    size_t i = 0; /* index in format */
    size_t j = 0; /* index in output s */

    char buf[16];

    while (format[i] != 0 && j < max - 1)
    {
        if (format[i] == '%')
        {
            i++;
            if (format[i] == 0)
            {
                break;
            }

            int k = 0;
            if (format[i] == 'Y')
            {
                int year = 1900 + tm->tm_year;
                __fizzer_model__helper_itoa(year, buf, 10);
            }
            else if (format[i] == 'm')
            {
                int month = tm->tm_mon + 1;
                __fizzer_model__helper_itoa(month, buf, 10);
            }
            else if (format[i] == 'd')
            {
                int day = tm->tm_mday;
                __fizzer_model__helper_itoa(day, buf, 10);
            }
            else if (format[i] == 'H')
            {
                int hour = tm->tm_hour;
                __fizzer_model__helper_itoa(hour, buf, 10);
            }
            else if (format[i] == 'M')
            {
                int minute = tm->tm_min;
                __fizzer_model__helper_itoa(minute, buf, 10);
            }
            else if (format[i] == 'S')
            {
                int second = tm->tm_sec;
                __fizzer_model__helper_itoa(second, buf, 10);
            }
            else
            {
                buf[0] = format[i];
                buf[1] = 0;
            }

            k = 0;
            while (buf[k] != 0 && j < max - 1)
            {
                s[j] = buf[k];
                j++;
                k++;
            }

            i++;
        }
        else
        {
            s[j] = format[i];
            i++;
            j++;
        }
    }

    s[j] = 0;
    return j;
}
