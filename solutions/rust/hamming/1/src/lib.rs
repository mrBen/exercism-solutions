pub fn hamming_distance<'a>(first: &'a str, second: &'a str) -> Result<i32, &'a str> {
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