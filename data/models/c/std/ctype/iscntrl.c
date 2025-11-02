int __fizzer_model__iscntrl(int c)
{
    if ((c >= 0 && c <= 31) || c == 127)
    {
        return 1;
    }
    return 0;
}
