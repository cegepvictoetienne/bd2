# Exercice 5 - Insertions

À partir de la base de données athlète (le script SQL de génération est disponible [**ici**](../ressources/ex05_create_tables.sql)), réalisez les requêtes d'insertion suivantes :

1. Insérez un athlète dans la table `athletes` sans spécifier les noms de colonnes dans la requête.
2. Insérez un autre athlète fictif en spécifiant seulement son nom, prénom et date de naissance.
3. Récupérez l'ID généré automatiquement lors de la requête précédente et affichez le message suivant avec une requête **SELECT** : "L'athlète [prénom] [nom] a été ajouté avec succès !". Utilisez l'ID récupéré dans la clause **WHERE** de votre requête.
4. Créez une nouvelle table appelée `athletes_quebec` avec les colonnes suivantes : 
   - `id` (clé primaire auto-incrémentée)
   - `nom`
   - `prénom`
   - `ville`
   
   Ensuite, insérez dans cette table tous les athlètes qui proviennent de la province du Québec à l'aide d'une requête **SELECT**.

Je souhaite que vous me remettiez les requêtes dans un script SQL, avec pour chaque requête d'insertion une requête **SELECT** qui valide que les données ont bien été ajoutées.