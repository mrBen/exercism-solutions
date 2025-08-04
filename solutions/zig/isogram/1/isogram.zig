const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var letters: [26]bool = undefined;
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            const i = std.ascii.toLower(c) - 'a';
            if (letters[i])
                return false;
            letters[i] = true;
        }
    }
    return true;
}
