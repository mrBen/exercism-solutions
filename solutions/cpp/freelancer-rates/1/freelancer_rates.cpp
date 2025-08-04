#include <cmath>

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
    return hourly_rate * 8;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    double rebate{before_discount * (discount/100)};
    return before_discount - rebate;
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    double monthly_rate{daily_rate(hourly_rate) * 22};
    return (int)std::ceil(apply_discount(monthly_rate, discount));
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    double daily_cost{apply_discount(daily_rate(hourly_rate), discount)};
    return (int)std::floor(budget / daily_cost);
}