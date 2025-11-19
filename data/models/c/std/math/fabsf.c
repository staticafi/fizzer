#include "fabsf.h"
float __fizzer_model__fabsf(float x)
{
    if (x < 0.0f)
        return -x;
    else
        return x;
}
