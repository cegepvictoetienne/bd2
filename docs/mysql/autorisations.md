# Gestion des autorisations

Avec les privilèges on peut définir précisément ce qu'un usager peut faire ou non. On donne la permission à l'usager d'exécuter tel ou tel commande SQL.

# Ajouter ou enlever des privilèges

```sql
-- Syntaxe pour ajouter un privilège
GRANT nomDuPrivilege (listeDesColonnes)
ON niveauPrivilege
TO nomUsager_nomRole

-- Syntaxe pour enlever un privilège
REVOKE nomDuPrivilege
ON niveauPrivilege
FROM nomUsager_nomRole
```

- nomDuPrivilege : Le nom du privilège à ajouter (SELECT, INSERT, CREATE TABLE, etc.). On peut en mettre plusieurs en les séparant par une virgule.
- listeDesColonnes : C'est optionnel mais on peut spécifier les colonnes sur lesquelles le privilège est appliqué. On pourrait par exemple accorder le droit à un usager de faire un UPDATE mais seulement pour des colonnes spécifiques d'une table.
- niveauPrivilege : À quel niveau s'applique le privilège. (Globalement, seulement pour une base de données en particulier, pour une table précise, etc.)
- nomUsager_nomRole: À quel usager ou role on veut octroyer le privilège.

## Exemple

```sql
/* Octroyer à l'usager test le droit de faire des requêtes select et insert sur 
   toutes les tables de la base de données credit_social
 */
GRANT SELECT, INSERT
ON credit_social.*
TO test@localhost;

/* Octroyer à l'usager test2 le droit de faire des requêtes select uniquement sur 
   la table citoyen de la base de données credit_social. De plus, seulement les 
   colonnes id, nom et prenom seront accessible pour cette table
 */
GRANT SELECT (id, nom, prenom)
ON credit_social.citoyen
TO test2@localhost;
```

Après l'ajout ou la suppression de privilèges, il est important de rafraichir la liste des privilèges avec la commande :

```sql
FLUSH PRIVILEGES;
```

# Liste des privilèges

Voici une courte liste de privilèges qu'on peut ajouter à un usager :

- ALL, tous les privilèges, sauf celui d'en accorder.
- USAGE, aucun privilèges
- GRANT OPTION, accorde le droit d'ajouter des privilèges (il n'est pas inclus quand on utilise ALL)
- SELECT, INSERT, UPDATE, DELETE, pour les requêtes CRUD correspondante
- CREATE TABLE, ALTER, DROP, REFERENCES pour des opérations sur les tables et la base de données.
- CREATE ROUTINE, ALTER ROUTINE, EXECUTE, pour des opérations sur les procédures stockées, fonctions et déclencheurs.

Il y a beaucoup d'autres privilèges qu'on peut octroyer, vous pouvez consulter une liste plus complète dans la documentation de MySQL :

[https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html) 


# Niveau des privilèges

L'indicateur du niveau de privilèges se compose en deux sections, la ou les base de données et ensuite le nom de la table ou de la procédure stockée.

- *.* : Toutes les bases de données et toutes les tables/procédures stockées
- credit_social.* : Pour la base de données credit_social, toutes les tables
- credit_social.classe : Pour la base de données credit_social, la table classe uniquement.

# Afficher les autorisations d'un utilisateur ou d'un rôle

```sql
SHOW GRANTS FOR 'usager_role'@'localhost';
```

