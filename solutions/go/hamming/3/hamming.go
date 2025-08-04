// Package hamming provide a hamming distance function.
package hamming

import "errors"

// Distance compute the hamming difference between two DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("the two strands must be of the same size")
	}

	aRunes := []rune{}
	for _, r := range a {
		aRunes = append(aRunes, r)
	}
	bRunes := []rune{}
	for _, r := range b {
		bRunes = append(bRunes, r)
	}

	dist := 0
	for i := range aRunes {
		if aRunes[i] != bRunes[i] {
			dist++
		}
	}
	return dist, nil
}
