module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing -> "Mighty Magician"
        Just n -> n


revive : Player -> Maybe Player
revive player =
    if player.health > 0 then
        Nothing

    else
        Just { player | health = 100, mana = if player.level < 10 then Nothing else Just 100 }


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just mana ->
            if mana >= manaCost then
                ( { player | mana = Just ( mana - manaCost ) }, manaCost * 2)

            else
                ( player, 0 )

        Nothing ->
            ( { player | health = if player.health - manaCost > 0 then player.health - manaCost else 0 }, 0 )