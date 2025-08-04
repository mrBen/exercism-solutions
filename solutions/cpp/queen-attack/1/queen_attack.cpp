#include "queen_attack.h"

#include <stdexcept>
#include <sstream>

namespace queen_attack {

chess_board::chess_board()
{
    m_white = std::make_pair(0, 3);
    m_black = std::make_pair(7, 3);
}

chess_board::chess_board(const std::pair<int, int> white, const std::pair<int, int> black)
    : m_white{white}, m_black{black}
{
    if (white == black)
        throw std::domain_error("Queen positions must be distinct");
}

chess_board::operator std::string() const
{
    std::stringstream board;

    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (std::make_pair(i, j) == m_white)
                board << "W";
            else if (std::make_pair(i, j) == m_black)
                board << "B";
            else
                board << "_";

            if (j < 7)
                board << " ";
            else
                board << std::endl;
        }
    }

    return board.str();
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
        || m_white.first - m_black.first == m_white.second - m_black.second  // diagonal
        || m_white.first - m_black.first + m_white.second - m_black.second == 0;  // other diagonal
}

}  // namespace queen_attack
