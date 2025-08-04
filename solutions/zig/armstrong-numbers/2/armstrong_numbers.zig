const std = @import("std");
const pow = std.math.pow;

const print = @import("std").debug.print;

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0)
        return true;

    var numberOfDigits: usize = 0;
    var i = num;
    while (i != 0) {
        i /= 10;
        numberOfDigits += 1;
    }

    var acc = 0;
    i = num;
    while (i != 0) {
        var n = i % 10;
        acc += pow(u128, n, numberOfDigits);

        i /= 10;
    }
}
