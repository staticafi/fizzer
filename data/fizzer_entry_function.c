
// Dummy versions of the MUTs; exactly one of them will be replaced by the 'main' function (while keeping the name).

int  __fizzer_private_int_method_under_test(void) { return 0; }
void  __fizzer_private_void_method_under_test(void) {}
int  __fizzer_private_int_method_under_test_with_params(int  argc, char*  argv[]) { return 0; }
void  __fizzer_private_void_method_under_test_with_params(int  argc, char*  argv[]) {}

// Declarations of cmdline read functions; used only by one of the two entry functions (see below).

extern unsigned char  __fizzer_private_io_model_cmdline_read_argc(void);
extern char  __fizzer_private_io_model_cmdline_read_char(void);

#define __fizzer_private_io_model_cmdline_read()                                                    \
    enum {                                                                                          \
        MAX_CHARS   = 4095U /* This value must be equal to iomodels::cmdline::MAX_NUM_CHARS. */     \
    };                                                                                              \
    char*  argv[255];                                                                               \
    char  chars[MAX_CHARS];                                                                         \
    unsigned short  j = 0U;                                                                         \
    unsigned char const  argc = __fizzer_private_io_model_cmdline_read_argc();                      \
    for (unsigned char  i = 0U; i < argc; ++i)                                                      \
    {                                                                                               \
        j = (j & MAX_CHARS);                                                                        \
        argv[i] = &chars[j];                                                                        \
        do                                                                                          \
        {                                                                                           \
            j = (j & MAX_CHARS);                                                                    \
            chars[j] = __fizzer_private_io_model_cmdline_read_char();                               \
            ++j;                                                                                    \
        }                                                                                           \
        while (chars[j - 1U] != '\0');                                                              \
    }                                                                                               \
    argv[argc] = (char*)0

// Two possible entry functions; exactly one of them is actually used.

int  __fizzer_private_int_entry_function(void) { return __fizzer_private_int_method_under_test(); }
int  __fizzer_private_void_entry_function(void) { __fizzer_private_void_method_under_test(); return 0; }
int  __fizzer_private_int_entry_function_with_params(void)
{ __fizzer_private_io_model_cmdline_read(); return __fizzer_private_int_method_under_test_with_params((int)argc, argv); }
int  __fizzer_private_void_entry_function_with_params(void)
{ __fizzer_private_io_model_cmdline_read(); __fizzer_private_void_method_under_test_with_params((int)argc, argv); return 0; }
