module RnaTranscription exposing (toRNA)


toRNA : String -> Result String String
toRNA dna =
    dna 
    |> String.map ( \c -> case c of
            'G' -> 'C'
            'C' -> 'G'
            'T' -> 'A'
            'A' -> 'U'
            _ -> 'X' )
    |> ( \str ->
            if List.member 'X' ( String.toList str ) then
                Err "Invalid input"
            else
                Ok str )