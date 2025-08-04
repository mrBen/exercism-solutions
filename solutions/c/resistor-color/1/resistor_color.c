#include <stdlib.h>

#include "resistor_color.h"

int color_code(resistor_band_t color)
{
    return color;
}

resistor_band_t* colors()
{
    resistor_band_t* colors = calloc(10, sizeof (resistor_band_t));
    for (int i = 0; i < 10; i++)
        colors[i] = i;

    return colors;
}