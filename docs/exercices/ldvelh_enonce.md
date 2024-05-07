# Livre dont vous êtes le héro

## Description de l'exercice
L'objectif du projet est de créer une application qui permettra de lire et de naviguer dans un livre dont vous êtes le héros.

- Vous devez faire l'analyse du cas et me produire un diagramme de classes UML de cette analyse. 
- Ensuite créez la base de données en lien avec votre analyse. Je vais vous fournir le texte d'un livre divisé en chapitres pour l'inclure dans la base de données ainsi que les liens entre les chapitres sous deux scripts SQL. Libre à vous de modifier ou non ces fichiers. 
- Finalement vous allez développer une application fonctionnelle en python avec une interface graphique. 

L'exercice sera évalué et comptera pour 15% de la note finale. L'exercice se fera individuellement. 

## Remise de l'exercice
Créez un dépôt Github de l'exercice à l'intérieur duquel vous allez avoir les éléments suivants : 

- Dans un répertoire nommé ressources, votre diagramme de classes ainsi que les scripts SQL nécessaires à la création de votre base de données et à l'insertion des données une fois <u>l'application fonctionnel</u>.
- Le code de votre application.
- La remise du projet se fera durant le cours du 27 novembre 2023 durant lequel vous allez me présenter votre application.

## Analyse du cas
Les points suivants du livre  doivent être couverts par votre analyse :

- Le texte du livre divisé entre chapitres ainsi que le principe de navigation entre les chapitres. (Pour chaque chapitre il n'y a qu'un choix restreint de chapitres auxquels on peut accéder)
- Pour l'instant on n'aura qu'un livre dans l'application, mais on pourrait en avoir plusieurs. On va prendre pour acquis que tout les livres auraient la même fiche de personnage.
- La fiche du personnage (feuille d'aventure à la page 5 et le haut de la page 6). Pour les sections **disciplines Kai** et **Armes**, les valeurs qu'on peut y entrer doivent provenir d'une liste de choix, celle-ci est décrite plus loin dans le livre. (À partir de la page 9 pour les disciplines et 11 pour les armes)
- On ne couvrira pas le système de règles, ça sera à l'usager de le faire manuellement. (Combat, perte d'endurance, etc...)
- Vous pouvez traiter les cellules objets, repas, objets spéciaux et bourse comme des champs texte.
- On doit pouvoir enregistrer notre progression dans le livre et faire plusieurs parties en même temps.

Votre analyse doit respecter les règles de la troisième forme normale, à moins de cas d'exception qui devront être justifiés.

## Diagramme de classes

- Le diagramme de classes doit respecter votre analyse. 
- Les normes de nomenclature défini dans les notes de cours doivent être suivi.

## Base de données

Il n'y a pas de minimum ou maximum quand aux nombre de tables à avoir, mais vous devez inclure les éléments suivants : 

- Un usager avec des droits restreint qui sera utilisé par l'application. Pour les droits, allez-y au minimum, seulement les tables et commandes nécessaires au fonctionnement de l'application. 
- Vous devez au minimum inclure 2 procédures stockées, fonctions ou triggers (Une fonction et un trigger, une procédure stockée et une fonction, deux triggers, etc...).

## Application

L'application doit être programmé avec pyqt5 et comporter les fonctionnalités suivantes : 

- Lire un livre et naviguer entre ses chapitres selon leur numéro.
- Permettre à l'usager de modifier sa fiche de personnage.
- Sauvegarde notre progression de lecture, (numéro de chapitre, feuille d'aventure)
- Supprimer une sauvegarde.

## Ressources
- [Loup solitaire T.1](../ressources/Loup-solitaire-01-les-maitres-des-tenebres.pdf){target=_blank} : Le livre de référence
- [insert_chapitre.sql](../ressources/ldvelh_insert_chapitre.sql){target=_blank} : Les textes de chaque chapitre
- [insert_lien_chapitre.sql](../ressources/ldvelh_insert_lien_chapitre.sql){target=_blank} : Les liens du chapitre vers les autres



## Grille de correction

| Critères                                                     | Réussi | Satisfaisant | insatisfaisant | Points |
| :----------------------------------------------------------- | ------ | ------------ | -------------- | ------ |
| Les scripts SQL de création de tables et d'insertion de données sont fonctionnels et couvrent l'ensemble de l'application. | 2      | 1            | 0              | /2     |
| Le diagramme de classes respecte les points à couvrir de l'analyse de cas et les normes de nomenclature définies dans les notes de cours. | 3      | 1            | 0              | /3     |
| Un usager avec des droits restreints est utilisé pour la connexion entre l'application et la base de données. Sa création est incluse dans les scripts SQL remis. | 2      | 1            | 0              | /2     |
| La base de données comportent 2 procédures stockées, fonctions ou triggers. | 2      | 1            | 0              | /2     |
| L'application permet de lire un livre et de naviguer entre les chapitres par leur numéro. | 2      | 1            | 0              | /2     |
| L'application permet à l'usager de modifier manuellement la feuille de personnage du livre. | 3      | 1            | 0              | /3     |
| L'application permet de sauvegarder la progression de lecture (le chapitre en cours) et la feuille de personnage. | 4      | 2            | 0              | /4     |
| L'application permet de supprimer une sauvegarde             | 2      | 1            | 0              | /2     |
| Total                                                        |        |              |                | /20    |

