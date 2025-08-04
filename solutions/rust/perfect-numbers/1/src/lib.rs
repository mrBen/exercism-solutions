#[derive(Debug, PartialEq)]
pub enum Classification {
    Perfect,
    Abundant,
    Deficient
}

pub fn classify(n: u64) -> Result<Classification, &'static str> {
    if n < 1 { return Err("Number must be positive") }

    let mut factors: Vec<u64> = Vec::new();

    for f in 1..n {
        if n % f == 0 {
            factors.push(f);
        }
    }

    let aliquot_sum: u64 = factors.iter().sum();
    if aliquot_sum < n {
        Ok(Classification::Deficient)
    } else if aliquot_sum > n {
        Ok(Classification::Abundant)
    } else {
        Ok(Classification::Perfect)
    }
}