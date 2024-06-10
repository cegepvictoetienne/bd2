# Exercice 04 - Modélisation d'un Livre de Recettes

## Objectifs

Votre tâche est d'analyser et de modéliser la structure d'un livre de recettes à partir des informations fournies. Vous devez assurer que toutes les données présentées dans les images ci-dessous sont intégrées de manière exhaustive dans votre base de données.

## Détails des Pictogrammes des Recettes

Les recettes comportent des pictogrammes dont les significations sont les suivantes :

- **Bol** : Indique le temps de préparation de la recette.
- **Flamme** : Désigne le temps de cuisson.
- **Main** : Représente le temps supplémentaire nécessaire pour la préparation.

## Livrables Requis

Vous êtes chargé de créer et de soumettre les documents suivants :

1. **Modèle Entité-Association** :
    - Ce schéma doit être fourni en format image.

2. **Diagramme de classes UML** :
    - Ce diagramme doit également être présenté en format image.

3. **Script SQL de création de la base de données** :
    - Le script doit inclure la création de la base de données nommée **ex04_recette**, des tables nécessaires, et des clés primaires et étrangères.
    - La base de données doit utiliser la collation `utf8mb4_unicode_ci`.
    - La table principale des recettes devra avoir une clé primaire dont la numérotation commence à 1000.
    - Assurez-vous que le script SQL puisse être exécuté de manière idempotente, c'est-à-dire plusieurs fois sans erreurs, en utilisant les commandes `DROP TABLE IF EXISTS` appropriées.

Les modèles et le script doivent respecter les trois premières formes normales et suivre les conventions de nommage spécifiées dans vos notes de cours.

## Soumission

Veuillez compiler tous les fichiers dans un dossier compressé et le soumettre via la plateforme Teams.

## Ressources Visuelles

### Recette 1

![Recette01](../images/ex04_a.jpg){.center .shadow}

### Recette 2

![Recette02](../images/ex04_b.jpg){.center .shadow}

Ces images illustrent les informations spécifiques qui doivent être sauvegardées dans votre modèle de base de données. Assurez-vous de les examiner attentivement pour intégrer tous les éléments nécessaires.
