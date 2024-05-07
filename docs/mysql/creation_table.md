# Création de table MySQL

# Créer

La commande pour créer une table est ```CREATE TABLE```. On peut définir un paquet d'options à cette commande, on va s'en tenir ici aux principales. Vous avez la liste de toutes les options dans la documentation que j'ai mis en lien en bas de page.

On commence par utilisez la commande ```CREATE TABLE``` avec le nom de la table à créer. On peut ajouter ``ÌF NOT EXISTS`` avant le nom de la table pour le créer uniquement si elle ne l'est pas déjà. Ensuite entre parenthèse on va lister les colonnes avec leur nom, leur type de données et d'autres attributs qu'on voudrait leur donner. On peut aussi définir dans ses parenthèses les clé primaires, étrangères et les contraintes. Après la parenthèse on pourra ajouter des options relatives à la table, comme le moteur de bd (engine) et la collation.

Exemple de syntaxe

```sql
CREATE TABLE IF NOT EXISTS `nom_table` (
    `colonne1` INT AUTO_INCREMENT,
    `colonne2` INT,
    `colonne3` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`colonne1`),
    CONSTRAINT `colonne2_fk` FOREIGN KEY (`colonne2`) REFERENCES `table_destination` (`colonne_id`) ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=INNODB;
```

!!! warning "Attention"
	Si vous ajouter des clés étrangères dans la création de la table, vous devez vous assurez que les colonnes et les tables sont déjà créées. Vous pouvez toujours les créer après avoir fait la création de table en faisant une modification de table.

# Modifier

Pour modifier une table on utilise la commande ```ALTER TABLE```. On peut utiliser aussi les mêmes options qu'avec le create table.

Syntaxe du alter table :

```sql
ALTER TABLE `nom_table`
ADD CONSTRAINT `colonne2_fk` 
	FOREIGN KEY (`colonne2`) 
	REFERENCES table_destination (`colonne_id`) 
	ON UPDATE RESTRICT ON DELETE CASCADE;
```

# Supprimer

Nous allons utiliser la commande ```DROP TABLE``` suivi du nom de la table à supprimer. Si elle n'existe pas, MySQL va générer une erreur. Pour l'eviter, on peut ajouter ```IF EXISTS``` avant le nom de la table.

```sql
DROP TABLE IF EXISTS `nom_de_la_bd`;
```

# Source

- [Documentation Create table](https://dev.mysql.com/doc/refman/8.0/en/create-table.html)
