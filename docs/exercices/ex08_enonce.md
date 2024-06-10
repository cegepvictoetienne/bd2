# Exercice 8 - Création de fonctions SQL

Après avoir importé la base de données lors de l'exercice 7, vous allez créer deux fonctions spécifiques pour traiter et analyser les données des athlètes.

## Fonction 1: Formatage de résultats

**Objectif :** Créez une fonction nommée **resultatHMS** qui convertit un temps de résultat donné en millisecondes en un format lisible (HH:MM:SS).

**Détails de la fonction :**
- **Nom de la fonction :** resultatHMS
- **Paramètre :** Un entier représentant le temps en millisecondes.
- **Retour :** Une chaîne de caractères formatée en heures, minutes et secondes (HH:MM:SS).

## Fonction 2: Calcul de la moyenne pour 5 Kilomètres

**Contexte :**
Pour tester cette fonction, vous commencerez par insérer les données d'un athlète et de ses résultats au 5 km :

```sql
-- Insertion de l'athlète John Smith avec trois résultats au 5 km
INSERT INTO athletes (nom, prenom, date_naissance, adresse, ville, province, pays, courriel)
VALUES ('Smith', 'John', '1980-01-01', '475 Rue Notre Dame E', 'Victoriaville', 'Québec', 'Canada', 'john.smith@gmail.com');

SET @id_athlete := LAST_INSERT_ID();

INSERT INTO resultats (athlete_id, epreuve_type_id, date_resultat, resultat_ms, evenement_id)
VALUES (@id_athlete, 1, '2023-07-17', 1529499, 2),
       (@id_athlete, 1, '2023-08-17', 1995742, 2),
       (@id_athlete, 1, '2023-09-17', 1480882, 2);
```

**Objectif :** Créez une fonction nommée **moyenne5k** qui calcule la moyenne des temps d'un athlète pour tous ses résultats au 5 km.

**Détails de la fonction :**
- **Nom de la fonction :** moyenne5k
- **Paramètre :** ID de l'athlète.
- **Retour :** La moyenne des résultats exprimée en heures, minutes, secondes (hh:mm:ss) sous forme de VARCHAR.

**Validation :**
Utilisez l'athlète John Smith pour tester la fonction. Le résultat attendu doit être `00:27:48`.

## Livrables

Soumettez le script SQL contenant les deux fonctions ainsi que les requêtes d'insertion pour les tests et les validations associées à la fonction moyenne5k.
