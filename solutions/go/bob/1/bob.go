// Package bob should have a package comment that summarizes what it's about.
package bob

import "strings"

// Hey should have a comment documenting it.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	question := false
	if strings.HasSuffix(remark, "?") {
		question = true
	}

	yell := false
	if strings.ToUpper(remark) == remark && strings.ToLower(remark) != remark {
		yell = true
	}

	if remark == "" {
		return "Fine. Be that way!"
	} else if question && yell {
		return "Calm down, I know what I'm doing!"
	} else if question {
		return "Sure."
	} else if yell {
		return "Whoa, chill out!"
	} else {
		return "Whatever."
	}
}
