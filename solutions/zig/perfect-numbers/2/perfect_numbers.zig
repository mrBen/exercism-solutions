pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var aliquot_sum: u64 = 0;
    for (1..n) |i| {
        if (n % i == 0)
            aliquot_sum += i;
    }

    if (aliquot_sum == n)
        return .perfect;
    if (aliquot_sum > n)
        return .abundant;

    return .deficient;
}
