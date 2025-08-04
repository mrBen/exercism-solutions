class QueenAttack {
  white { _white }
  black { _black }

  construct new() {
    _white = [7, 3]
    _black = [0, 3]
  }

  construct new(pieces) {
    _white = pieces["white"]
    if (white == null) {
      _white = [7, 3]
    }
    _black = pieces["black"]
    if (black == null) {
       _black = [0, 3]
    }
    if (white[0] < 0 || white[0] > 7 || white[1] < 0 || white[1] > 7 || black[0] < 0 || black[0] > 7 || black[1] < 0 || black[1] > 7) {
      Fiber.abort("Queen must be placed on the board")
    }
    if (white[0] == black[0] && white[1] == black[1]) {
      Fiber.abort("Queens cannot share the same space")
    }
  }

  toString {
    var board = ""
    for (i in 0..7) {
      var rank = ""
      for (j in 0..7) {
        if (white[0] == i && white[1] == j) {
          rank = rank + "W "
        } else if (black[0] == i && black[1] == j) {
          rank = rank + "B "
        } else {
          rank = rank + "_ "
        }
      }
      board = board + rank.trim() + "\n"
    }
    return board.trim()
  }

  canAttack {
    var sameRank = white[0] == black[0]
    var sameFile = white[1] == black[1]
    var sameDiag = white[0] - black[0] == white[1] - black[1]
    var sameAntiDiag = (white[0] - black[0]) + (white[1] - black[1]) == 0
    return sameRank || sameFile || sameDiag || sameAntiDiag
  }
}
