pub fn lsp(string: &str, length: usize) -> Result<u32, &'static str> {
    if length == 0 { return Ok(1) }
    if length > string.len() { return Err("") }

    let mut digits: Vec<u32> = Vec::new();
    for chr in string.chars() {
        if chr.is_digit(10) {
            digits.push(chr.to_digit(10).unwrap())
        } else {
            return Err("")
        }
    }

    Ok(digits.windows(length)
             .map(|v| v.iter().product())
             .max().unwrap())
}