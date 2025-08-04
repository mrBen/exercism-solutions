#[derive(Debug, PartialEq)]
pub enum Classification {
    Perfect,
    Abundant,
    Deficient
}

pub fn classify(n: u64) -> Result<Classification, &'static str> {
    if n < 1 { return Err("Number must be positive") }

    let aliquot_sum: u64 = (1..n).filter(|f| n % f == 0).sum();
    if aliquot_sum < n {
        Ok(Classification::Deficient)
    } else if aliquot_sum > n {
        Ok(Classification::Abundant)
    } else {
        Ok(Classification::Perfect)
    }
}