# Création de base de données

# Créer

La commande créer une base de données est __CREATE DATABASE__ suivi du nom à donner. On peut aussi ajouter le type de jeu de charactère à la base de données et la collation ou laisser les valeurs par défaut.

# Jeu de caractère

Détermine les caractères que MySQL utilise pour stocker les valeurs dans les tables. Par défaut on utilise __utf8mb4__ qui représente les caractères utilisés par la majorité des langues occidentales. Pour changer la valeur par défaut on va utiliser __CHARACTER SET__ suivi du nom du jeu de caractère.

On peut lister tous les jeu de caractères avec la requête __SHOW CHARACTER SET__;

# Collation

La collation est une série de règle qui va indiquer comment les caractères sont comparés entre eux, comme par exemple la sensibilité à la case ou la façon de trier le texte. La valeur par défaut __utf8mb4_general_ci__. Cette collation a été développé pour accélerer le traitement au prix de la précision. Je vous conseille d'utiliser la collation __utf8_unicode_520_ci__. Pour changer la valeur par défaut on va utiliser __COLLATE__ suivi du nom de la collation.

On peut lister tous les jeu de caractères avec la requête __SHOW COLLATION__;

Syntaxe du create database :

```sql
    CREATE DATABASE 'nom_de_la_bd'
    CHARACTER SET = 'utf8mb4'
    COLLATE = 'utf8_unicode_520_ci';
```

# Modifier

Pour modifier une base de données on utilise la commande __ALTER DATABASE__. On peut utiliser aussi les mêmes options qu'avec le create database.

Syntaxe du alter database :

```sql
    ALTER DATABASE 'nom_de_la_bd'
    CHARACTER SET = 'utf8mb4'
    COLLATE = 'utf8_unicode_520_ci';
``` 

# Supprimer

Nous allons utiliser la commande __DROP DATABASE__ suivi du nom de la base de données à supprimer. Si elle n'existe pas, MySQL va générer une erreur. Pour l'eviter, on peut ajouter __IF EXISTS__ avant le nom de la base de données.

```sql
    DROP DATABASE IF EXISTS 'nom_de_la_bd';
```

# Sources

- [Documentation Create table](https://dev.mysql.com/doc/refman/8.0/en/create-database.html)  
- [Jeux de caractère et collation](https://dev.mysql.com/doc/refman/8.0/en/charset-charsets.html)
- [Différence entre utf8mb4_general_ci, utf8mb4_unicode_ci et utf8_unicode_520_ci](https://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci)