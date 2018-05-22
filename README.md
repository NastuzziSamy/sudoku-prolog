#Sudoku Resolver

##Welcome to this exciting project !

* This little program, developed in prolog, can resolve any sudoku grid you give him.
* Also, it can help you increase your skills in sudoku resolving, indeed, it can generate sudoku grid and check if your solution is right !

##How to make it work

*This is in development please come back later, it will have amazing way to make this thing work on your computer !*

##Todo List

* Jouer au sudoku
	* Generation d'une grille valide
		* Representer une grille vide
		* Representer une grille X * X
		* Representer une grille completée valide
		* Generer une grille partiellement remplie
		* Algorithme de résolution de grille
			* Règles de validation
			* Verifier chaque case en fonction de sa postion
	* Entrée d'un chiffre dans une case
		* Verifier si la grille est toujour valide
		* Developper "l'interface" homme-machine
			* Demander au joueur une position
			* Demander son chiffre
			* Entrer le chiffre
			* Lui répondre
	* Generer les solutions possibles
		* Utiliser les algorithmes de résolution afin de tester chaque chiffre dans chaque case
			* Parcours en profondeur
				* Si un chiffre entre et est valide alors, case suivante
				* Si un chiffre entre et est refusé alors, chiffre suivant
				* Si X refusé et X fut testé entre [0-9] alors grille refusée
				* Si grille complète, alors grille validée
			* Sauvegarder chaque grille valide trouvée
* Visualiser les grilles
	* Visualiser une ligne
		* Visualiser une case
* Tester une grille donnée
	* Lire une grille sur un fichier texte ?
	* Entrée 'a la main' de la grille
	* Tester les règles de validation sur la grille