const std = @import("std");
const mem = std.mem;
const ArrayList = std.ArrayList;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = ArrayList(u8).init(allocator);
    defer rna.deinit();

    for (dna) |strand| {
        try rna.append(switch (strand) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => unreachable,
        });
    }
    return rna.toOwnedSlice();
}
