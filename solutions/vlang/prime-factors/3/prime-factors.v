module main

fn prime_factors(n i64) []i64 {
	mut factors := []i64{}

	mut reminder := n
	for candidate := i64(2); reminder > 1; candidate++ {
		for reminder % candidate == 0 {
			reminder /= candidate
			factors << candidate
		}
	}

	return factors
}
