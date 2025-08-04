module main

struct Clock {
	hour   int
	minute int
}

fn new_clock(hour int, minute int) Clock {
	mut c := Clock{0, 0}
	if hour >= 0 {
		c.add_time(hour * 60)
	} else {
		c.subtract_time(-hour * 60)
	}
	if minute >= 0 {
		c.add_time(minute)
	} else {
		c.subtract_time(-minute)
	}
	return c
}

fn (mut c Clock) add_time(minute int) {
	mut h := c.hour
	mut m := c.minute + minute
	h = (h + (m / 60)) % 24
	m %= 60
	c = Clock{h, m}
}

fn (mut c Clock) subtract_time(minute int) {
	mut h := c.hour
	mut m := c.minute - minute
	for m < 0 {
		m += 60
		h -= 1
	}
	for h < 0 {
		h += 24
	}
	h += m / 60 % 24
	m %= 60
	c = Clock{h, m}
}

fn (c Clock) string() string {
	return '${c.hour:02}:${c.minute:02}'
}
