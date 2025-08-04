pub fn factors(mut number: u64) -> Vec<u64> {
    let mut factors = Vec::new();
    let mut f = 2;
    
    while number > 1 {
        if number % f == 0 {
            number /= f;
            factors.push(f);
        } else {
            f += 1;
        }
    }
    
    factors
}