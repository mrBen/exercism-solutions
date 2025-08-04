// Package collatzconjecture should have a package comment that summarizes what it's about.
package collatzconjecture

import "errors"

// CollatzConjecture should have a comment documenting it.
func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("n must be strictly positive")
	}

	i := 0
	for ; n != 1; i++ {
		if n%2 == 0 {
			n /= 2
		} else {
			n = 3*n + 1
		}
	}
	return i, nil
}
