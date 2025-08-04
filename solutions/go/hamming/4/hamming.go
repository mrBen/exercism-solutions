// Package hamming provide a hamming distance function.
package hamming

import "errors"

// Distance compute the hamming difference between two DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("the two strands must be of the same size")
	}

	dist := 0
	for i := range []rune(a) {
		if []rune(a)[i] != []rune(b)[i] {
			dist++
		}
	}
	return dist, nil
}
