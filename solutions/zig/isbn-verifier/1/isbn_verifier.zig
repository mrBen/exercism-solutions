pub fn isValidIsbn10(s: []const u8) bool {
    var sum: u32 = 0;
    var i: u32 = 0;
    for (s) |c| {
        const d = switch (c) {
            '0'...'9' => c - '0',
            'X' => 10,
            '-' => continue,
            else => return false,
        };
        if (d == 10 and i != 9)
            return false;

        sum += d * (10 - i);

        i += 1;
    }
    if (i != 10)
        return false;

    return sum % 11 == 0;
}
