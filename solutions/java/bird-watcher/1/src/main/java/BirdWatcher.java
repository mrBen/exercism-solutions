
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        return birdsPerDay;
    }

    public int getToday() {
        return birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length - 1]++;
    }

    public boolean hasDayWithoutBirds() {
        boolean hasDayWithout = false;
        for (int birds : birdsPerDay) {
            if (birds == 0) {
                hasDayWithout = true;
            }
        }
        return hasDayWithout;
    }

    public int getCountForFirstDays(int numberOfDays) {
        if (numberOfDays >= 7) {
            numberOfDays = 7;
        }

        int count = 0;
        for (int i = 0; i < numberOfDays; i++) {
            count += birdsPerDay[i];
        }
        return count;
    }

    public int getBusyDays() {
        int nbBusyDays = 0;
        for (int birds : birdsPerDay) {
            if (birds >= 5) {
                nbBusyDays++;
            }
        }
        return nbBusyDays;
    }
}
