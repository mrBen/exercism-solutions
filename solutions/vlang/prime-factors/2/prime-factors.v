module main

import math

fn prime_factors(n i64) []i64 {
	mut factors := []i64{}

	mut reminder := n
	for candidate := i64(2); reminder > 1; candidate = next_prime(candidate) {
		for reminder % candidate == 0 {
			reminder /= candidate
			factors << candidate
		}
	}

	return factors
}

fn next_prime(n i64) i64 {
	mut candidate := n
	mut is_prime := false
	for !is_prime {
		candidate++
		is_prime = true
		for i := 2; i <= math.sqrt(candidate); i++ {
			if candidate % i == 0 {
				is_prime = false
				break
			}
		}
	}
	return candidate
}
