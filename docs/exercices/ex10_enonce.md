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

## Soumission

Déposez vos scripts SQL sur la plateforme Teams dans l'espace dédié au devoir.
