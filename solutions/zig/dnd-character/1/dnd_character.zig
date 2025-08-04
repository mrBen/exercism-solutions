const std = @import("std");

var rand = std.crypto.random;

pub fn modifier(score: i8) i8 {
    return @divFloor((score - 10), 2);
}

pub fn ability() i8 {
    var dice: [4]i8 = undefined;
    for (0..dice.len) |i| {
        dice[i] = rand.intRangeAtMost(i8, 1, 6);
    }
    std.mem.sort(i8, &dice, {}, comptime std.sort.desc(i8));
    return dice[0] + dice[1] + dice[2];
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const str = ability();
        const dex = ability();
        const con = ability();
        const int = ability();
        const wis = ability();
        const cha = ability();
        return Character{
            .strength = str,
            .dexterity = dex,
            .constitution = con,
            .intelligence = int,
            .wisdom = wis,
            .charisma = cha,
            .hitpoints = 10 + modifier(con),
        };
    }
};
