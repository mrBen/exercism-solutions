pub fn reply(ask: &str) -> &str {
    if ask == "" {
        return "Fine. Be that way!"
    };

    if ask.chars().nth(ask.len() - 1) == Some('?') {
        return "Sure.";
    };

    for c in ask.chars() {
        if c.is_alphabetic() && c.is_lowercase() {
            return "Whatever."
        }
    };

    "Whoa, chill out!"
}