const std = @import("std");
const ArrayList = std.ArrayList;

pub fn isValid(s: []const u8) bool {
    var digits = ArrayList(u32).init(std.testing.allocator);
    defer digits.deinit();
    for (s) |c| {
        const d = switch (c) {
            '0'...'9' => c - '0',
            ' ' => continue,
            else => return false,
        };
        digits.append(d) catch unreachable;
    }

    if (digits.items.len <= 1)
        return false;

    var sum: u32 = 0;
    for (digits.items, 0..) |d, i| {
        const rev_idx = digits.items.len - i - 1;

        if (rev_idx % 2 == 0) {
            sum += d;
        } else {
            sum += d * 2;
            if (d * 2 > 9)
                sum -= 9;
        }
    }
    return sum % 10 == 0;
}
