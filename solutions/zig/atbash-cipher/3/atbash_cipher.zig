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
    var buffer = ArrayList(u8).init(allocator);
    defer buffer.deinit();
    var i: usize = 0;
    for (s) |c| {
        const x = transpose(c);
        if (x == ' ')
            continue;
        if (i != 0 and i % 5 == 0)
            try buffer.append(' ');
        try buffer.append(x);
        i += 1;
    }

    const ciphertext = try allocator.alloc(u8, buffer.items.len);
    mem.copyForwards(u8, ciphertext, buffer.items);
    return ciphertext;
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var buffer = ArrayList(u8).init(allocator);
    defer buffer.deinit();
    for (s) |c| {
        const x = transpose(c);
        if (x == ' ')
            continue;
        try buffer.append(x);
    }

    const plaintext = try allocator.alloc(u8, buffer.items.len);
    mem.copyForwards(u8, plaintext, buffer.items);
    return plaintext;
}
