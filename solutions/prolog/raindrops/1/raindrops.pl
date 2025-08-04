convert(N, Sounds) :-
    Pling is N mod 3,
    Plang is N mod 5,
    Plong is N mod 7,
    raindrops(Pling, Plang, Plong, N, Sounds).

raindrops(0, 0, 0, _, Sounds) :- Sounds = "PlingPlangPlong".
raindrops(0, 0, _, _, Sounds) :- Sounds = "PlingPlang".
raindrops(0, _, 0, _, Sounds) :- Sounds = "PlingPlong".
raindrops(_, 0, 0, _, Sounds) :- Sounds = "PlangPlong".
raindrops(0, _, _, _, Sounds) :- Sounds = "Pling".
raindrops(_, 0, _, _, Sounds) :- Sounds = "Plang".
raindrops(_, _, 0, _, Sounds) :- Sounds = "Plong".
raindrops(_, _, _, N, Sounds) :- number_string(N, Sounds).