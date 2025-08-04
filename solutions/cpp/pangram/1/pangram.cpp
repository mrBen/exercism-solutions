#include "pangram.h"

namespace pangram {

bool is_pangram(std::string sentence)
{
    bool is_used['z' - 'a'];
    for (char& c : sentence) {
        if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z'))
            is_used[tolower(c) - 'a'] = true;
    }

    for (bool used : is_used)
        if (!used)
            return false;
    return true;
}

}  // namespace pangram
