void __fizzer_model__helper_itoa(int value, char *buffer, int base)
{
    char temp[32];
    int i = 0;
    int is_negative = 0;

    if (value < 0 && base == 10)
    {
        is_negative = 1;
        value = -value;
    }

    if (value == 0)
    {
        buffer[0] = '0';
        buffer[1] = 0;
        return;
    }

    while (value != 0)
    {
        int rem = value % base;
        if (rem < 10)
        {
            temp[i] = '0' + rem;
        }
        else
        {
            temp[i] = 'a' + (rem - 10);
        }
        value = value / base;
        i++;
    }

    int j = 0;
    if (is_negative)
    {
        buffer[j] = '-';
        j++;
    }

    while (i > 0)
    {
        i--;
        buffer[j] = temp[i];
        j++;
    }

    buffer[j] = 0;
}
