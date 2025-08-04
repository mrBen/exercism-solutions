#include "queen_attack.h"

#include <stdexcept>

namespace queen_attack {

chess_board::chess_board(const coord white, const coord black)
    : m_white{white}, m_black{black}
{
    if (white == black)
        throw std::domain_error("Queen positions must be distinct");
}

chess_board::operator std::string() const
{
    std::string board {
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
        "_ _ _ _ _ _ _ _\n"
    };
    
    board[m_white.first * board_size * 2 + m_white.second * 2] = 'W';
    board[m_black.first * board_size * 2 + m_black.second * 2] = 'B';

    return board;
}

std::pair<int, int> chess_board::white() const
{
    return m_white;
}

std::pair<int, int> chess_board::black() const
{
    return m_black;
}

bool chess_board::can_attack() const
{
    return m_white.first == m_black.first  // same row
        || m_white.second == m_black.second  // same column
        || std::abs(m_white.first - m_black.first)
            == std::abs(m_white.second - m_black.second);  // diagonals
}

}  // namespace queen_attack
