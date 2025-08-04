module main

// reverse_string returns a given string in reverse order
fn reverse_string(str string) string {
	mut reversed := ""
	for ch in str {
		reversed = ch.ascii_str() + reversed
	}
	return reversed
}
