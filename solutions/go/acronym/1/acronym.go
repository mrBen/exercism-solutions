// Package acronym should have a package comment that summarizes what it's about.
package acronym

import "unicode"

// Abbreviate should have a comment documenting it.
func Abbreviate(s string) string {
	abbr := ""
	lookingForWord := true
	for _, c := range s {
		if unicode.IsLetter(c) && lookingForWord {
			abbr += string(unicode.ToUpper(c))
			lookingForWord = false
		} else if unicode.IsSpace(c) || c == '-' {
			lookingForWord = true
		}
	}
	return abbr
}
