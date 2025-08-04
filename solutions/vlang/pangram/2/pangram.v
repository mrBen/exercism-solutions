module main

fn is_pangram(phrase string) bool {
	for letter in `a` .. `z` {
		if letter !in phrase.to_lower().bytes() {
			return false
		}
	}
	return true
}
