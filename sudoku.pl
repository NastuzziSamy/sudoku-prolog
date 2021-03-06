/* Nos sudokus font 9 de taille */
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
    [6, 7, 8, 9, 1, 2, 3, _, 5],
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
    [_, 8, _, 1, _, 3, _, 5, 6],
    [_, _, 4, 5, _, _, 8, _, 1],
    [5, _, _, 8, _, 1, _, _, 4],
    [8, _, 1, 2, _, _, 5, _, 7],
    [_, 4, 5, _, _, 8, _, _, 2],
    [_, _, 8, _, 1, 2, _, _, 5],
    [_, 1, 2, 3, _, 5, _, 7, 8]
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

/* La seconde valeur > 10 et < 20 (complexité) du random permet de ne pas populer toute la grille */
tryToAffectValue(X, L) :- random(1, 20, Xr), (Xr < 10 -> X is Xr, isGridOk(L); true).

randomLine([], _).
randomLine([X|R], L) :- (tryToAffectValue(X, L) -> randomLine(R, L); randomLine([X|R], L)).
newRandomLine(Y, L) :- newLine(Y), randomLine(Y, L).

randomGrid([], _).
randomGrid([Y|R], L) :- newRandomLine(Y, L), randomGrid(R, L).
newRandomGrid(L) :- newLine(L), randomGrid(L, L).

/* La seconde valeur > 10 et < 20 (complexité) du random permet de ne pas populer toute la grille */
affectValue(X, L) :- random(1, 10, Xr), X is Xr, isGridOk(L).

goodRandomLine([], _, _).
goodRandomLine([_|_], _, 0).
goodRandomLine([X|R], L, C) :- (affectValue(X, L) -> Cr is C-1, goodRandomLine(R, L, Cr); goodRandomLine([X|R], L, C)).
newGoodRandomLine(Y, L, C) :- newLine(Y), goodRandomLine(Y, L, C).

goodRandomGrid([], _, _).
goodRandomGrid([_|_], _, -1). /*17-9 = 8, 8-9 = -1, a la deuxieme il faut s'arreter d'ou la condition d'arret, c'est crado mais j'ai pas trouve mieux*/
goodRandomGrid([Y|R], L, C) :- newGoodRandomLine(Y, L, C), Cr is C-9, goodRandomGrid(R, L, Cr).
newGoodRandomGrid(L) :- newLine(L), goodRandomGrid(L, L, 17). /*C est le nombre de chiffre que l'on place au hasard dans la grille, 17 etant le minimum pour avoir une solution unique*/

printLine([]) :- write('|').
printLine([X|R]) :- write('|'), (var(X) -> write(' '); write(X)), printLine(R).

printGrid([]).
printGrid([Y|R]) :- printLine(Y), nl, printGrid(R).

isInLine(X, [Y|T]) :- X = Y; isInLine(X, T).
isLineOk(L)  :- setof(X, isInLine(X, L), S), length(L, N), length(S, N).

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

    /*printGrid(L),*/

    /* Vérification par ligne */
    isLineOk([A1, B1, C1, D1, E1, F1, G1, H1, I1]),
    isLineOk([A2, B2, C2, D2, E2, F2, G2, H2, I2]),
    isLineOk([A3, B3, C3, D3, E3, F3, G3, H3, I3]),
    isLineOk([A4, B4, C4, D4, E4, F4, G4, H4, I4]),
    isLineOk([A5, B5, C5, D5, E5, F5, G5, H5, I5]),
    isLineOk([A6, B6, C6, D6, E6, F6, G6, H6, I6]),
    isLineOk([A7, B7, C7, D7, E7, F7, G7, H7, I7]),
    isLineOk([A8, B8, C8, D8, E8, F8, G8, H8, I8]),
    isLineOk([A9, B9, C9, D9, E9, F9, G9, H9, I9]),

    /* Vérification par colonne */
    isLineOk([A1, A2, A3, A4, A5, A6, A7, A8, A9]),
    isLineOk([B1, B2, B3, B4, B5, B6, B7, B8, B9]),
    isLineOk([C1, C2, C3, C4, C5, C6, C7, C8, C9]),
    isLineOk([D1, D2, D3, D4, D5, D6, D7, D8, D9]),
    isLineOk([E1, E2, E3, E4, E5, E6, E7, E8, E9]),
    isLineOk([F1, F2, F3, F4, F5, F6, F7, F8, F9]),
    isLineOk([G1, G2, G3, G4, G5, G6, G7, G8, G9]),
    isLineOk([H1, H2, H3, H4, H5, H6, H7, H8, H9]),
    isLineOk([I1, I2, I3, I4, I5, I6, I7, I8, I9]),

    /* Vérification par bloc */
    isLineOk([A1, A2, A3, B1, B2, B3, C1, C2, C3]),
    isLineOk([D1, D2, D3, E1, E2, E3, F1, F2, F3]),
    isLineOk([G1, G2, G3, H1, H2, H3, I1, I2, I3]),
    isLineOk([A4, A5, A6, B4, B5, B6, C4, C5, C6]),
    isLineOk([D4, D5, D6, E4, E5, E6, F4, F5, F6]),
    isLineOk([G4, G5, G6, H4, H5, H6, I4, I5, I6]),
    isLineOk([A7, A8, A9, B7, B8, B9, C7, C8, C9]),
    isLineOk([D7, D8, D9, E7, E8, E9, F7, F8, F9]),
    isLineOk([G7, G8, G9, H7, H8, H9, I7, I8, I9]).

