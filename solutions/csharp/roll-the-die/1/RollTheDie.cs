using System;

public class Player
{
    private Random r;

    public Player()
    {
        r = new Random();
    }

    public int RollDie()
    {
        return this.r.Next(1, 18);
    }

    public double GenerateSpellStrength()
    {
        return this.r.NextDouble() * 100;
    }
}
