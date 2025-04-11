
// Dummy versions of the MUTs; ignore them.

int  __fizzer_method_under_test(void) { return 0; }
int  __fizzer_method_under_test_with_params(int  argc, char*  argv[]) { return 0; }

// Entry functions; exactly one of them is actually used.

void  __fizzer_entry_function(void)
{
    __fizzer_method_under_test();
}

extern unsigned char  __fizzer_io_model_cmdline_read_argc(void);
extern unsigned short  __fizzer_io_model_cmdline_read_len(unsigned char  i);
extern char  __fizzer_io_model_cmdline_read_char(unsigned char  i, unsigned short  j);

void  __fizzer_entry_function_with_params(void)
{
    enum {
        MAX_ARGC    = 64,
        MAX_CHARS   = 4096
    };
    unsigned char const  argc = __fizzer_io_model_cmdline_read_argc();
    char*  argv[MAX_ARGC + 1];
    char  chars[MAX_CHARS + 1];
    argv[0] = &chars[0];
    for (unsigned char  i = 0; i < argc; ++i)
    {
        unsigned short const len = __fizzer_io_model_cmdline_read_len(i);
        for (unsigned short  j = 0; j < len; ++j)
            argv[i][j] = __fizzer_io_model_cmdline_read_char(i, j);
        argv[i+1] = argv[i] + len;
    }
    argv[argc] = (char*)0;
    __fizzer_method_under_test_with_params((int)argc, argv);
}
