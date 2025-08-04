#if !defined(NUCLEOTIDE_COUNT_H)
#define NUCLEOTIDE_COUNT_H

#include <map>
#include <string>

namespace nucleotide_count {

class counter {
public:
    counter(const std::string strand);
    std::map<char, int> nucleotide_counts() const noexcept;
    int count(const char nucleotide) const;
private:
    std::map<char, int> nucleotides;
};

}  // namespace nucleotide_count

#endif // NUCLEOTIDE_COUNT_H
