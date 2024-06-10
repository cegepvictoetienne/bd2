# Exercice 10 - Maîtrise des curseurs

Cet exercice vise à vous familiariser avec la création et l'utilisation de curseurs dans la gestion des bases de données.

## Installation

Commencez par télécharger et exécuter le script SQL pour préparer votre environnement : [ex10_create_tables](../ressources/ex10_create_tables.sql).

## Question 1: Listing des pays producteurs

### Objectif
Créez une procédure stockée utilisant un curseur pour lister tous les pays producteurs de houblon présents dans la table `houblons`.

### Spécifications
- **Résultat attendu :** Une chaîne de caractères avec les noms des pays séparés par un point-virgule, sans doublons et classés en ordre alphabétique.
- **Variable de sortie :** Utilisez une variable **OUT** pour récupérer et afficher le résultat.

### Résultat Exemple
```sql
"Allemagne;Australie;États-Unis;France;Japon;Nouvelle-Zélande;Pologne;République-Tchèque;Royaume-Uni;Russie;Slovénie"
```

### Script
Nommez votre script SQL **NomPrenom_ex10_1.sql**, incluant la création de la procédure et un test pour vérifier son fonctionnement.

## Question 2: Gestion des Similitudes de Houblons

### Objectif
Gérer et extraire les informations sur les houblons similaires pour proposer des associations pertinentes.

### Diagramme UML
Respectez le diagramme UML fourni pour créer les nouvelles tables nécessaires.

![ex10_01](../images/ex10_01.svg)

### Procédure stockée
- **Utilisation d'un curseur :** La procédure doit implémenter un curseur pour traiter chaque ligne de la table `houblons`.
- **Transaction :** Assurez-vous que la transaction soit complète uniquement si aucun problème n'est survenu durant le traitement.
- **Gestion des erreurs :** En cas de **SQLEXCEPTION**, les modifications doivent être annulées et un message d'erreur affiché.
- **Tables à manipuler :** Les tables `similitudes` et `similitude_logs` doivent être vidées avant de procéder à l'insertion.
- **Logique de traitement :** Pour chaque valeur de la colonne `similitude`, vérifiez l'existence du houblon correspondant et ajoutez l'association ou loguez l'exception comme spécifié.

### Test
Testez la procédure en lançant une requête pour le houblon "Admiral" et vérifiez que les résultats incluent "Target" et "Challenger" dans la table de similitude.

### Script
Nommez votre script SQL **NomPrenom_ex10_2.sql** et assurez-vous qu'il contienne tous les éléments nécessaires à la réponse.

## Soumission

Déposez vos scripts SQL sur la plateforme Teams dans l'espace dédié au devoir.
