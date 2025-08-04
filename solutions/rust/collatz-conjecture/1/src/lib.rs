// return Ok(x) where x is the number of steps required to reach 1
pub fn collatz(mut n: u64) -> Result<u64, &'static str> {
    if n < 1 {
        Err("n should be strictly positive")
    } else {
        let mut i = 0;
        while n != 1 {
            n = if n % 2 == 0 { n / 2 } else { 3 * n + 1 };
            i += 1;
        }
        Ok(i)
    }
}