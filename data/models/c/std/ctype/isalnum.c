int __fizzer_model__isalnum(int c)
{
    if (__fizzer_model__isalpha(c) || __fizzer_model__isdigit(c))
    {
        return 1;
    }
    return 0;
}
