const std = @import("std");
const pow = std.math.pow;

pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index == 0 or index > 64)
        return ChessboardError.IndexOutOfBounds;

    return pow(u64, 2, index - 1);
}

pub fn total() u64 {
    var sum: u64 = 0;
    for (0..64) |i| {
        sum += square(i + 1) catch unreachable;
    }
    return sum;
}
