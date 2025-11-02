int __fizzer_model__tolower(int c)
{
    if (__fizzer_model__isupper(c))
    {
        return c - 'A' + 'a';
    }
    return c;
}
