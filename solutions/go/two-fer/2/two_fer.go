// Package twofer is short for two for one. One for you and one for me.
package twofer

// ShareWith return one for `name` and one for me.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
