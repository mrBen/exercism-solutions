const std = @import("std");
const fmt = std.fmt;

pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    const n = name orelse "you";
    return fmt.bufPrint(buffer, "One for {s}, one for me.", .{n});
}
