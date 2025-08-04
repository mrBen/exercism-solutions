pub fn is_pangram(sentence: &str) -> bool {
    let mut alphabet = "abcdefghijklmnopqrstuvwxyz".to_string();

    for chr in sentence.to_lowercase().chars() {
        if let Some(n) = alphabet.find(chr) {
            alphabet.remove(n);
        }
    }

    alphabet.is_empty()
}