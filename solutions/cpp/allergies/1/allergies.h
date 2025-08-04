#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <string>
#include <unordered_set>

namespace allergies
{
    enum allergy
    {
        eggs = 1,
        peanuts = 2,
        shellfish = 4,
        strawberries = 8,
        tomatoes = 16,
        chocolate = 32,
        pollen = 64,
        cats = 128
    };

    class allergy_test
    {
    public:
        allergy_test(int score);
        bool is_allergic_to(std::string item);
        std::unordered_set<std::string> get_allergies();

    private:
        std::unordered_set<allergy> allergic_to;
    };
} // namespace allergies

#endif // ALLERGIES_H
