#include "raindrops.h"

namespace raindrops {

std::string convert(int n)
{
    std::string sound = "";
    if (n % 3 == 0)
        sound += "Pling";
    if (n % 5 == 0)
        sound += "Plang";
    if (n % 7 == 0)
        sound += "Plong";
    if (sound.length() == 0)
        sound = std::to_string(n);
    return sound;
}

}  // namespace raindrops
