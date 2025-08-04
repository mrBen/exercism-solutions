const std = @import("std");
const pow = std.math.pow;

pub fn isArmstrongNumber(num: u128) bool {
    var numberOfDigits: usize = 0;
    var n = num;
    while (n != 0) {
        n /= 10;
        numberOfDigits += 1;
    }

    var acc: u128 = 0;
    var i = num;
    while (i != 0) {
        acc += pow(u128, i % 10, numberOfDigits);
        i /= 10;
    }

    return acc == num;
}
