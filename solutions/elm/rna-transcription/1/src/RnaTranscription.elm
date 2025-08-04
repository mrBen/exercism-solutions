module RnaTranscription exposing (toRNA)


toRNA : String -> Result String String
toRNA dna =
    String.map
        ( \c -> 
            if c == 'G' then 'C'
            else if c == 'C' then 'G'
            else if c == 'T' then 'A'
            else if c == 'A' then 'U'
            else 'X' )
        dna
    |> ( \str ->
            if List.member 'X' ( String.toList str ) then
                Err "Invalid input"
            else
                Ok str )