extern unsigned char  __fizzer_private_io_model_cmdline_read_argc(void);
extern char  __fizzer_private_io_model_cmdline_read_char(void);

#define __FIZZER_PRIVATE_IO_MODEL_CMDLINE_BIT_SHIFT     12U

static struct  __fizzer_private_io_model_cmdline_data_type
{
    char*  argv[256];
    char  chars[1U << __FIZZER_PRIVATE_IO_MODEL_CMDLINE_BIT_SHIFT]; // 4096U chars
    unsigned char  argc;
} __fizzer_private_io_model_cmdline_data;

static void  __fizzer_private_io_model_cmdline_read_data(struct __fizzer_private_io_model_cmdline_data_type* const  data)
{
    unsigned short  j = 0U;
    data->argc = __fizzer_private_io_model_cmdline_read_argc();
    for (unsigned short  i = 0U; i < data->argc; ++i)
    {
        data->argv[i] = &data->chars[j];
        do
        {
            char const  incoming_char = __fizzer_private_io_model_cmdline_read_char();
            unsigned short const  is_full = (unsigned short)((j + 1U) >> __FIZZER_PRIVATE_IO_MODEL_CMDLINE_BIT_SHIFT);
            unsigned short const  delta = 1U - is_full;
            data->chars[j] = (char)((unsigned short)incoming_char * delta);
            j += delta;
        }
        while (data->chars[j - 1U] != '\0');
    }
}
