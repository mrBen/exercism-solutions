using System;

class RemoteControlCar
{
    private int distance;
    private int battery;

    public RemoteControlCar()
    {
        distance = 0;
        battery = 100;
    }

    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return "Driven " + this.distance + " meters";
    }

    public string BatteryDisplay()
    {
        if (this.battery > 0)
            return "Battery at " + this.battery + "%";
        return "Battery empty";
    }

    public void Drive()
    {
        if (this.battery > 0)
        {
            this.distance += 20;
            this.battery -= 1;
        }
    }
}
