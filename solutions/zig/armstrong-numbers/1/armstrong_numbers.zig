const std = @import("std");
const pow = std.math.pow;

const print = @import("std").debug.print;

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0)
        return true;

    var numberOfDigits: usize = 0;
    var n = num;
    while (n != 0) {
        n /= 10;
        numberOfDigits += 1;
    }

    var rem = num;
    var acc: u128 = 0;
    for (0..numberOfDigits + 1) |i| {
        const mag = pow(u128, @as(u128, 10), i);
        const d = (rem / mag) % 10;
        rem -= d * mag;
        acc += pow(u128, d, numberOfDigits);
    }

    return num == acc;
}
