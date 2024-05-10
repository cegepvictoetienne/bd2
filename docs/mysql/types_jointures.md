# Jointures  

# Base de données exemples

Le système comprend deux tables : une table "joueurs" et une table "guildes". Les joueurs ont la possibilité d'appartenir ou non à une guilde, tandis que chaque guilde peut avoir de zéro à plusieurs joueurs.  

![Schéma de la base de données](../images/joueurs_guildes.svg)

Voici un script de création pour réaliser les exemples suivants :  

```sql 
CREATE DATABASE IF NOT EXISTS bd2_exemple  
COLLATE = 'utf8_unicode_520_ci';  


USE bd2_exemple;  

DROP TABLE IF EXISTS guilde;
CREATE TABLE guildes (
	id INT AUTO_INCREMENT,
	nom VARCHAR(30),
	PRIMARY KEY (id)
);


INSERT INTO guildes (nom) 
VALUES ('SqlIsGod'), 
	('Error404'), 
	('IsNobodyHere');

DROP TABLE IF EXISTS joueurs;
CREATE TABLE joueurs (
	id INT AUTO_INCREMENT,
	guilde_id INT NULL,
	nom VARCHAR(50),
	prenom VARCHAR(50),
	PRIMARY KEY (id),
	CONSTRAINT guilde_fk FOREIGN KEY (guilde_id) 
		REFERENCES guilde (id) 
		ON UPDATE RESTRICT ON DELETE CASCADE
);

INSERT INTO joueurs (guilde_id, nom, prenom) 
VALUES (1, 'Fréchette', 'Mathieu'), 
	(1, 'Ouellet', 'Alexandre'), 
	(2, 'Tousignant', 'Simon'),
	(null, 'Rivard', 'Etienne');
```

# Contenu des deux tables  

## Table guildes

| id  | nom           |
|-----|---------------|
| 1   | SqlIsGod      |
| 2   | Error404      |
| 3   | IsNobodyHere  |

## Table joueurs

| id  | guilde_id | nom        | prenom   |
|-----|-----------|------------|----------|
| 1   | 1         | Fréchette  | Mathieu  |
| 2   | 1         | Ouellet    | Alexandre|
| 3   | 2         | Tousignant | Simon    |
| 4   | NULL      | Rivard     | Etienne  |

# INNER JOIN

Une jointure ```INNER JOIN``` retournera tous les enregistrements correspondants entre deux tables.

## Exemple

```sql
SELECT j.nom, j.prenom, g.nom AS guilde
FROM joueurs j 
    INNER JOIN guildes g ON g.id = j.guilde_id;
```

## Résultats

| nom        | prenom     | guilde     |
|------------|------------|------------|
| Fréchette  | Mathieu    | SqlIsGod   |
| Ouellet    | Alexandre  | SqlIsGod   |
| Tousignant | Simon      | Error404   |

# LEFT JOIN

Une jointure ```LEFT JOIN``` retournera tous les enregistrements de la table de gauche et seulement les enregistrements correspondant de la table de droite.

## Exemple

```sql
SELECT j.nom, j.prenom, g.nom AS guilde
FROM joueurs j 
    LEFT JOIN guildes g ON g.id = j.guilde_id;
```

## Résultats

| nom        | prenom     | guilde     |
|------------|------------|------------|
| Fréchette  | Mathieu    | SqlIsGod   |
| Ouellet    | Alexandre  | SqlIsGod   |
| Tousignant | Simon      | Error404   |
| Rivard      | Etienne   | NULL       |

# RIGHT JOIN

Une jointure ```RIGHT JOIN``` retournera tous les enregistrements de la table de droite et seulement les enregistrements correspondant de la table de gauche.

## Exemple

```sql
SELECT j.nom, j.prenom, g.nom AS guilde
FROM joueurs j 
    RIGHT JOIN guildes g ON g.id = j.guilde_id;
```

## Résultats

| nom        | prenom     | guilde     |
|------------|------------|------------|
| Fréchette  | Mathieu    | SqlIsGod   |
| Ouellet    | Alexandre  | SqlIsGod   |
| Tousignant | Simon      | Error404   |
| NULL       | NULL       | IsNobodyHere |

	
# UNION

L'opérateur `UNION` sert à combiner les résultats de deux ou plusieurs requêtes `SELECT`. Toutefois, il est essentiel de respecter les trois règles suivantes pour son utilisation :

- Chaque requête `SELECT` doit comporter le même nombre de colonnes.
- Les colonnes correspondantes dans les différentes requêtes doivent avoir des types de données similaires.
- L'ordre des colonnes doit être identique dans toutes les requêtes. 

## Syntaxe

```sql
SELECT colonne1, colonne2 FROM table1
UNION
SELECT colonne3, colonne4 FROM table2;
``` 

Par défaut, l'opérateur `UNION` ne conserve que les valeurs uniques des résultats obtenus à partir de multiples requêtes. Pour inclure les doublons dans les résultats, il est nécessaire d'ajouter le mot-clé `ALL`.

```sql
SELECT colonne1, colonne2 FROM table1
UNION ALL
SELECT colonne3, colonne4 FROM table2;
```

Le nom des colonnes dans le résultat de l'opérateur `UNION` correspondra aux noms des colonnes spécifiés dans la première requête.

# OUTER JOIN

Une jointure de type `OUTER JOIN` retourne tous les enregistrements de deux tables. Bien que la commande `OUTER JOIN` ne soit pas directement utilisable en MySQL, il est possible d'obtenir un résultat équivalent en combinant un `LEFT JOIN` et un `RIGHT JOIN`. Pour ce faire, réalisez d'abord une requête avec un `LEFT JOIN`, puis unissez-la à une seconde requête utilisant un `RIGHT JOIN`. 

## Exemple

```sql
SELECT j.nom, j.prenom, g.nom AS guilde
FROM joueurs j 
    LEFT JOIN guildes g ON g.id = j.guilde_id

UNION

SELECT j.nom, j.prenom, g.nom AS guilde
FROM joueurs j 
    RIGHT JOIN guildes g ON g.id = j.guilde_id;
``` 

## Résultats

| nom        | prenom     | guilde     |
|------------|------------|------------|
| Fréchette  | Mathieu    | SqlIsGod   |
| Ouellet    | Alexandre  | SqlIsGod   |
| Tousignant | Simon      | Error404   |
| Rivard      | Etienne   | NULL       |
| NULL       | NULL       | IsNobodyHere |