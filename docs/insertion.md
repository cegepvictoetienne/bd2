# Insertion de données 

La commande ```INSERT``` est utilisée pour ajouter des enregistrements dans une table.

# Syntaxe de base

## La méthode la plus simple

```sql
INSERT INTO ma_table
VALUES (valeur1, valeur2, valeur3);
```

### Avantages 
- Requête plus courte 
- Si on modifie les noms de colonnes, pas besoin de modifier la requête.

### Inconvénients

- Possibilité d'erreurs plus grande, il faut que les valeurs concordent avec le nombre de colonnes et leur position.

## La méthode la plus précise

```sql
INSERT INTO ma_table (colonne1, colonne2, colonne3)
VALUES (valeur1, valeur2, valeur3);
```  

### Avantages 
- Plus de précisions dans la requête 
- On n'est pas forcé de suivre l'ordre des colonnes ni d'ajouter une valeur pour chacune d'entre elles.

### Inconvénient 
- Les requêtes sont plus longues à écrire.
- Au niveau de la maintenance, si on modifie un nom de colonne, il faut modifier toutes les requêtes ajoutant des valeurs dans cette colonne.

## Insérer des données seulement dans certaines colonnes

```sql
INSERT INTO ma_table (colonne1)
VALUES (valeur1);
```

Les autres champs non spécifiés prendront la valeur par défaut si elle est défini ou NULL sinon.

## Insérer plusieurs lignes dans la même requête

La syntaxe est la même, on doit seulement séparer les séries de valeurs par une virgule :

```sql
INSERT INTO ma_table
VALUES  (valeur_a1, valeur_a2, valeur_a3),
        (valeur_b1, valeur_b2, valeur_b3),
        (valeur_c1, valeur_c2, valeur_c3),
        (valeur_d1, valeur_d2, valeur_d3);
```

```sql
INSERT INTO ma_table (colonne1, colonne2, colonne3)
VALUES  (valeur_a1, valeur_a2, valeur_a3),
        (valeur_b1, valeur_b2, valeur_b3),
        (valeur_c1, valeur_c2, valeur_c3),
        (valeur_d1, valeur_d2, valeur_d3);
```

## Insérer des valeurs provenant d'une autre table

On peut insérer les valeurs d'autres tables en utilisant une sous-requête de sélection au lieu de spécifier les valeurs dans la section VALUES.

```sql
INSERT INTO ma_table (colonne1, colonne2, colonne3)
    SELECT valeur1, valeur2, valeur3
    FROM table_source;
``` 

La requête SELECT n'a pas de contraintes et peut contenir plusieurs jointures, des conditions WHERE et HAVING, d'autres sous-requête, etc.

Si on veut insérer tout le contenu d'une table dans une autre, on peut utiliser l'instruction TABLE et le nom de la table d'où proviennent les données à insérer.

```sql
INSERT INTO ma_table TABLE table_source
``` 

## Les colonnes de type auto-incrément

Ce type de colonne est incrémentée automatiquement lors d'une insertion de données, on ne doit pas les ajouter dans nos requêtes d'insertion.

## Récupérer la valeur d'une colonne auto-incrément

On peut récupérer la première valeur provenant d'un champ auto-incrément qui a été insérer avec succès en utilisant la fonction ```last_insert_id()```.

```sql
INSERT INTO ma_table (colonne1) 
VALUES (valeur1);
``` 

```sql
SELECT last_insert_id();
```
