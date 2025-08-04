pub fn factors(mut number: u64) -> Vec<u64> {
    let mut factors: Vec<u64> = Vec::new();
    let mut primes: Vec<u64> = vec![2];
    
    while number > 1 {  // while factorization isn't finished
        if number % primes[primes.len()-1] == 0 {  // if the last prime we got is a factor
            factors.push(primes[primes.len()-1]);  // add it to the factors
            number = number / factors[factors.len()-1];  // and update number
        } else {  // else find the next prime
            if primes[primes.len()-1] == 2 {
                primes.push(3)
            } else {
            
                let mut n = primes[primes.len()-1] + 2;
                while primes.iter()
                            .filter(|&p| n % p == 0)
                            .count() > 0 {  // while n have prime factor
                    n += 2;  // try next odd

                }
                primes.push(n);
            
            }
        }
    }
    
    factors
}