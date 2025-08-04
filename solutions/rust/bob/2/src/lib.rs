pub fn reply(ask: &str) -> &str {
    if ask == "" {
        "Fine. Be that way!"
    } else if ask.end_with('?') {
        "Sure."
    } else if ask == ask.to_uppercase() {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}