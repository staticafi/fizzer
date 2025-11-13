char *__fizzer_model__strerror(int errnum)
{
    /* Static buffer for demonstration purposes */
    static char unknown[] = "Unknown error";

    /* Simple model mapping common error codes */
    switch (errnum)
    {
        case 0:
            return "No error";
        case 1:
            return "Operation not permitted";
        case 2:
            return "No such file or directory";
        case 3:
            return "No such process";
        case 4:
            return "Interrupted system call";
        case 5:
            return "Input/output error";
        default:
            return unknown;
    }
}
