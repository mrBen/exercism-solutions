pub fn score(s: []const u8) u32 {
    var points: u32 = 0;
    for (s) |letter| {
        points += switch (letter) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => 1,
            'D', 'G' => 2,
            'B', 'C', 'M', 'P' => 3,
            'F', 'H', 'V', 'W', 'Y' => 4,
            'K' => 5,
            'J', 'X' => 8,
            'Q', 'Z' => 10,
            'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => 1,
            'd', 'g' => 2,
            'b', 'c', 'm', 'p' => 3,
            'f', 'h', 'v', 'w', 'y' => 4,
            'k' => 5,
            'j', 'x' => 8,
            'q', 'z' => 10,
            else => 0,
        };
    }
    return points;
}
