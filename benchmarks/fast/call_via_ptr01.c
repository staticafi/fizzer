void __target__() {}
extern int __VERIFIER_nondet_int();

int f0(void) { return 0; }
int f42(void) { return 42; }

int main(void)
{
	int (*pfn[2])() = { &f0, &f42 };
    int i = __VERIFIER_nondet_int();
    int x = (*pfn[i])();
    if (x == 42)
    {
        __target__();
        return 1;
    }
    return 0;
}
