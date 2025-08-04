module main

// you'll probably want this
import rand

// define the Robot struct here
struct Robot {
	name string
}

// we need a place to store all these robots!
// make sure to update all the <TYPE>s to match
// this should probably be an array or a map ;)
fn create_robot_storage() []Robot {
	return []Robot{}
}

fn create_robot(mut robots []Robot) Robot {
	letter := (rand.u32() % (`Z` - `A`) + `A`).str() + (rand.u32() % (`Z` - `A`) + `A`).str()
	number := rand.u32() % 1000
	name := '${letter}${number:03}'
	return Robot{name}
}

fn (mut r Robot) reset(mut robots []Robot) {
	new_robot := create_robot(mut robots)
	r = new_robot
}
