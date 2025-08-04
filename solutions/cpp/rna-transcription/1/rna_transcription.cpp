#include "rna_transcription.h"

namespace rna_transcription {

char to_rna(const char dna)
{
    switch (dna) {
    case 'C':
        return 'G';
    case 'G':
        return 'C';
    case 'A':
        return 'U';
    case 'T':
        return 'A';
    default:
        return '\0';
    }
}

std::string to_rna(const std::string dna)
{
    std::string rna{};
    for (const auto& nucleotide : dna) {
        rna.push_back(to_rna(nucleotide));
    }
    return rna;
}

}  // namespace rna_transcription
