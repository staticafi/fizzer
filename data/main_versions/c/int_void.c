extern int __fizzer_method_under_test__(void);
int __fizzer_private_entry_function(void)
{
    return __fizzer_method_under_test__();
}
