int __fizzer_model__toupper(int c)
{
    if (__fizzer_model__islower(c))
    {
        return c - 'a' + 'A';
    }
    return c;
}
