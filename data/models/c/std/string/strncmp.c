int __fizzer_model__strncmp(const char *s1, const char *s2, size_t n)
{
    size_t i = 0;
    while (i < n)
    {
        unsigned char c1 = (unsigned char)s1[i];
        unsigned char c2 = (unsigned char)s2[i];
        if (c1 != c2 || c1 == 0 || c2 == 0)
        {
            return (int)(c1 - c2);
        }
        i++;
    }
    return 0;
}
