// Package raindrops should have a package comment that summarizes what it's about.
package raindrops

import (
	"strconv"
)

// Convert should have a comment documenting it.
func Convert(n int) string {
	str := ""
	if n%3 == 0 {
		str = "Pling"
	}
	if n%5 == 0 {
		str += "Plang"
	}
	if n%7 == 0 {
		str += "Plong"
	}
	if str == "" {
		str = strconv.Itoa(n)
	}
	return str
}
