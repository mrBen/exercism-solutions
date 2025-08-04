#include "nth_prime.h"

#include <cmath>
#include <stdexcept>

namespace nth_prime {

int nth(const int target)
{
    if (target <= 0)
        throw std::domain_error("Weird case");

    int x = 1;  // start testing at 2, -- because loop start with ++
    int nth = 0;
    while (nth < target) {
        x++;
        if (is_prime(x))
            nth++;
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
