class NeedForSpeed {
    public final int speed;
    public final int batteryDrain;
    private int distanceDriven = 0;
    private int battery = 100;

    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }

    public boolean batteryDrained() {
        return battery < batteryDrain;
    }

    public int distanceDriven() {
        return distanceDriven;
    }

    public void drive() {
        if (batteryDrained())
            return;

        distanceDriven += speed;
        battery -= batteryDrain;
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int distance;

    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean canFinishRace(NeedForSpeed car) {
        int nbDrive = Math.ceilDiv(distance, car.speed);
        return nbDrive * car.batteryDrain <= 100;
    }
}
