module main

fn accumulate_ints(values []int, operation fn (int) int) []int {
	mut accumulated := []int{cap: values.len}
	for value in values {
		accumulated << operation(value)
	}
	return accumulated
}

fn accumulate_strs(values []string, operation fn (string) string) []string {
	mut accumulated := []string{cap: values.len}
	for value in values {
		accumulated << operation(value)
	}
	return accumulated
}
