int __fizzer_model__atoi(const char *nptr)
{
    int result = 0;
    int sign = 1;
    size_t i = 0;

    /* Skip leading whitespace */
    while (nptr[i] != 0 && __fizzer_model__isspace(nptr[i]))
    {
        i++;
    }

    /* Handle optional sign */
    if (nptr[i] == '+')
    {
        i++;
    }
    else if (nptr[i] == '-')
    {
        sign = -1;
        i++;
    }

    /* Parse digits */
    while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
    {
        result = result * 10 + (nptr[i] - '0');
        i++;
    }

    return sign * result;
}
