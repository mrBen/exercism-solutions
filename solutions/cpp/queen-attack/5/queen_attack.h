#if !defined(QUEEN_ATTACK_H)
#define QUEEN_ATTACK_H

#include <string>
#include <utility>

namespace queen_attack {

class chess_board {
public:
    using coord = std::pair<int, int>;

    static constexpr int board_size = 8;

    chess_board(
        const coord white = { 0, 3 },
        const coord black = { board_size - 1, 3 }
    );

    explicit operator std::string() const;

    coord white() const;
    coord black() const;
    bool can_attack() const;

private:
    coord m_white;
    coord m_black;
};

}  // namespace queen_attack

#endif // QUEEN_ATTACK_H