# Jeu-de-Morpion
Mobile App Swift 


Interface de jeu
1.        Créez un projet nommé « Morpion », et enregistrez-le sur votre bureau.

2.        Téléchargez les quatre images contenues dans cette archive, et importez-les à votre projet (attention de bien incorporer une copie des images dans les fichiers du projet).

3.        Placez deux labels et l’image de la croix dans la partie supérieure de la vue principale.

Une image contenant texte, symbole, diagramme, capture d’écran

Description générée automatiquement

Placement des éléments d’interface

 

4.        Placez la grille dans la partie inférieure de la vue, et placez un bouton au centre de la première case (en haut à gauche). Supprimez le texte du bouton et définissez son apparence avec l’image « vide.png ». Dans l’inspecteur de taille, définissez la taille du bouton à 100x100 points. Dupliquez ce bouton dans chacune des autres cases de la grille. Définissez le paramètre tag de chacun des boutons à un nombre allant de 0 à 8 en parcourant les boutons de gauche à droite et de haut en bas (sens usuel de lecture).

5.        Ajoutez des contraintes sur les éléments de la vue pour permettre au joueur d’utiliser son téléphone en mode « portrait » ou en mode « paysage ».

6.        Créez trois outlets de la manière suivante, de haut en bas, entre la vue et le contrôleur : invitation : UILabel ; message : UILabel ; pion : UIImageView.

7.        Reliez le premier bouton à une action nommée clic(). Modifiez la classe du paramètre sender à UIButton. Reliez cette même action à chacun des huit autres boutons, toujours de gauche à droite et de haut en bas. Testez votre application en affichant la valeur de sender.tag, et vérifiez qu’une valeur différente s’affiche pour chaque bouton.

8.        Reliez le premier bouton à une outletCollection nommée « boutons ». Reliez cette même outletCollection à chacun des huit autres boutons (toujours de gauche à droite et de haut en bas).

Début de la partie
9.        Déclarez une variable joueur, initialisée à 0 (le joueur dont c’est le tour de jouer), et définissez un tableau de 9 entiers nommé « tableau » initialisé avec 9 fois la valeur 2. Par convention, la valeur 2 correspondra à une case vide, alors que les valeurs 0 et 1 correspondront au code de chacun des deux joueurs. On utilisera la même convention de numérotation des éléments du tableau que les tags associés aux boutons.

10.  Définissez un tableau « noms » à deux éléments contenant le nom des deux joueurs (pour l’instant, « Toto » et « Lulu »).

11.  Définissez trois constantes nommées croix, rond et vide de type UIImage, initialisées à partir des trois fichiers définissant l’apparence des cases. On peut pour cela utiliser le constructeur UIImage(named : “nom de fichier”). Pensez à déballer la valeur optionnelle renvoyée par cette fonction, (la fonction renvoie nil si le fichier n’existe pas).

12.  Définissez un tableau « contenu » à trois éléments contenant dans cet ordre les trois UIImage croix, rond et vide (ce tableau doit être déclaré à l’extérieur de toute fonction, mais doit être initialisé dans la fonction viewDidLoad().

13.  Dans la fonction viewDidLoad (), initialisez à « » le contenu de l’outlet message. Puis appelez la fonction afficheTour().

14.  La fonction afficheTour(), doit afficher dans l’outlet « invitation » le nom du joueur qui doit jouer, et doit représenter le symbole associé à ce joueur dans l’outlet pion (pensez à utiliser les tableaux contenu et noms).

Code du clic
15.  Lors du clic sur un bouton, on récupère son « tag ». Si la case correspondante du tableau ne vaut pas 2 (vide), affichez dans l’outlet « message » l’erreur « veuillez cliquer sur une case vide !».

16.  Dans le cas contraire, mémorisez la valeur du joueur courant dans la case correspondante du tableau. Il faut ensuite modifier l’image de la case qui vient d’être cliquée (le bouton « sender »). Il faut pour cela appeler la fonction setImage(_ image : UIImage, for : état) de la classe UIButton. image est l’UIImage correspondant à la nouvelle apparence du bouton. Un bouton peut avoir plusieurs images, pour chacun de ses états (normal, cliqué, visité, …). L’état à utiliser pour la classe normal est UIControl.State.normal .

17.  La nouvelle configuration du tableau contient peut-être un alignement de trois symboles identiques. Appelez la fonction testVictoire(plateau : tableau), qui renvoie le numéro du joueur victorieux (0 ou 1) en cas de victoire, et 2 (par convention) s’il n’y a pas de position gagnante.

18.  En cas de victoire de l’un des deux joueurs, affichez le nom du vainqueur dans l’outlet message, et désactivez tous les boutons (pour empêcher un joueur de continuer à cliquer sur les cases vides après la fin de la partie).

Une image contenant texte, capture d’écran, Police, Téléphone mobile

Description générée automatiquement

Victoire détectée

 

19.  S’il n’y a pas de victoire, il faut vérifier si les 9 cases ont été cliquées. Si c’est le cas, indiquez « Partie nulle » dans l’outlet message.

20.  Si aucune des situations précédentes ne s’est produite, il faut passer au joueur suivant. Modifiez en conséquence la valeur de la variable joueur, et appelez la fonction afficheTour().

Test d’une position gagnante
Nous allons dans cette partie, écrire le code de la fonction

func testVictoire(plateau : [Int]) -> Int {

                  …

}

qui teste si une position est victorieuse.

21.  Définissez le tableau constant « lignes », qui contiendra les 8 lignes à tester : 3 horizontales, 3 verticales, et 2 diagonales. Une ligne sera elle-même composée des trois numéros de case correspondant à une ligne (par exemple, [0,1,2] pour la première ligne horizontale). ligne[0] vaut donc [0,1,2].

22.  Parcourez toutes les lignes, et vérifiez si les trois cases du plateau passé en paramètre dont les indices sont stockés dans la ligne courante ont la même valeur, et que cette valeur correspond bien à un joueur. Si c’est le cas, renvoyez ce numéro de joueur.

23.  Si toutes les lignes ont été parcourues sans qu’un joueur victorieux ait été trouvé, renvoyez la valeur 2.

Création d’un écran d’accueil
24.  Ajoutez un écran d’accueil à votre application, qui affiche la règle du jeu, et qui permet aux joueurs d’entrer leurs noms (le joueur 1 commence, et est associé au symbole croix).

25.  Définissez cet écran d’accueil comme le contrôleur de vue initial de l’application (is initial view controller), puis intégrez-le (embed in) à un contrôleur de navigation. Nommez les vues principales « Accueil », et « Jeu ».

Une image contenant texte, capture d’écran, Téléphone mobile, smartphone

Description générée automatiquement

Configuration d’un écran d’accueil

 

26.  Créez un nouveau fichier Swift nommé AccueilViewController, définissant une classe de même nom, héritant de la classe UIViewController, et mettez l’écran d’accueil sous l’identité (identity inspector) de ce nouveau contrôleur.

27.  Lors du clic sur le bouton « Jouer », transmettez à l’écran de jeu le nom des deux joueurs en programmant la fonction prepare(for : segue …) de la classe AccueilViewController. Vérifiez que le nom des joueurs s’affiche bien dans l’interface de jeu.

28.  Définissez une icône personnalisée pour votre jeu.
