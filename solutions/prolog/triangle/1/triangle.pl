triangle(Side1, Side2, Side3, Type):-
    Side1 \= 0, Side2 \= 0, Side3 \= 0,
    triangle_inequality(Side1, Side2, Side3),
    (equilateral(Side1, Side2, Side3, Type); isosceles(Side1, Side2, Side3, Type); scalene(Side1, Side2, Side3, Type)).

triangle_inequality(A, B, C):-
    AB is A + B, AB >= C,
    BC is B + C, BC >= A,
    AC is A + C, AC >= B.

equilateral(Side1, Side2, Side3, Type):-
    Type = "equilateral",
    Side1 = Side2,
    Side1 = Side3.

isosceles(Side1, Side2, Side3, Type):-
    Type = "isosceles",
    (Side1 = Side2; Side1 = Side3; Side2 = Side3).

scalene(Side1, Side2, Side3, Type):-
    Type = "scalene",
    Side1 \= Side2,
    Side1 \= Side3,
    Side2 \= Side3.