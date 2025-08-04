#include "grains.h"

#include <cmath>

namespace grains {

unsigned long long square(const int n)
{
    return std::pow(2, n - 1);
}

unsigned long long total()
{
    return (unsigned long long) std::pow(2, 64) - 1;
}

}  // namespace grains
