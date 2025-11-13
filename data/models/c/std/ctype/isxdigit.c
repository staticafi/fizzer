int __fizzer_model__isxdigit(int c)
{
    if ((__fizzer_model__isdigit(c)) ||
        (c >= 'A' && c <= 'F') ||
        (c >= 'a' && c <= 'f'))
    {
        return 1;
    }
    return 0;
}
