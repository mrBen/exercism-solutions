module main

fn count_nucleotides(strand string) !map[string]int {
	mut nucleotides := {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}
	for nucleotide in strand.runes() {
		if nucleotide.str() !in nucleotides {
			return error('${nucleotide.str()} is not a valid nucleotide!')
		}
		nucleotides[nucleotide.str()] += 1
	}
	return nucleotides
}
