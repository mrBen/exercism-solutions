module main

fn collatz(number int) !int {
	mut i := 0
	mut num := number
	for num != 1 {
		if num <= 0 {
			return error('should not be negative')
		} else if num % 2 == 0 {
			num /= 2
		} else {
			num = num * 3 + 1
		}
		i++
	}
	return i
}
