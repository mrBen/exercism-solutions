module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

remainingTimeInMinutes numberOfLayers minutesSinceStarted =
    let
        expectedMinutesInOven = 40
        preparationTimeInMinutes = numberOfLayers * 2
    in
        preparationTimeInMinutes + expectedMinutesInOven - minutesSinceStarted