double __fizzer_model__strtod(const char *nptr, char **endptr)
{
    double result = 0.0;
    double fraction = 0.0;
    int sign = 1;
    int frac_div = 1;
    int exp_sign = 1;
    int exponent = 0;
    size_t i = 0;

    /* Skip leading whitespace */
    while (nptr[i] != 0 && __fizzer_model__isspace(nptr[i]))
    {
        i++;
    }

    /* Optional sign */
    if (nptr[i] == '+')
    {
        i++;
    }
    else if (nptr[i] == '-')
    {
        sign = -1;
        i++;
    }

    /* Integer part */
    while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
    {
        result = result * 10.0 + (double)(nptr[i] - '0');
        i++;
    }

    /* Fractional part */
    if (nptr[i] == '.')
    {
        i++;
        while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
        {
            fraction = fraction * 10.0 + (double)(nptr[i] - '0');
            frac_div = frac_div * 10;
            i++;
        }
        result = result + fraction / (double)frac_div;
    }

    /* Exponent part */
    if (nptr[i] == 'e' || nptr[i] == 'E')
    {
        i++;
        /* Optional sign */
        if (nptr[i] == '+')
        {
            i++;
        }
        else if (nptr[i] == '-')
        {
            exp_sign = -1;
            i++;
        }

        while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
        {
            exponent = exponent * 10 + (nptr[i] - '0');
            i++;
        }
    }

    if (endptr != 0)
    {
        *endptr = (char *)(nptr + i);
    }

    /* Apply exponent */
    double exp_multiplier = 1.0;
    for (int j = 0; j < exponent; j++)
    {
        exp_multiplier = exp_multiplier * 10.0;
    }

    if (exp_sign < 0)
    {
        result = result / exp_multiplier;
    }
    else
    {
        result = result * exp_multiplier;
    }

    return sign * result;
}
