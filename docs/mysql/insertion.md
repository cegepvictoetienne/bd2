# Insertion de données 

La commande `INSERT` permet d'ajouter des enregistrements à une table dans une base de données.

## Syntaxe de base

### Méthode simple

```sql
INSERT INTO ma_table
VALUES (valeur1, valeur2, valeur3);
```

#### Avantages
- Requête concise.
- Aucune modification nécessaire si les noms de colonnes changent.

#### Inconvénients
- Risque accru d'erreurs si les valeurs ne correspondent pas exactement en nombre et en position aux colonnes de la table.

### Méthode précise

```sql
INSERT INTO ma_table (colonne1, colonne2, colonne3)
VALUES (valeur1, valeur2, valeur3);
```

#### Avantages
- Plus grande précision dans la spécification des colonnes.
- Possibilité d'insérer des valeurs sans respecter l'ordre des colonnes ni inclure toutes les colonnes.

#### Inconvénient
- Requêtes plus longues à écrire.
- Nécessite une mise à jour de la requête si le nom d'une colonne est modifié.

### Insérer des données seulement dans certaines colonnes

```sql
INSERT INTO ma_table (colonne1)
VALUES (valeur1);
```

Les champs non spécifiés recevront leur valeur par défaut, ou NULL si aucune valeur par défaut n'est définie.

### Insérer plusieurs lignes simultanément

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

### Insérer des valeurs provenant d'une autre table

```sql
INSERT INTO ma_table (colonne1, colonne2, colonne3)
    SELECT valeur1, valeur2, valeur3
    FROM table_source;
```

Cette méthode permet l'insertion de données issues de requêtes complexes, y compris avec des jointures et des conditions.

### Insérer tout le contenu d'une autre table

```sql
INSERT INTO ma_table TABLE table_source
```

### Gestion des colonnes auto-incrément

Les colonnes de type auto-incrément ne doivent pas être incluses dans les requêtes d'insertion, car elles sont automatiquement remplies.

### Récupérer la valeur d'une colonne auto-incrément

Après une insertion, récupérez la première valeur auto-incrémentée insérée avec succès :

```sql
SELECT last_insert_id();
```