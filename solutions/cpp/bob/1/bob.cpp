#include "bob.h"

#include <algorithm>
#include <locale>

namespace bob
{
    std::string hey(std::string say)
    {
        auto it = std::find_if(say.rbegin(), say.rend(), [](char ch)
                               { return !std::isspace<char>(ch, std::locale::classic()); });
        say.erase(it.base(), say.end());

        if (say.empty())
            return "Fine. Be that way!";

        std::locale locale("C");

        bool question = say.back() == '?';

        bool not_yell = true;
        for (char &c : say)
            if (std::isupper(c, locale))
                not_yell = false;
        bool yell = true;
        for (char &c : say)
            if (std::islower(c, locale))
                yell = false;

        bool empty = true;
        for (char &c : say)
            if (!std::isspace(c, locale))
                empty = false;

        if (empty)
            return "Fine. Be that way!";
        if (question)
        {
            if (yell && !not_yell)
                return "Calm down, I know what I'm doing!";
            return "Sure.";
        }
        if (yell && !not_yell)
            return "Whoa, chill out!";
        return "Whatever.";
    }
} // namespace bob
