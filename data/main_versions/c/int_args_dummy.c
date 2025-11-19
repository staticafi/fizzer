extern int __fizzer_method_under_test__(int argc, char* argv[]);
int __fizzer_private_entry_function(void)
{
    char* argv[2] = { "a", 0 }; 
    return __fizzer_method_under_test__(1, argv);
}
