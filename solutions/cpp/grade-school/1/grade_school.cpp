#include "grade_school.h"

#include <algorithm>

namespace grade_school {

std::map<int, std::vector<std::string>> school::roster() const
{
    return m_roster;
}

void school::add(std::string name, int grade)
{
    std::vector<std::string> names;
    if (m_roster.find(grade) != m_roster.end())
        names = m_roster.at(grade);
    
    names.push_back(name);
    std::sort(names.begin(), names.end());
    
    m_roster[grade] = names;
}

std::vector<std::string> school::grade(int grade) const
{
    std::vector<std::string> at_grade;
    if (m_roster.find(grade) != m_roster.end())
        at_grade = m_roster.at(grade);

    return at_grade;
}

}  // namespace grade_school
