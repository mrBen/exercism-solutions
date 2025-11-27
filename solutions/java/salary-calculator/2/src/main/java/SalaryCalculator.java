public class SalaryCalculator {
    private static final double PENALTY = 0.15;
    private static final double BASE_SALARY = 1000.00;
    private static final double CAP = 2000.00;

    public double salaryMultiplier(int daysSkipped) {
        return 1 - (daysSkipped >= 5 ? PENALTY : 0);
    }

    public int bonusMultiplier(int productsSold) {
        return productsSold < 20 ? 10 : 13;
    }

    public double bonusForProductsSold(int productsSold) {
        return (double) productsSold * bonusMultiplier(productsSold);
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        double finalSalary = BASE_SALARY * salaryMultiplier(daysSkipped) + bonusForProductsSold(productsSold);
        return finalSalary < CAP ? finalSalary : CAP;
    }
}
