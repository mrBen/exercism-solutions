public class CarsAssemble {
    private static final int BASE_RATE = 221;

    public double productionRatePerHour(int speed) {
        double totalProductionRate = speed * BASE_RATE;

        if (speed == 10) {
            return totalProductionRate * 0.77;
        } else if (speed == 9){
            return totalProductionRate * 0.8;
        } else if (speed >= 5) {
            return totalProductionRate * 0.9;
        }
        return totalProductionRate;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) (productionRatePerHour(speed) / 60);
    }
}
