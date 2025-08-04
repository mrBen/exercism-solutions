#include "high_scores.h"

#include <algorithm>
#include <iterator>

namespace arcade {

    std::vector<int> HighScores::list_scores() {
        return scores;
    }

    int HighScores::latest_score() {
        return scores.back();
    }

    int HighScores::personal_best() {
        return *std::max_element(scores.begin(), scores.end());
    }

    std::vector<int> HighScores::top_three() {
        std::vector<int> sorted(scores.size());
        std::copy(scores.begin(), scores.end(), sorted.begin());
        std::sort(sorted.begin(), sorted.end());
        std::reverse(sorted.begin(), sorted.end());
        std::vector<int> high(scores.size() > 3 ? 3 : scores.size());
        std::copy_n(sorted.begin(), scores.size() > 3 ? 3 : scores.size(), high.begin());
        return high;
    }

}  // namespace arcade
