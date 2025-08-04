pub fn nth(goal: i32) -> Result<i32, &'static str> {
    let mut nth: i32 = 1;
    let mut n: i32 = 1;

    if goal <= 0 {
        Err("there is no 0th prime")
    } else if goal == 1 {
        Ok(2)
    } else {
    
        while nth < goal {
            n += 2;
            if prime(n) { nth += 1; }
        }
        
        Ok(n)
    }
}

fn prime(n: i32) -> bool {
    if n % 2 == 0 { return false }
    
    let mut q: i32 = 3;
    let limit: i32 = (n as f64).sqrt() as i32;
    while q <= limit {
        if n % q == 0 {
            return false;
        } else {
            q += 2;
        }
    }
    
    true
}