use std::collections::HashMap;

pub fn count(nucleotide: char, DNA: &str) -> Result<usize, &'static str> {

    if !"ACGT".contains(nucleotide) {
        return Err("nucleotide isn't A, C, G or T");
    }
    if DNA.chars().any(|x| !"ACGT".contains(x)) {
        return Err("DNA isn't A, C, G or T");
    }

    Ok(
        DNA.chars().fold(0, |n, x| if x == nucleotide { n + 1 } else { n })
    )
}

pub fn nucleotide_counts(DNA: &str) -> Result<HashMap<char, usize>, &'static str> {
    let mut counts = HashMap::new();

    for nucleotide in "ACGT".chars() {
        if let Ok(n) = count(nucleotide, DNA) {
            counts.insert(nucleotide, n);
        } else {
            return Err("");
        }
    }

    Ok(counts)
}