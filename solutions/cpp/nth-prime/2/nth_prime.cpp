#include "nth_prime.h"

#include <cmath>
#include <stdexcept>

namespace nth_prime {

int nth(const int nth)
{
    if (nth <= 0)
        throw std::domain_error("Weird case");

    int x = 1;
    for (int i = 0; i < nth; i++) {
        do {
            x++;
        } while (!is_prime(x));
    }
    return x;
}

bool is_prime(const int x)
{
    int sqrt = std::sqrt(x);  // no divider can be greater than sqrt
    for (int i = 2; i <= sqrt; i++) {
        if (x % i == 0)
            return false;
    }
    return true;
}

}  // namespace nth_prime
