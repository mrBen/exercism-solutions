class Lasagna
{
    public int ExpectedMinutesInOven()
    {
        return 40;
    }

    public int RemainingMinutesInOven(int minutesIn)
    {
        return ExpectedMinutesInOven() - minutesIn;
    }

    public int PreparationTimeInMinutes(int nbLayers)
    {
        return nbLayers * 2;
    }

    public int ElapsedTimeInMinutes(int nbLayers, int minutesIn)
    {
        return PreparationTimeInMinutes(nbLayers) + minutesIn;
    }
}
