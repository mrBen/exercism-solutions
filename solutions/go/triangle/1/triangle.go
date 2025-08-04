// Package triangle should have a package comment that summarizes what it's about.
package triangle

import "math"

// Kind of triangle.
type Kind int

const (
	// NaT is not a triangle.
	NaT Kind = iota
	// Equ is equilateral.
	Equ
	// Iso is isosceles.
	Iso
	// Sca is scalene.
	Sca
)

// KindFromSides should have a comment documenting it.
func KindFromSides(a, b, c float64) Kind {
	if a <= 0 || b <= 0 || c <= 0 || a > b+c || b > a+c || c > a+b {
		return NaT
	}
	if math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) || math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0) {
		return NaT
	}

	if a == b && b == c {
		return Equ
	} else if a == b || a == c || b == c {
		return Iso
	} else {
		return Sca
	}
}
