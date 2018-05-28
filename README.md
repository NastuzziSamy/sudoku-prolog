# Sudoku Resolver

## Welcome to this exciting project !

* This little program, developed in prolog, can resolve any sudoku grid you give him.
* Also, it can help you increase your skills in sudoku resolving, indeed, it can generate sudoku grid and check if your solution is right !

## How to make it work

*This is in development please come back later, it will have amazing way to make this thing work on your computer !*

__Il est impératif de lancer le programme grâce à SWI-Prolog (pour avoir les librairies nécessaires `swipl`__

## Todo List

 1. Jouer au sudoku
	1. Generation d'une grille valide
		1. Representer une grille vide
		2. Representer une grille X * X
		3. Representer une grille completée valide
		4. Generer une grille partiellement remplie
		5. Algorithme de résolution de grille
			1. Règles de validation
			2. Verifier chaque case en fonction de sa postion
	2. Entrée d'un chiffre dans une case
		1. Verifier si la grille est toujour valide
		2. Developper "l'interface" homme-machine
			1. Demander au joueur une position
			2. Demander son chiffre
			3. Entrer le chiffre
			4. Lui répondre
	3. Generer les solutions possibles
		1. Utiliser les algorithmes de résolution afin de tester chaque chiffre dans chaque case
			1. Parcours en profondeur
				1. Si un chiffre entre et est valide alors, case suivante
				2. Si un chiffre entre et est refusé alors, chiffre suivant
				3. Si X refusé et X fut testé entre [0-9] alors grille refusée
				4. Si grille complète, alors grille validée
			2. Sauvegarder chaque grille valide trouvée

2. Visualiser les grilles
	1. Visualiser une ligne
		2. Visualiser une case

3. Tester une grille donnée
	1. Lire une grille sur un fichier texte ?
	2. Entrée 'a la main' de la grille
	3. Tester les règles de validation sur la grille
