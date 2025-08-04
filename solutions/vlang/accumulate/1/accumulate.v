module main

fn accumulate_ints(values []int, operation fn (int) int) []int {
	return values.map(operation(it))
}

fn accumulate_strs(values []string, operation fn (string) string) []string {
	return values.map(operation(it))
}
