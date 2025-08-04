module main

fn grains_on_square(square i64) !i64 {
	if square < 1 || square > 64 {
		return error('square must be between 1 and 64')
	}
	return match square {
		1 { 1 }
		else { grains_on_square(square - 1) or { err } * 2 }
	}
}

fn total_grains_on_board() i64 {
	mut sum := i64(0)
	for i := 1; i <= 64; i++ {
		sum += grains_on_square(i) or { 0 }
	}
	return sum
}
