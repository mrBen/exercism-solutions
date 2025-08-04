defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car) when remote_car.__struct__ == RemoteControlCar do
      "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when remote_car.__struct__ == RemoteControlCar do
    case remote_car.battery_percentage do
      0 -> "Battery empty"
      value -> "Battery at #{value}%"
    end
  end

  def drive(remote_car) when remote_car.__struct__ == RemoteControlCar do
    if remote_car.battery_percentage > 0 do
      distance = remote_car.distance_driven_in_meters + 20
      battery = remote_car.battery_percentage - 1
      %{remote_car | battery_percentage: battery, distance_driven_in_meters: distance}
    else
      remote_car
    end
  end
end
