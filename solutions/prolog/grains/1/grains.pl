square(1, 1).
square(SquareNumber, Value):-
    between(1, 64, SquareNumber),
    PrevSquare is SquareNumber - 1,
    square(PrevSquare, Prev),
    Value is Prev * 2.

total(Value):-
    subTotal(64, Value).

subTotal(1, 1).
subTotal(SquareNumber, Value):-
    PrevSquare is SquareNumber - 1,
    subTotal(PrevSquare, Prev),
    square(SquareNumber, Square),
    Value is Prev + Square.
