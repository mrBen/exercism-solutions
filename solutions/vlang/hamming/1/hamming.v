module main

fn distance(a string, b string) !int {
	if a.len != b.len {
		return error('lengths must match!')
	}
	mut distance := 0
	for i := 0; i < a.len; i++ {
		if a[i] != b[i] {
			distance++
		}
	}
	return distance
}
