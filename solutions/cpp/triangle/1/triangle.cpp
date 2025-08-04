#include "triangle.h"

#include <stdexcept>

namespace triangle {

flavor kind(double a, double b, double c)
{
    if (a <= 0 || b <= 0 || c <= 0) {
        throw std::domain_error("Triangle with zero or negative sides are illegal");
    }
    if (a + b < c || a + c < b || b + c < a) {
        throw std::domain_error("Triangle violating triangle inequality are illegal");
    }

    if (a == b && a == c) {
        return flavor::equilateral;
    }
    if (a == b || a == c || b == c) {
        return flavor::isosceles;
    }
    return flavor::scalene;
}

}  // namespace triangle
