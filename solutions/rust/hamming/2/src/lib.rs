pub fn hamming_distance(first: &str, second: &str) -> Result<i32, &'static str> {
    if first.len() != second.len() {
        return Err("not the same length");
    }

    let mut dist = 0;
    let mut chr_second = second.chars();

    for chr_first in first.chars() {
        if chr_first != chr_second.next().unwrap() {
            dist += 1;
        }
    }

    Ok(dist)
}