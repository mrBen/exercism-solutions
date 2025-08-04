module main

fn sieve(limit int) []int {
	mut primes := []int{len: limit - 1, init: it + 2}
	for i := 0; i < primes.len; i++ {
		primes = primes.filter(it <= primes[i] || it % primes[i] != 0)
	}
	return primes
}
