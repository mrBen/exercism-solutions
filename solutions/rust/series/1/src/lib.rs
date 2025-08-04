pub fn series(digits: &str, len: usize) -> Vec<String> {
    let mut series: Vec<String> = vec![];
    if len <= digits.len() {
        for i in 0..(digits.len() - len + 1) {
            series.push(String::from_utf8(digits.as_bytes()[i..(i + len)].to_vec()).unwrap());
        }
    }
    series
}