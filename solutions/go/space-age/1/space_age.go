package space

type Planet string

func Age(age float64, planet Planet) float64 {
	coeff := make(map[Planet]float64)
	coeff["Earth"] = 1
	coeff["Mercury"] = 0.2408467
	coeff["Venus"] = 0.61519726
	coeff["Mars"] = 1.8808158
	coeff["Jupiter"] = 11.862615
	coeff["Saturn"] = 29.447498
	coeff["Uranus"] = 84.016846
	coeff["Neptune"] = 164.79132
	return (age / 31557600) / coeff[planet]
}
