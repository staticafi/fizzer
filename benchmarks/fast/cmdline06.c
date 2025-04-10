int my_strcmp(char const* r, char const* s)
{
    while (*r != '\0' && *s != '\0')
    {
        if (*r < *s)
            return -1;
        if (*r > *s)
            return 1;
        ++r;
        ++s;
    }
    if (*r == '\0' && *s == '\0')
        return 0;
    return *r == '\0' ? -1 : 1;
}

void main(int argc, char* argv[])
{
    if (argc != 1)
        return;
    if (my_strcmp(argv[0], "--help") == 0)
        return;
}
