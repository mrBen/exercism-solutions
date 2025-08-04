module main

fn is_pangram(phrase string) bool {
    for letter in u8(97) .. u8(122) {
        if !(letter in phrase.to_lower().bytes()) {
            return false
        }
    }
    return true
}