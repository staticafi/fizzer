int __fizzer_model__snprintf(char *str, size_t size, const char *format, ...)
{
    va_list ap;
    va_start(ap, format);
    int result = __fizzer_model__vsnprintf(str, size, format, ap);
    va_end(ap);
    return result;
}
