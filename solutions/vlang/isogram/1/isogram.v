module main

fn is_isogram(word string) bool {
	mut letters := []u8{}
	for letter in word.to_lower() {
		if letter in letters && letter.is_letter() {
			return false
		}
		letters << letter
	}
	return true
}
