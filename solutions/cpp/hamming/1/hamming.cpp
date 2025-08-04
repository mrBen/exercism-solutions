#include "hamming.h"

#include <stdexcept>

namespace hamming {

int compute(const std::string first, const std::string second)
{
    if (first.size() != second.size())
        throw std::domain_error{ "Strand are not the same size." };

    int distance{};
    for (unsigned i = 0; i < first.size(); i++) {
        if (first[i] != second[i])
            distance++;
    }
    return distance;
}

}  // namespace hamming
