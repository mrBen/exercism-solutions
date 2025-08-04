const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var letters: [26]bool = undefined;
    for (str) |c| {
        const i = switch (c) {
            'A'...'Z' => c - 'A',
            'a'...'z' => c - 'a',
            else => continue,
        };
        if (letters[i])
            return false;
        letters[i] = true;
    }
    return true;
}
