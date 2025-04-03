extern char __VERIFIER_nondet_char();
extern void exit(int exit_code);

void foo(char x)
{
    if (x == 100)
        exit(0);
}

int main()
{
    char c = __VERIFIER_nondet_char();
    foo(c);
    foo(c + 100);

    if (c == 1)
        return 1;

    return(0);
}
