# Exercice 5 - INSERT

À partir de la base de données athlète, (le script sql de génération est disponible [**ici**](../ressources/ex05_create_tables.sql)), réalisez les requêtes d'insertion suivante.

1. Insérez-vous dans la table athlète sans spécifier les noms de colonnes dans la requête.
2. Insérez un autre athlète fictif mais en spécifiant seulement son nom, prénom et la date de naissance.
3. Récupérez le id qui a été généré automatiquement lors de la requête précédente et faites afficher avec une requête **SELECT** le message suivant : "L'athlète [prenom] [nom] a été ajouté avec succès!". Utilisez le id récupéré dans la clause **WHERE** de votre requête.
4. Créez une nouvelle table appelé athlete_quebec avec les colonnes suivante ( id clé primaire auto-incrémenté, nom, prénom, ville )
   1. Insérez dans cette table tous les athlètes qui proviennent de la province du Québec à l'aide d'une requête select.

Je veux que vous me remettiez les requêtes dans un script SQL avec pour chaque requête d'insertion une requête select qui va valider que les données ont bien été ajouté.

