const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var letters: @Vector(26, bool) = [_]bool{false} ** 26;
    for (str) |x| {
        if (std.ascii.isAlphabetic(x)) {
            letters[std.ascii.toLower(x) - 'a'] = true;
        }
    }
    return @reduce(.And, letters);
}
