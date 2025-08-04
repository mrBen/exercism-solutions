using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        return new int[] { 0, 2, 5, 3, 7, 8, 4 };
    }

    public int Today()
    {
        return this.birdsPerDay[this.birdsPerDay.Length - 1];
    }

    public void IncrementTodaysCount()
    {
        this.birdsPerDay[this.birdsPerDay.Length - 1]++;
    }

    public bool HasDayWithoutBirds()
    {
        int counter = 0;
        for (int i = 0; i < this.birdsPerDay.Length; i++)
            if (this.birdsPerDay[i] <= 0)
                counter++;
        return counter > 0;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int counter = 0;
        for (int i = 0; i < numberOfDays; i++)
            counter += this.birdsPerDay[i];
        return counter;
    }

    public int BusyDays()
    {
        int counter = 0;
        for (int i = 0; i < this.birdsPerDay.Length; i++)
            if (this.birdsPerDay[i] >= 5)
                counter++;
        return counter;
    }
}
