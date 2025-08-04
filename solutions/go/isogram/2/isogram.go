// Package isogram should have a package comment that summarizes what it's about.
package isogram

import (
	"unicode"
)

// IsIsogram should have a comment documenting it.
func IsIsogram(word string) bool {
	letters := make(map[rune]bool)
	for _, letter := range word {
		if unicode.IsLetter(letter) {
			lower := unicode.ToLower(letter)
			if letters[lower] {
				return false
			}
			letters[lower] = true
		}
	}
	return true
}
