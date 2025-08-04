#include <math.h>
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

#include "armstrong_numbers.h"

bool is_armstrong_number(int candidate)
{
    if (candidate < 10)
        return true;

    char str_number[12];
    sprintf(str_number, "%d", candidate);
    int nb_digits = strlen(str_number);

    int sum = 0;
    int rank = 1;
    for (int i = 0; i < nb_digits; i++, rank *= 10) {
        int digit = (candidate % (rank * 10)) / rank;
        sum += pow(digit, nb_digits);
    }

    return candidate == sum;
}