module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


clean1 : String -> String
clean1 str =
    String.map
        ( \c -> if c == ' ' then '_' else c )
        str


clean2 : String -> String
clean2 str =
    clean1 str
        |> String.toList
        |> List.map ( \c -> if List.member c [ '\n', '\t', '\r' ] then "[CTRL]" else String.fromChar c )
        |> String.concat


clean3 : String -> String
clean3 str =
    clean2 str
        |> String.split "-"
        |> ( \l ->
            case l of
                [] ->
                    []

                [ element ] ->
                    [ element ]

                x :: xs ->
                    x
                    :: List.map
                        ( \s -> 
                            case String.uncons s of
                                Just tuple ->
                                    let
                                        head = Tuple.first tuple |> String.fromChar |> String.toUpper
                                        tail = Tuple.second tuple
                                    in
                                        head ++ tail
                                Nothing ->
                                    "" )
                        xs )
        |> String.concat


clean4 : String -> String
clean4 str =
    clean3 str
        |> String.toList
        |> List.map ( \c -> if Char.isDigit c then "" else String.fromChar c )
        |> String.concat


clean : String -> String
clean str =
    clean4 str
        |> String.toList
        |> List.map ( \c -> if c >= 'α' && c <= 'ω' then "" else String.fromChar c )
        |> String.concat
