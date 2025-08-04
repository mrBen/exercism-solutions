// Package hamming provide a hamming distance function.
package hamming

import "errors"

// Distance compute the hamming difference between two DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("a and b must be of the same size")
	}

	d := 0
	for i := range a {
		if a[i] != b[i] {
			d++
		}
	}
	return d, nil
}
