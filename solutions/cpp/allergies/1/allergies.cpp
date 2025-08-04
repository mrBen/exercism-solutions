#include "allergies.h"

namespace allergies
{
    allergy_test::allergy_test(int score)
    {
        if (score & 0b00000001)
        {
            allergic_to.insert(allergy::eggs);
        }
        if (score & 0b00000010)
        {
            allergic_to.insert(allergy::peanuts);
        }
        if (score & 0b00000100)
        {
            allergic_to.insert(allergy::shellfish);
        }
        if (score & 0b00001000)
        {
            allergic_to.insert(allergy::strawberries);
        }
        if (score & 0b00010000)
        {
            allergic_to.insert(allergy::tomatoes);
        }
        if (score & 0b00100000)
        {
            allergic_to.insert(allergy::chocolate);
        }
        if (score & 0b01000000)
        {
            allergic_to.insert(allergy::pollen);
        }
        if (score & 0b10000000)
        {
            allergic_to.insert(allergy::cats);
        }
    }

    bool allergy_test::is_allergic_to(std::string item)
    {
        if (item == "eggs")
        {
            return allergic_to.find(allergy::eggs) != allergic_to.end();
        }
        else if (item == "peanuts")
        {
            return allergic_to.find(allergy::peanuts) != allergic_to.end();
        }
        else if (item == "shellfish")
        {
            return allergic_to.find(allergy::shellfish) != allergic_to.end();
        }
        else if (item == "strawberries")
        {
            return allergic_to.find(allergy::strawberries) != allergic_to.end();
        }
        else if (item == "tomatoes")
        {
            return allergic_to.find(allergy::tomatoes) != allergic_to.end();
        }
        else if (item == "chocolate")
        {
            return allergic_to.find(allergy::chocolate) != allergic_to.end();
        }
        else if (item == "pollen")
        {
            return allergic_to.find(allergy::pollen) != allergic_to.end();
        }
        else if (item == "cats")
        {
            return allergic_to.find(allergy::cats) != allergic_to.end();
        }
        return false;
    }

    std::unordered_set<std::string> allergy_test::get_allergies()
    {
        auto allergies = std::unordered_set<std::string>();
        if (allergic_to.find(allergy::eggs) != allergic_to.end())
        {
            allergies.insert("eggs");
        }
        if (allergic_to.find(allergy::peanuts) != allergic_to.end())
        {
            allergies.insert("peanuts");
        }
        if (allergic_to.find(allergy::shellfish) != allergic_to.end())
        {
            allergies.insert("shellfish");
        }
        if (allergic_to.find(allergy::strawberries) != allergic_to.end())
        {
            allergies.insert("strawberries");
        }
        if (allergic_to.find(allergy::tomatoes) != allergic_to.end())
        {
            allergies.insert("tomatoes");
        }
        if (allergic_to.find(allergy::chocolate) != allergic_to.end())
        {
            allergies.insert("chocolate");
        }
        if (allergic_to.find(allergy::pollen) != allergic_to.end())
        {
            allergies.insert("pollen");
        }
        if (allergic_to.find(allergy::cats) != allergic_to.end())
        {
            allergies.insert("cats");
        }
        return allergies;
    }

} // namespace allergies
