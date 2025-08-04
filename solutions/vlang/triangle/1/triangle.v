module main

fn is_isosceles(a f64, b f64, c f64) bool {
	return triangle_inequality(a, b, c) && (a == b || a == c || b == c)
}

fn is_equilateral(a f64, b f64, c f64) bool {
	return a == b && b == c
}

fn is_scalene(a f64, b f64, c f64) bool {
	return triangle_inequality(a, b, c) && !is_isosceles(a, b, c) && !is_equilateral(a, b, c)
}

fn triangle_inequality(a f64, b f64, c f64) bool {
	return a + b >= c && b + c >= a && a + c >= b
}
