module main

import math

fn can_queen_attack(white string, black string) !bool {
	x1, y1 := square(white) or { return error('${white} is ${err}') }
	x2, y2 := square(black) or { return error('${black} is ${err}') }
	if x1 == x2 && y1 == y2 {
		return error('queens on same square')
	}

	same_file := x1 == x2
	same_rank := y1 == y2
	same_diagonal := math.abs(x1 - y1) == math.abs(x2 - y2)
	return same_file || same_rank || same_diagonal
}

fn square(name string) !(int, int) {
	if name.len < 2 {
		return error('not a valid square')
	}
	x := int(name[0] - `a`)
	y := int(name[1] - `1`)
	if x < 0 || x > 7 || y < 0 || y > 7 {
		return error('not a valid square')
	}
	return x, y
}
