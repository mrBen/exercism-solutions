module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumber
        |> String.toList
        |> List.map ( \c -> if Char.isDigit c then String.fromChar c else "" )
        |> String.concat
        |> ( \str ->
                if String.length str == 11 then
                    if String.startsWith "1" str then
                        if ( String.slice 1 2 str ) < "2" then
                            Nothing
                        else if ( String.slice 4 5 str ) < "2" then
                            Nothing
                        else
                            Just ( String.dropLeft 1 str )
                    else
                        Nothing
                else if String.length str == 10 then
                    if ( String.slice 0 1 str ) < "2" then
                        Nothing
                    else if ( String.slice 3 4 str ) < "2" then
                        Nothing
                    else
                        Just str
                else
                    Nothing )