int __fizzer_private_entry_function(void)
{
    struct __fizzer_private_io_model_cmdline_data_type* const  data = &__fizzer_private_io_model_cmdline_data;
    __fizzer_private_io_model_cmdline_read_data(data);
    __fizzer_method_under_test__((int)data->argc, data->argv);
    return 0;
}
