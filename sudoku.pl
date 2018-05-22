grid(Grid1 ):- Grid1=[
    [1, _, 3, _, 5, _, _, _, 9],
    [_, _, 4, 5, _, _, 8, _, 1],
    [_, 4, 5, _, _, 8, _, 1, 2],
    [4, 5, _, _, 8, _, 1, 2, 3],
    [5, _, _, 8, _, 1, 2, 3, 4],
    [_, _, 8, _, 1, 2, 3, 4, 5],
    [_, 8, _, 1, 2, 3, 4, 5, 6],
    [8, _, 1, 2, 3, 4, 5, 6, 7],
    [_, 1, 2, 3, 4, 5, 6, 7, 8]
].

/* Pour l'instant nos sudokus font 9 de taille */
newGrid(L) :- L = [
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _],
                [_, _, _, _, _, _, _, _, _]
            ].

line(Ligne):- Ligne=[_,_,_].

randomGrid([[]]).
randomLine([]).
randomLine([X|R]) :- random(1, 9, X),
                    randomLine(R).

randomGrid([Y|R]) :- write(Y), randomLine(Y), randomGrid(R).

printLine([]).
printLine([X|R]) :- write('|'),
                    (var(X) -> write(' '); write(X))
                    , printLine(R).
printGrid([[]]).
printGrid([Y|R]) :- printLine(Y), write('|'), nl, printGrid(R).
