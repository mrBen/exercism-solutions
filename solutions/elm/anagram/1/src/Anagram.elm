module Anagram exposing (detect)


sortWord : String -> String
sortWord word =
    word
        |> String.toList
        |> List.sort
        |> String.fromList


anagram : String -> String -> Bool
anagram word candidate =
    ( sortWord word ) == ( sortWord candidate )


detect : String -> List String -> List String
detect word candidates =
    List.filter
        ( \str -> 
            anagram ( String.toLower word ) ( String.toLower str )
            && ( String.toLower word ) /= ( String.toLower str ))
        candidates
        