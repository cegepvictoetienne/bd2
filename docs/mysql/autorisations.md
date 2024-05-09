# Gestion des autorisations

Les privilèges permettent de contrôler de manière précise les actions qu'un utilisateur est autorisé à effectuer. Ils autorisent l'utilisateur à exécuter des commandes SQL spécifiques, en définissant clairement les limites de ses capacités d'accès et de manipulation des données.

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

Voici une version clarifiée et structurée du message :

- **nomDuPrivilege** : Il s'agit du nom du privilège à octroyer, tel que SELECT, INSERT ou CREATE TABLE. Il est possible d'attribuer plusieurs privilèges simultanément en les séparant par une virgule.
- **listeDesColonnes** : Ce paramètre est optionnel. Il permet de spécifier les colonnes spécifiques d'une table sur lesquelles le privilège est appliqué. Par exemple, un utilisateur pourrait se voir accorder le droit de réaliser des mises à jour (UPDATE) uniquement sur certaines colonnes.
- **niveauPrivilege** : Indique le niveau auquel le privilège s'applique. Les options incluent un niveau global, applicable à l'ensemble du système, un niveau spécifique à une base de données, ou un niveau limité à une table précise.
- **nomUsager_nomRole** : Détermine à quel utilisateur ou quel rôle le privilège est octroyé.

## Exemple

```sql
/* Attribution des droits SELECT et INSERT à l'utilisateur 'test' 
   pour toutes les tables de la base de données 'credit_social'. */

GRANT SELECT, INSERT
ON credit_social.*
TO test@localhost;

/* Attribution du droit SELECT à l'utilisateur 'test2' pour accéder uniquement 
   aux colonnes id, nom et prenom de la table 'citoyen' dans la base de données 
   'credit_social'. */

GRANT SELECT (id, nom, prenom)
ON credit_social.citoyen
TO test2@localhost;
```

```sql
/* Après avoir ajouté ou supprimé des privilèges, il est crucial de rafraîchir la liste des privilèges. Pour ce faire, utilisez la commande suivante : */

FLUSH PRIVILEGES;
```

# Liste des privilèges

Voici une courte liste des privilèges que l'on peut attribuer à un utilisateur :

- **ALL** : Octroie tous les privilèges, à l'exception de celui de les accorder à d'autres utilisateurs.
- **USAGE** : N'accorde aucun privilège spécifique, équivalent à des droits minimaux.
- **GRANT OPTION** : Permet à l'utilisateur d'octroyer des privilèges à d'autres ; ce privilège n'est pas inclus dans le privilège ALL.
- **SELECT, INSERT, UPDATE, DELETE** : Permettent respectivement de lire, insérer, modifier et supprimer des données, conformément aux opérations CRUD.
- **CREATE TABLE, ALTER, DROP, REFERENCES** : Offrent la possibilité de créer des tables, de les modifier, de les supprimer et de gérer les contraintes de référence.
- **CREATE ROUTINE, ALTER ROUTINE, EXECUTE** : Permettent de créer, modifier et exécuter des procédures stockées, des fonctions et des déclencheurs.

Pour une liste plus exhaustive des privilèges disponibles, il est recommandé de consulter la documentation officielle de MySQL.

[https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html) 


# Niveau des privilèges

Le niveau des privilèges spécifie l'étendue de l'accès accordé et se divise en deux parties : la base de données et la table ou la procédure stockée concernée.

- `*.*` : Accorde des privilèges sur toutes les bases de données et toutes les tables ou procédures stockées.
- `credit_social.*` : Applique les privilèges à toutes les tables de la base de données `credit_social`.
- `credit_social.classe` : Restreint les privilèges à la table `classe` uniquement, au sein de la base de données `credit_social`.


# Afficher les autorisations d'un utilisateur ou d'un rôle

```sql
SHOW GRANTS FOR 'usager_role'@'localhost';
```

