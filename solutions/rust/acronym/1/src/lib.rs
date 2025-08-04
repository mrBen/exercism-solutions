pub fn abbreviate(phrase: &str) -> String {
    phrase
        .replace("-", " ").split_whitespace()  
        .map(|w| if w == w.to_uppercase() {w.to_string().to_lowercase()} else {w.to_string()})
        // Capitalization
        .map(|w| {
            let mut c = w.chars();
            match c.next() {
                None => String::new(),
                Some(f) => f.to_uppercase().collect::<String>() + c.as_str(),
            }
        })
        .collect::<Vec<String>>().join("")
        .chars().filter(|c| c.is_uppercase()).collect()
}
