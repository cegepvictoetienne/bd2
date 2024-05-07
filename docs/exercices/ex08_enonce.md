# Exercice 8 - Fonctions

Dans la base de données que vous avec importée à l'exercice 7 créez les deux fonctions suivantes : 

## Formater un résutlat

Créez une fonction nommée **resultatHMS** qui prendra en paramètre un résultat en millisecondes et qui le retournera en texte sous le format heures minutes et secondes (HH:MM:SS).

## Fonction de calcul de moyenne au 5 kilomètres

Ajoutez les informations suivantes : 

```sql
-- Insertion de l'athlète John Smith avec trois résultats au 5 km
INSERT INTO athlete (nom, prenom, date_naissance, adresse, ville, province, pays, courriel)
VALUES ('Smith', 'John', '1980-01-01', '475 Rue Notre Dame E', 'Victoriaville', 'Québec', 'Canada', 'john.smith@gmail.com');

SET @id_athlete := LAST_INSERT_ID();

INSERT INTO resultat (athlete_id , epreuve_type_id, date_resultat, resultat_ms, evenement_id)
VALUES (@id_athlete, 1, '2023-07-17', 1529499, 2),
	   (@id_athlete, 1, '2023-08-17', 1995742, 2),
	   (@id_athlete, 1, '2023-09-17', 1480882, 2);
```

Créez une fonction nommée **moyenne5k** qui va prendre en paramètre le id d'un athlète et qui va retourner la moyenne de ses résultats pour toutes ses résultats au 5 km. La valeur de sortie doit être la moyenne des résultats exprimées en heures, minutes, secondes (hh:mm:ss) et de type VARCHAR(). 

Utilisez l'athlète John Smith qu'on vient d'ajouter pour tester la fonction, le résultat devrait être `00:27:48`.