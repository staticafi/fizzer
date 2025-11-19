#include "cmdline_model.h"
extern int __fizzer_method_under_test__(int argc, char* argv[]);
int __fizzer_private_entry_function(void)
{
    struct __fizzer_private_io_model_cmdline_data_type* const  data = &__fizzer_private_io_model_cmdline_data;
    __fizzer_private_io_model_cmdline_read_data(data);
    return __fizzer_method_under_test__((int)data->argc, data->argv);
}
