# Exercice 5 - Insertions de données

## Contexte
Cet exercice porte sur la manipulation et l'insertion de données dans une base de données dédiée aux athlètes. Le script SQL pour créer les tables nécessaires est disponible [**ici**](../ressources/ex05_create_tables.sql).

## Instructions

### Insertion des données
Vous allez effectuer plusieurs opérations d'insertion en utilisant différentes méthodes :

1. **Insertion simple** :
    - Insérez un athlète dans la table `athletes` sans spécifier les noms des colonnes dans la requête d'insertion.

2. **Insertion partielle** :
    - Ajoutez un athlète fictif en spécifiant uniquement son nom, prénom et date de naissance.

3. **Validation et affichage** :
    - Après l'insertion du deuxième athlète, récupérez l'ID automatiquement généré. 
    - Utilisez cet ID pour afficher le message suivant avec une requête **SELECT** : "L'athlète [prénom] [nom] a été ajouté avec succès !".

4. **Création et remplissage de table** :
    - Créez une nouvelle table nommée `athletes_quebec` avec les colonnes suivantes :
        - `id` : clé primaire auto-incrémentée
        - `nom`
        - `prénom`
        - `ville`
    - Insérez dans cette table tous les athlètes originaires du Québec à l'aide d'une requête **SELECT**.

### Validation des insertions
Pour chaque insertion, ajoutez une requête **SELECT** qui confirme que les données ont été correctement ajoutées à la base de données.

## Livrable
Vous devez soumettre vos requêtes dans un script SQL. Assurez-vous que chaque insertion soit accompagnée d'une validation via une requête **SELECT** appropriée.
