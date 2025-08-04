#include "sieve.h"

namespace sieve {

std::vector<int> primes(const int limit)
{
    std::vector<int> primes{};
    for (int i = 2; i <= limit; i++)
        primes.push_back(i);

    for (unsigned i = 0; i < primes.size(); i++) {
        int prime{ primes[i] };
        std::vector<int> new_primes{};
        for (const auto& n : primes) {
            if (n <= prime || n % prime != 0)
                new_primes.push_back(n);
        }
        primes = new_primes;
    }

    return primes;
}

}  // namespace sieve
