// Package scale should have a package comment that summarizes what it's about.
package scale

import (
	"strings"
)

var sharpPitches = []string{"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"}
var flatPitches = []string{"A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"}

// Scale should have a comment documenting it.
func Scale(tonic string, interval string) []string {
	var pitches []string
	switch tonic {
	case "C", "G", "D", "A", "E", "B", "F#", "a", "e", "b", "f#", "c#", "g#", "d#":
		pitches = sharpPitches
	case "F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb":
		pitches = flatPitches
	}

	i := 0
	tonic = strings.Title(tonic)
	for ; tonic != pitches[i]; i++ {
	}
	if interval == "" {
		interval = "mmmmmmmmmmmm"
	}

	scale := []string{}
	for _, inter := range []rune(interval) {
		scale = append(scale, pitches[i])
		switch inter {
		case 'm':
			i++
		case 'M':
			i += 2
		case 'A':
			i += 3
		}
		i %= 12
	}
	return scale
}
