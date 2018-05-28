/* Pour l'instant nos sudokus font 9 de taille */
newLine(Y) :- Y = [_, _, _, _, _, _, _, _, _].

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
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [2, 3, 4, 5, 6, 7, 8, 9, 1],
    [3, 4, 5, 6, 7, 8, 9, 1, 2],
    [4, 5, 6, 7, 8, 9, 1, 2, 3],
    [5, 6, 7, 8, 9, 1, 2, 3, 4],
    [6, 7, 8, 9, 1, 2, 3, 4, 5],
    [7, 8, 9, 1, 2, 3, 4, 5, 6],
    [8, 9, 1, 2, 3, 4, 5, 6, 7],
    [9, 1, 2, 3, 4, 5, 6, 7, 8]
].
grid2(L) :- L = [
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
randomLine([X|R]) :- random(1, 50, Xr), (Xr < 10 -> X = Xr; !), randomLine(R).
newRandomLine(Y) :- newLine(Y), randomLine(Y).

randomGrid([]).
randomGrid([Y|R]) :- newRandomLine(Y), randomGrid(R).
newRandomGrid(L) :- newLine(L), randomGrid(L).

printLine([]) :- write('|').
printLine([X|R]) :- write('|'), (var(X) -> write(' '); write(X)), printLine(R).

printGrid([[]]) :- write('|').
printGrid([Y|R]) :- printLine(Y), nl, printGrid(R).
