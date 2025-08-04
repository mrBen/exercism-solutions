module TisburyTreasureHunt exposing (..)

type alias TreasureLocation = (Int, Char)
type alias PlaceLocation = (Char, Int)


placeLocationToTreasureLocation : ( Char, Int ) -> ( Int, Char )
placeLocationToTreasureLocation placeLocation =
    ( Tuple.second placeLocation, Tuple.first placeLocation )


treasureLocationMatchesPlaceLocation : ( Char, Int ) -> ( Int, Char ) -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    placeLocationToTreasureLocation placeLocation == treasureLocation


countPlaceTreasures : ( String, ( Char, Int ) ) -> List ( String, ( Int, Char ) ) -> Int
countPlaceTreasures place treasures =
    List.length (
        List.filter
            ( \treasure -> treasureLocationMatchesPlaceLocation ( Tuple.second place ) ( Tuple.second treasure ) )
            treasures
    )


specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case ( foundTreasure, place ) of
        ( "Brass Spyglass", "Abandoned Lighthouse" ) ->
            True

        ( "Amethyst Octopus", "Stormy Breakwater" ) ->
            desiredTreasure == "Crystal Crab" || desiredTreasure == "Glass Starfish"

        ( "Vintage Pirate Hat", "Harbor Managers Office" ) ->
            desiredTreasure == "Model Ship in Large Bottle" || desiredTreasure == "Antique Glass Fishnet Float"

        _ ->
            foundTreasure == desiredTreasure
