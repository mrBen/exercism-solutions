pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    const sum = aliquot_sum(n);
    if (sum == n)
        return Classification.perfect;
    if (sum > n)
        return Classification.abundant;

    return Classification.deficient;
}

fn aliquot_sum(n: u64) u64 {
    var sum: u64 = 0;
    for (1..n) |i| {
        if (n % i == 0)
            sum += i;
    }
    return sum;
}
