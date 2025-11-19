extern unsigned char  __fizzer_private_io_model_cmdline_read_argc(void);
extern char  __fizzer_private_io_model_cmdline_read_char(void);

#define __FIZZER_PRIVATE_IO_MODEL_CMDLINE_MAX_NUM_CHARS  4095U

static struct  __fizzer_private_io_model_cmdline_data_type
{
    char*  argv[255];
    char  chars[__FIZZER_PRIVATE_IO_MODEL_CMDLINE_MAX_NUM_CHARS];
    unsigned char  argc;
} __fizzer_private_io_model_cmdline_data;

static void  __fizzer_private_io_model_cmdline_read_data(struct __fizzer_private_io_model_cmdline_data_type* const  data)
{
    unsigned short  j = 0U;
    data->argc = __fizzer_private_io_model_cmdline_read_argc();
    for (unsigned char  i = 0U; i < data->argc; ++i)
    {
        j = (j & __FIZZER_PRIVATE_IO_MODEL_CMDLINE_MAX_NUM_CHARS);
        data->argv[i] = &data->chars[j];
        do
        {
            j = (j & __FIZZER_PRIVATE_IO_MODEL_CMDLINE_MAX_NUM_CHARS);
            data->chars[j] = __fizzer_private_io_model_cmdline_read_char();
            ++j;
        }
        while (data->chars[j - 1U] != '\0');
    }
    data->argv[data->argc] = (char*)0;
}
