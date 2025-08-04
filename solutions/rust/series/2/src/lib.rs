pub fn series(digits: &str, len: usize) -> Vec<String> {
    match len {
        0 => vec!["".to_string(); digits.len() + 1],
        n => digits
            .as_bytes()
            .windows(n)
            .map(|x| String::from_utf8(x.to_vec()).unwrap())
            .collect(),
    }
}