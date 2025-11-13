char *__fizzer_model__strncat(char *dest, const char *src, size_t n)
{
    char *d = dest;
    while (*d != 0)
    {
        d++;
    }
    size_t i = 0;
    while (i < n && *src != 0)
    {
        *d = *src;
        d++;
        src++;
        i++;
    }
    *d = 0;
    return dest;
}
