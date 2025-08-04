const std = @import("std");
const mem = std.mem;
const ArrayList = std.ArrayList;

fn transpose(c: u8) u8 {
    return switch (c) {
        '0'...'9' => c,
        'A'...'Z' => 'z' - (c - 'A'),
        'a'...'z' => 'z' - (c - 'a'),
        else => ' ',
    };
}

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var ciphertext = ArrayList(u8).init(allocator);
    var i: usize = 0;
    for (s) |c| {
        const x = transpose(c);
        switch (transpose(c)) {
            ' ' => continue,
            else => {
                if (i != 0 and i % 5 == 0)
                    try ciphertext.append(' ');
                try ciphertext.append(x);
                i += 1;
            },
        }
    }
    return ciphertext.items;
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var plaintext = ArrayList(u8).init(allocator);
    for (s) |c| {
        const x = transpose(c);
        switch (transpose(c)) {
            ' ' => continue,
            else => try plaintext.append(x),
        }
    }
    return plaintext.items;
}
