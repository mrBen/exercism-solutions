#if !defined(QUEEN_ATTACK_H)
#define QUEEN_ATTACK_H

#include <string>
#include <utility>

namespace queen_attack {

class chess_board {
public:
    chess_board();
    chess_board(const std::pair<int, int> white, const std::pair<int, int> black);

    operator std::string() const;

    std::pair<int, int> white() const;
    std::pair<int, int> black() const;
    bool can_attack() const;

private:
    std::pair<int, int> m_white;
    std::pair<int, int> m_black;
};

}  // namespace queen_attack

#endif // QUEEN_ATTACK_H