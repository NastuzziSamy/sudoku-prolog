/* Pour l'instant nos sudokus font 9 de taille */
newLine(X) :- X = [_, _, _, _, _, _, _, _, _].

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

grid1(L) :- L = [
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

randomLine([]).
randomLine([X|R]) :- random(1, 9, X),
                    randomLine(R).
newRandomLine(X) :- newLine(X), randomLine(X).

randomGrid([]).
randomGrid([Y|R]) :- newRandomLine(Y), randomGrid(R).
newRandomGrid(L) :- newLine(L), randomGrid(L).

printLine([]) :- write('|').
printLine([X|R]) :- write('|'),
                    (var(X) -> write(' '); write(X))
                    , printLine(R).
printGrid([[]]) :- write('|').
printGrid([Y|R]) :- printLine(Y), nl, printGrid(R).