tryToSolveWithValue(1, L) :- isGridOk(L).
tryToSolveWithValue(2, L) :- isGridOk(L).
tryToSolveWithValue(3, L) :- isGridOk(L).
tryToSolveWithValue(4, L) :- isGridOk(L).
tryToSolveWithValue(5, L) :- isGridOk(L).
tryToSolveWithValue(6, L) :- isGridOk(L).
tryToSolveWithValue(7, L) :- isGridOk(L).
tryToSolveWithValue(8, L) :- isGridOk(L).
tryToSolveWithValue(9, L) :- isGridOk(L).
tryToSolveWithValue(X, L, Y) :- (nonvar(X) -> false; X is Y, isGridOk(L)).

tryToSolveValue(X, L) :- (nonvar(X) -> true; tryToSolveWithValue(X, L)).

solveLine([], _).
solveLine([X|R], L) :- tryToSolveValue(X, L), solveLine(R, L).

solveGrid([], _).
solveGrid([Y|R], L) :- isGridOk(L), solveLine(Y, L), solveGrid(R, L).
solveGrid(L) :- (isGridOk(L) -> printGrid(L), (solveGrid(L, L) -> nl, write('Solution:'), nl, printGrid(L); write('Grille insolvable'), false); write('Grille invalide'), false).


/*User interaction*/

read_number(N, X, Y) :-
    write('Donnez d\'abord un chiffre, une position X et Y'),
    nl,
    write('Chiffre: '),
    nl,
    read(N),
    write('Position X: '),
    nl,
    read(Y),
    write('Position Y: '),/*les colonnes et les lignes sont inversees en info et flemme de refaire le code*/
    nl,
    read(X).

playSudoku(L) :-
    generatePlayableGrid(L, A),
    play(A, L).

isWon(A, L):-
    verifWin(A, L).

play(A, L):- /*A est pour actuel, L la grille resolue*/
    (isWon(A, L) ->
        write('Bravo, c est gagné ! '), true
        ;
        printGrid(A),
        nextTurn(A, L)). /*J ai pas reussi a faire de backtacking*/


nextTurn(A, L):-
    nl,
    read_number(N, X, Y),
    nl,
    newGrid(B),
    copyGrid(B, A),
    (insert_Grid(N, X, Y, B, B) -> insert_Grid(N, X, Y, A, A); write('Insertion non valide'), nl),
    play(A, L).

verifWin([], []).
verifWin([X|R], [T|Q]):-
    verifWinLine(X, T),
    verifWin(R, Q).

verifWinLine([], []).
verifWinLine([X|R], [T|Q]):-
    (X == T -> verifWinLine(R, Q); false, true).


insert_Grid(_, 0, _, [_|_], _).
insert_Grid(_, _, _, [], _).
insert_Grid(N, X, Y, [T|Q], A) :-
    (X > 1 -> Xr is X-1, insert_Grid(N, Xr, Y, Q, A); insert_Line(N, Y, T, A)).

insert_Line(_, 0, [_|_], _).
insert_Line(_, _, [], _).
insert_Line(N, Y, [T|Q], A):-
    (Y > 1 -> Yr is Y-1, insert_Line(N, Yr, Q, A); tryToSolveWithValue(T, A, N)).

generateSolvedGrid(L) :-
    newGoodRandomGrid(L),
    printGrid(L),
    solveGrid(L),
    nl, nl, nl, nl, nl, nl, nl, nl.

generatePlayableGrid(L, A) :-
    generateSolvedGrid(L),
    readDifficulty(J),
    generateHolesInGrid(L, A, J). /*A est la grille trouee, L etant la grille solutionnee*/

readDifficulty(J) :-
    write('Entre 1 - Facile et 50 - Très difficile'), nl,
    write('Choisissez votre difficulte: '),
    read(J).

generateHolesInGrid(L, A, J) :-
    newGrid(A),
    putHoles(L, A, J).

putHoles([], [], _).
putHoles([X|R], [Y|S], J) :-
    putHolesInLine(X, Y, J),
    putHoles(R, S, J).

putHolesInLine([], [], _).
putHolesInLine([X|R], [Y|S], J) :-
    tryToCopyValue(X, Y, J),
    putHolesInLine(R, S, J).

tryToCopyValue(X, Y, J) :-
    R is J + 1,
    random(1, R, Xr),
    (Xr < 2 -> Y is X; true).

copyGrid([], []).
copyGrid([X|R], [T|Q]):-
    copyGridLine(X, T),
    copyGrid(R, Q).

copyGridLine([], []).
copyGridLine([X|R], [T|Q]):-
    (nonvar(T) -> X is T, copyGridLine(R, Q); copyGridLine(R, Q)).
