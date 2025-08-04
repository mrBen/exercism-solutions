#include <string>

namespace log_line {
    std::string message(std::string log_line) {
        auto split_at{log_line.find(": ")};
        return log_line.substr(split_at + 2);
    }

    std::string log_level(std::string log_line) {
        auto split_at{log_line.find("]")};
        return log_line.substr(1, split_at - 1);
    }

    std::string reformat(std::string log_line) {
        return message(log_line) + " (" + log_level(log_line) + ")";
    }
} // namespace log_line
