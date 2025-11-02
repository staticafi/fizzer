char *__fizzer_model__strpbrk(const char *s, const char *accept)
{
    while (*s != 0)
    {
        const char *a = accept;
        while (*a != 0)
        {
            if (*a == *s)
            {
                return (char *)s;
            }
            a++;
        }
        s++;
    }
    return 0;
}
