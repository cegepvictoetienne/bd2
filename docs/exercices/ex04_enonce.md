# Exercice 04 - Modélisation d'un livre de recettes

## Consignes

Vous devez analyser et modéliser un livre de recettes. Les deux images suivantes vous indiquent ce qui doit être inclus dans la base de données. **Toutes les informations** présentées doivent être sauvegardées.

### Précisions sur les pictogrammes dans les recettes :

- **Bol** : Temps de préparation de la recette
- **Flamme** : Temps de cuisson
- **Main** : Temps de préparation supplémentaire

### Livrables

Vous devez produire et remettre les éléments suivants :

- [ ] Le modèle entité-association en format image.
- [ ] Un diagramme de classes UML, également en format image.
- [ ] Un script SQL pour la génération de la base de données et des tables, incluant la création de la base de données, des tables, ainsi que des clés primaires et étrangères.
  - La base de données doit se nommer **ex04_recette** et utiliser la collation `utf8mb4_unicode_ci`.
  - La table contenant les recettes doit avoir une clé primaire commençant à la valeur 1000.
  - Le script doit pouvoir être exécuté plusieurs fois sans provoquer d'erreurs (utilisez les commandes **DROP ... IF EXISTS**).

Vous devez respecter les trois premières formes normales ainsi que la convention de nommage décrite dans les notes de cours.

Veuillez soumettre le tout dans un dossier compressé sur Teams.

## Images

### Recette 1

![Recette01](../images/ex04_a.jpg){.center .shadow}

### Recette 2

![Recette02](../images/ex04_b.jpg){.center .shadow}
