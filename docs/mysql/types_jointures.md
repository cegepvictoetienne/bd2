# Jointures  

# Base de données exemples

J'ai un système de deux tables, l'une de joueurs et l'autre de guilde. Les joueurs peuvent ou non faire partie d'une guilde et chaque guilde peut avoir de 0 à plusieurs joueurs.

![Schéma de la base de données](../images/joueurs_guildes.svg)
??? note "DBML"
	```dbml
	Table guildes {
		id int [pk]
		nom varchar(30)
	}

	Table joueurs {
		id int [pk]
		guilde_id int
		nom varchar(50)
		prenom varchar(50)
	}
	Ref: joueur.guilde_id > guilde.id
	```

Voici un script de création si vous voulez réaliser les exemples

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

L'opérateur ```UNION``` est utilisé pour combiner les résultats de deux ou plusieurs requêtes ```SELECT```. On doit par contre respecter les trois règles suivantes :

- Toutes les requêtes SELECT doivent comporter le même nombre de colonnes.  
- Les colonnes correspondantes doivent avoir un type de données similaire.  
- Les colonnes doivent aussi être dans le même ordre.  

## Syntaxe

```sql
SELECT colonne1, colonne2 FROM table1
UNION
SELECT colonne1, colonne2 FROM table2;
``` 

Par défaut l'opérateur ```UNION``` conservera que les valeurs uniques des multiples requêtes. Si ont veut conserver les doublons, on doit ajouter ALL.

```sql
SELECT colonne1, colonne2 FROM table1
UNION ALL
SELECT colonne1, colonne2 FROM table2;
```

Le nom des colonnes du résultat sera le nom des colonnes définies dans la première requête.

# OUTER JOIN

Une jointure ```OUTER JOIN``` retournera tous les enregistrements des deux tables. On ne peux pas utiliser la commande ```OUTER JOIN``` en MySQL mais on peut arriver au même résultat en faisant une première requête avec un ```LEFT JOIN``` unis à une deuxième requête avec un ```RIGHT JOIN```.  

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