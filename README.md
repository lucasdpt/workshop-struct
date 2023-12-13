# Workshop Structure

Aujourd'hui nous allons nous intéresser aux structures en C.

Afin de faciliter la mise en place de workshop, vous trouverez dans ce repository une structure de projet déjà mise en place. Vous n'avez plus qu'à coder !

Fonctions autorisées: **write, malloc, free, printf**

Pour la validation de chaque exercice, vous ne devez pas avoir de memory leak. \
Pour le vérifier, essayez valgrind.

## Ex 0: Votre première structure

Pour commencer, créez une structure nommée `player_s`.
Celle-ci doit contenir:
- Un `char *name` -> représente le nom de notre joueur
- Un `int health` -> représente les points de vie de notre joueur
- Un `int armor` -> représente les points d'armure

Placez cette structure dans un fichier nommé `player.h`

Rajoutez un typedef à votre structure `player_s` afin de pouvoir directement l'appeler via `player_t`

### Initialisation de la structure

Créez une fonction `player_t *init_player(char *name);` \
Cette fonction doit créer la structure et initialiser ses valeurs. Pour cet exercice, `health = 20` et `armor = 0`.

Pour tester le bon fonctionnement de votre fonction afficher: `{name}: I currently have {health} life points & {armor} armor`. \
Libre à vous de choisir quelle fonction utiliser pour afficher ce résultat.

### Supprimer la structure

Chaque malloc doit être free. Il faut donc créer une fonction pour s'occuper de ça !
Créez une fonction `void free_player(player_t *player);` \
Cette fonction doit s'occuper de free l'ensemble des élements pouvant être free dans une structure.

*En effet, il est possible que la structure ne soit pas le seul élement à free, avez-vous penser au name ?*

## Ex 1: Manipulation de votre structure

Reprenez la structure de l'exercice précedent.

### Ajouter une armure

Créez une fonction `void add_armor_to_player(player_t *player, int armor);` \
Cette fonction doit ajouter de l'armure au joueur. L'armure ajoutée correspond au paramètre `armor` de la fonction.

Reprenez le test du premier exercice en vérifiant que l'armure a bien été changée.

### Et si le joueur prend des dégats ?

Maintenant qu'il est possible d'ajouter de l'armure au joueur, nous avons lui faire prendre des dégâts. \
Créez une fonction `void damage_to_player(player_t *player, int damage);`

Cette fonction doit d'abord fait baisser le bouclier avant de s'attaquer à la vie du joueur. \
Chaque fois que la fonction est appelée, affichez `{name}: I currently have {health} life points & {armor} armor`.

## Ex 2: Une structure dans une structure ?

Nous allons créer une nouvelle structure `item_t` qui doit contenir:
- Un `int id`

Ajoutez à la structure `player_t` un élement: \
`item_t *hand` -> représente l'item dans la main du joueur.

Il va donc falloir initialiser ce nouvel élement lors de l'initialisation de la structure `player_t`. Par défaut, cet élement est égal à `NULL`.

### Créer un item

Reproduisez les étapes de création / destruction de structure pour notre nouvelle structure.

*Attention, la fonction d'initialisation ne doit pas prendre un `char *` mais un `int` représentant l'id*

### Ajouter un item

Nous allons maintenant essayer de changer l'item dans la main du joueur. \
Pour cela, créez une fonction `void change_hand_item_player(player_t *player, item_t *item);`

Pour tester votre fonction, affichez `{name}: Current item in my hand {item->id}`. \
Si le joueur n'a pas d'item en main, affichez `{name}: No item`

### Retirer un item

Créez une fonction `void remove_item_in_hand_player(player_t *player);`. \
Cette fonction doit supprimer l'item dans la main du joueur.

*Que faut-il mettre si le joueur n'a pas d'item en main ?* \
*Que doit afficher le test de la fonction d'avant après cette fonction ?*