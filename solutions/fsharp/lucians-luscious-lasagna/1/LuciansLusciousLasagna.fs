module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven timeInOven = expectedMinutesInOven - timeInOven

let preparationTimeInMinutes numberOfLayers = 2 * numberOfLayers

let elapsedTimeInMinutes numberOfLayers timeInOven =
    let preparationTime = preparationTimeInMinutes numberOfLayers
    preparationTime + timeInOven
