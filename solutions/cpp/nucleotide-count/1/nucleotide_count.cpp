#include "nucleotide_count.h"

#include <stdexcept>

namespace nucleotide_count {

counter::counter(const std::string strand)
{
    nucleotides['A'] = 0;
    nucleotides['T'] = 0;
    nucleotides['C'] = 0;
    nucleotides['G'] = 0;

    for (const auto& nucleotide : strand) {
        if (nucleotides.find(nucleotide) == nucleotides.end())
            throw std::invalid_argument{ "input is not a nucleotide" };

        nucleotides[nucleotide]++;
    }
}

std::map<char, int> counter::nucleotide_counts() const noexcept
{
    return nucleotides;
}

int counter::count(const char nucleotide) const
{
    if (nucleotides.find(nucleotide) == nucleotides.end())
        throw std::invalid_argument{ "input is not a nucleotide" };

    return nucleotides.at(nucleotide);
}

}  // namespace nucleotide_count
