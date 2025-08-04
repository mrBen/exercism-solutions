// Package strand should have a package comment that summarizes what it's about.
package strand

// ToRNA should have a comment documenting it.
func ToRNA(dna string) string {
	complement := map[rune]string{
		'G': "C",
		'C': "G",
		'T': "A",
		'A': "U",
	}
	rna := ""
	for _, nucleotide := range dna {
		rna += complement[nucleotide]
	}
	return rna
}
