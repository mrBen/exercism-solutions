#include <ctype.h>
#include <string.h>

#include "isogram.h"

bool is_isogram(const char phrase[])
{
    if (phrase == NULL)
        return false;
    
    bool used[26] = { false };

    for (size_t i = 0; i < strlen(phrase); i++) {
        if (phrase[i] == ' ' || phrase[i] == '-')
            continue;
        
        size_t ch = tolower((unsigned char) phrase[i]) - 'a';
        if (used[ch]) {
            return false;
        }
        used[ch] = true;
    }
    return true;
}
