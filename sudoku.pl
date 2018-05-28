use_module(library(lists)).

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
    [4, 5, 6, 7, 8, 9, 1, 2, 3],
    [7, 8, 9, 1, 2, 3, 4, 5, 6],
    [2, 3, 4, 5, 6, 7, 8, 9, 1],
    [5, 6, 7, 8, 9, 1, 2, 3, 4],
    [8, 9, 1, 2, 3, 4, 5, 6, 7],
    [3, 4, 5, 6, 7, 8, 9, 1, 2],
    [6, 7, 8, 9, 1, 2, 3, 4, 5],
    [9, 1, 2, 3, 4, 5, 6, 7, 8]
].
grid2(L) :- L = [
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
grid3(L) :- L = [
    [1, _, 3, _, 5, _, _, _, 9],
    [4, 5, _, _, 8, _, 1, 2, 3],
    [_, 8, _, 1, 2, 3, 4, 5, 6],
    [_, _, 4, 5, _, _, 8, _, 1],
    [5, _, _, 8, _, 1, 2, 3, 4],
    [8, _, 1, 2, 3, 4, 5, 6, 7],
    [_, 4, 5, _, _, 8, _, 1, 2],
    [_, _, 8, _, 1, 2, 3, 4, 5],
    [_, 1, 2, 3, 4, 5, 6, 7, 8]
].
grid4(L) :- L = [
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

printGrid([]).
printGrid([Y|R]) :- printLine(Y), nl, printGrid(R).

isLineOk(L) :- is_set(L).

isGridOk(L) :- L = [
        [A1, B1, C1, D1, E1, F1, G1, H1, I1],
        [A2, B2, C2, D2, E2, F2, G2, H2, I2],
        [A3, B3, C3, D3, E3, F3, G3, H3, I3],
        [A4, B4, C4, D4, E4, F4, G4, H4, I4],
        [A5, B5, C5, D5, E5, F5, G5, H5, I5],
        [A6, B6, C6, D6, E6, F6, G6, H6, I6],
        [A7, B7, C7, D7, E7, F7, G7, H7, I7],
        [A8, B8, C8, D8, E8, F8, G8, H8, I8],
        [A9, B9, C9, D9, E9, F9, G9, H9, I9]
    ],

    /* Vérification par ligne */
    is_set([A1, B1, C1, D1, E1, F1, G1, H1, I1]),
    is_set([A2, B2, C2, D2, E2, F2, G2, H2, I2]),
    is_set([A3, B3, C3, D3, E3, F3, G3, H3, I3]),
    is_set([A4, B4, C4, D4, E4, F4, G4, H4, I4]),
    is_set([A5, B5, C5, D5, E5, F5, G5, H5, I5]),
    is_set([A6, B6, C6, D6, E6, F6, G6, H6, I6]),
    is_set([A7, B7, C7, D7, E7, F7, G7, H7, I7]),
    is_set([A8, B8, C8, D8, E8, F8, G8, H8, I8]),
    is_set([A9, B9, C9, D9, E9, F9, G9, H9, I9]),

    /* Vérification par colonne */
    is_set([A1, A2, A3, A4, A5, A6, A7, A8, A9]),
    is_set([B1, B2, B3, B4, B5, B6, B7, B8, B9]),
    is_set([C1, C2, C3, C4, C5, C6, C7, C8, C9]),
    is_set([D1, D2, D3, D4, D5, D6, D7, D8, D9]),
    is_set([E1, E2, E3, E4, E5, E6, E7, E8, E9]),
    is_set([F1, F2, F3, F4, F5, F6, F7, F8, F9]),
    is_set([G1, G2, G3, G4, G5, G6, G7, G8, G9]),
    is_set([H1, H2, H3, H4, H5, H6, H7, H8, H9]),
    is_set([I1, I2, I3, I4, I5, I6, I7, I8, I9]),

    /* Vérification par bloc */
    is_set([A1, A2, A3, B1, B2, B3, C1, C2, C3]),
    is_set([D1, D2, D3, E1, E2, E3, F1, F2, F3]),
    is_set([G1, G2, G3, H1, H2, H3, I1, I2, I3]),
    is_set([A4, A5, A6, B4, B5, B6, C4, C5, C6]),
    is_set([D4, D5, D6, E4, E5, E6, F4, F5, F6]),
    is_set([G4, G5, G6, H4, H5, H6, I4, I5, I6]),
    is_set([A7, A8, A9, B7, B8, B9, C7, C8, C9]),
    is_set([D7, D8, D9, E7, E8, E9, F7, F8, F9]),
    is_set([G7, G8, G9, H7, H8, H9, I7, I8, I9]).
