module main

fn nth_prime(n int) !int {
	if n <= 0 {
		return error('n must be greater than 0')
	}
	mut primes := [2, 3, 5, 7, 11, 13]
	for n > primes.len {
		mut candidate := primes.last()
		mut is_prime := false
		for !is_prime {
			candidate++
			is_prime = true
			for i := 0; i < primes.len && is_prime; i++ {
				if candidate % primes[i] == 0 {
					is_prime = false
				}
			}
		}
		primes << candidate
	}
	return primes[n - 1]
}
