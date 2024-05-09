# Création de tables

Pour créer une table dans une base de données, utilisez la commande `CREATE TABLE`. Cette commande permet de définir plusieurs options, mais nous allons nous concentrer ici sur les principales. Vous pouvez trouver la liste complète des options dans la documentation fournie en lien à la fin de ce document.

## Syntaxe de base
```sql
CREATE TABLE IF NOT EXISTS nom_de_la_table (
    nom_colonne1 type_de_donnée1 attributs1,
    nom_colonne2 type_de_donnée2 attributs2,
    ...
    PRIMARY KEY (nom_colonne1),
    FOREIGN KEY (nom_colonne2) REFERENCES autre_table(nom_colonne),
    CONSTRAINT contrainte_nom UNIQUE (nom_colonne3)
)
ENGINE = type_de_moteur,
COLLATE = type_de_collation;
```

### Explications :
- **IF NOT EXISTS** : Ajoutez cette option avant le nom de la table pour éviter de créer une table qui existe déjà.
- Entre parenthèses, listez chaque colonne avec son nom, son type de données et d'autres attributs optionnels que vous souhaitez appliquer (comme les tailles de champ, les valeurs par défaut, etc.).
- Définissez également les clés primaires, les clés étrangères et d'autres contraintes nécessaires pour la gestion des relations et l'intégrité des données.
- Après les parenthèses, spécifiez des options supplémentaires comme le moteur de base de données (`ENGINE`) et la collation de la table (`COLLATE`), selon les besoins de votre système de gestion de base de données.

!!! warning "Attention"
	Lorsque vous incluez des clés étrangères dans la définition d'une table, assurez-vous que les colonnes et les tables référencées existent déjà dans la base de données. Si ce n'est pas le cas, vous pouvez toujours les créer ultérieurement. Après avoir établi la table initiale, il est possible de modifier celle-ci pour ajouter des clés étrangères. Pour ce faire, utilisez la commande `ALTER TABLE` pour intégrer les contraintes nécessaires.


# Modification de tables

Pour apporter des modifications à une table existante, utilisez la commande `ALTER TABLE`. Cette commande permet d'appliquer des changements similaires à ceux que vous pouvez réaliser lors de la création d'une table avec `CREATE TABLE`.

## Syntaxe de base
```sql
ALTER TABLE nom_de_la_table
    ADD COLUMN nouvelle_colonne type_de_donnée;
ALTER TABLE nom_de_la_table
    DROP COLUMN nom_de_la_colonne;
ALTER TABLE nom_de_la_table
    MODIFY COLUMN nom_de_la_colonne nouveau_type_de_donnée;
ALTER TABLE nom_de_la_table
    ADD CONSTRAINT nom_de_la_contrainte UNIQUE (nom_de_la_colonne);
ALTER TABLE nom_de_la_table
    DROP CONSTRAINT nom_de_la_contrainte;
```

### Options communes :
- **ADD COLUMN** : Ajoute une nouvelle colonne à la table.
- **DROP COLUMN** : Supprime une colonne existante de la table.
- **MODIFY COLUMN** : Modifie le type de données ou d'autres propriétés d'une colonne existante.
- **ADD CONSTRAINT** : Ajoute une contrainte, comme une clé primaire, une clé étrangère ou une contrainte unique.
- **DROP CONSTRAINT** : Supprime une contrainte existante.

Cette commande offre une grande flexibilité pour gérer la structure des tables après leur création initiale, vous permettant de répondre aux besoins évolutifs de votre base de données.

# Suppression de tables

Pour supprimer une table de votre base de données, utilisez la commande `DROP TABLE` suivie du nom de la table que vous souhaitez supprimer. Si la table spécifiée n'existe pas, cette commande générera une erreur. Pour éviter cela, vous pouvez utiliser l'option `IF EXISTS` qui permet de supprimer la table seulement si elle existe déjà, évitant ainsi les erreurs potentielles.

## Syntaxe de suppression de table
```sql
DROP TABLE IF EXISTS nom_de_la_table;
```

Cette option garantit que la commande ne provoquera pas d'erreur si la table n'existe pas, rendant votre script SQL plus robuste et moins susceptible de s'arrêter inopinément.

# Source

- [Documentation Create table](https://dev.mysql.com/doc/refman/8.0/en/create-table.html)
