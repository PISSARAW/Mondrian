# Mondrian

Projet OCaml inspiré des œuvres de Piet Mondrian. Le programme génère et affiche
des compositions composées de rectangles colorés à l'aide d'un arbre BSP
(*Binary Space Partitioning*) et de la bibliothèque `Graphics` d'OCaml.

## Contenu du dépôt

- `bsp.ml` — définition du type `bsp` et des fonctions de construction et de
  manipulation de l'arbre (hauteur, ajout de nœuds, etc.).
- `affichage.ml` — chargement de la bibliothèque `Graphics` et fonctions liées
  à l'affichage.
- `new1.ml` — version de travail combinant la création de l'arbre, la
  coloration et l'ouverture d'une fenêtre graphique.
- `mondrian.ml` — fichier principal du projet.

## Prérequis

- [OCaml](https://ocaml.org/) (version 4 ou supérieure)
- La bibliothèque `graphics` (disponible via `opam install graphics`)

## Utilisation

Pour lancer le programme dans l'interpréteur OCaml :

```sh
ocaml graphics.cma new1.ml
```

Une fenêtre graphique s'ouvre alors et affiche la composition générée.
Appuyez sur une touche pour fermer la fenêtre.

## Auteurs

Projet réalisé par les étudiants de PISSARAW.
