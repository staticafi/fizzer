int my_strlen(char* s)
{
    int n = 0;
    while (*s != '\0')
    {
        ++n;
        ++s;
    }
    return n;
}

void main(int argc, char* argv[])
{
    if (argc != 1)
        return;
    if (my_strlen(argv[0]) != 3)
        return;
}
