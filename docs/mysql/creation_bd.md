# Création de bases de données

Pour créer une base de données, utilisez la commande `CREATE DATABASE` suivie du nom souhaité pour la base. Il est également possible d'ajuster le jeu de caractères et la collation lors de la création, ou de laisser ces paramètres à leurs valeurs par défaut.

## Syntaxe de base
```sql
CREATE DATABASE nom_de_la_base;
```

## Avec spécification de jeu de caractères et de collation
```sql
CREATE DATABASE nom_de_la_base 
  CHARACTER SET nom_du_jeu_de_caractères 
  COLLATE nom_de_la_collation;
```

# Jeu de caractères

Le jeu de caractères détermine comment MySQL stocke les valeurs textuelles dans les tables. Par défaut, `utf8mb4` est utilisé, couvrant la majorité des caractères des langues occidentales.

## Changer le jeu de caractères par défaut
```sql
CREATE DATABASE nom_de_la_base 
  CHARACTER SET nom_du_jeu_de_caractères;
```

## Lister les jeux de caractères disponibles
```sql
SHOW CHARACTER SET;
```

# Collation

La collation définit les règles de comparaison entre caractères, incluant la sensibilité à la casse et l'ordre de tri. La collation par défaut est `utf8mb4_general_ci`, optimisée pour la vitesse mais moins précise. Pour des comparaisons plus précises, `utf8mb4_unicode_ci` est recommandée.

## Changer la collation par défaut
```sql
CREATE DATABASE nom_de_la_base 
  COLLATE nom_de_la_collation;
```

## Lister les collations disponibles
```sql
SHOW COLLATION;
```

Syntaxe avec les valeurs recommandées pour le jeu de caractères et la collation :

```sql
CREATE DATABASE 'nom_de_la_bd'
  CHARACTER SET = 'utf8mb4'
  COLLATE = 'utf8mb4_unicode_ci';
```

# Modification de bases de données

Pour modifier les propriétés d'une base de données existante, comme le jeu de caractères ou la collation, utilisez la commande `ALTER DATABASE`. Cette commande permet d'appliquer les mêmes options de jeu de caractères et de collation que celles utilisées avec `CREATE DATABASE`.

## Syntaxe de modification
```sql
ALTER DATABASE nom_de_la_bd
CHARACTER SET = 'utf8mb4'
COLLATE = 'utf8mb4_unicode_ci';
```

# Suppression de bases de données

Pour supprimer une base de données, la commande `DROP DATABASE` est utilisée. Si la base de données spécifiée n'existe pas, cette commande générera une erreur. Pour éviter cela, vous pouvez préfixer le nom de la base de données avec `IF EXISTS`, ce qui permet de ne supprimer la base que si elle existe déjà.

## Syntaxe de suppression
```sql
DROP DATABASE IF EXISTS nom_de_la_bd;
```

# Sources

- [Documentation Create table](https://dev.mysql.com/doc/refman/8.0/en/create-database.html)  
- [Jeux de caractère et collation](https://dev.mysql.com/doc/refman/8.0/en/charset-charsets.html)
- [Différence entre utf8mb4_general_ci et utf8mb4_unicode_ci](https://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci)