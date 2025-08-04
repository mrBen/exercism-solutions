module main

fn two_fer(name string) string {
	mut n := name
	if name == '' {
		n = 'you'
	}
	return 'One for ${n}, one for me.'
}
