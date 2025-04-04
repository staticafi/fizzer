void main(int argc, char* argv[])
{
    if (argc != 3)
        return;
    argv[0][0] = 'A';
    argv[1][0] = 'B';
    argv[2][0] = 'C';
    argc = 123;
}
