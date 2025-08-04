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
			if !letters[unicode.ToLower(letter)] {
				letters[unicode.ToLower(letter)] = true
			} else {
				return false
			}
		}
	}
	return true
}
