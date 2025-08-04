module main

fn age(seconds f64, planet string) !f64 {
	return match planet {
		'Mercury' { age(seconds, 'Earth') or { err } / 0.2408467 }
		'Venus' { age(seconds, 'Earth') or { err } / 0.61519726 }
		'Earth' { seconds / 31557600 }
		'Mars' { age(seconds, 'Earth') or { err } / 1.8808158 }
		'Jupiter' { age(seconds, 'Earth') or { err } / 11.862615 }
		'Saturn' { age(seconds, 'Earth') or { err } / 29.447498 }
		'Uranus' { age(seconds, 'Earth') or { err } / 84.016846 }
		'Neptune' { age(seconds, 'Earth') or { err } / 164.79132 }
		else { error('${planet} is not a valid planet') }
	}
}
