#include "difference_of_squares.h"

namespace difference_of_squares {

int square_of_sum(const int n)
{
    int sum{};
    for (int i = 1; i <= n; i++)
        sum += i;
    return sum * sum;
}

int sum_of_squares(const int n)
{
    int sum{};
    for (int i = 1; i <= n; i++)
        sum += i * i;
    return sum;
}

int difference(const int n)
{
    return square_of_sum(n) - sum_of_squares(n);
}

}  // namespace difference_of_squares
