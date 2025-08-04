pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    rank: i8,
    file: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row < 0 or row >= 8 or col < 0 or col >= 8)
            return QueenError.InitializationFailure;

        return Queen{
            .rank = row,
            .file = col,
        };
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        if (self.rank == other.rank or self.file == other.file)
            return true;
        if (self.rank - other.rank == self.file - other.file)
            return true;
        if ((self.rank - other.rank) + (self.file - other.file) == 0)
            return true;

        return false;
    }
};
