long long __fizzer_model__atoll(const char *nptr)
{
    long long result = 0;
    int sign = 1;
    size_t i = 0;

    while (nptr[i] != 0 && __fizzer_model__isspace(nptr[i]))
    {
        i++;
    }

    if (nptr[i] == '+')
    {
        i++;
    }
    else if (nptr[i] == '-')
    {
        sign = -1;
        i++;
    }

    while (nptr[i] != 0 && __fizzer_model__isdigit(nptr[i]))
    {
        result = result * 10 + (nptr[i] - '0');
        i++;
    }

    return sign * result;
}
