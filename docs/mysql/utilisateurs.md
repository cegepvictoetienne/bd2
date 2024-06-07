# Gestion des utilisateurs dans MySQL

Pour se connecter et interagir avec MySQL, chaque utilisateur doit disposer d'informations de connexion valides (nom d'utilisateur et mot de passe) ainsi que de privilèges déterminés pour accéder et manipuler la base de données. Ces informations sont stockées dans plusieurs tables système de MySQL.

## Tables de privilèges
- **user** : contient les informations de base sur les utilisateurs.
- **db**, **tables_priv**, **columns_priv**, **proc_priv** : stockent les détails des privilèges sur les bases de données, tables, colonnes et procédures.

Il est recommandé d'utiliser des commandes SQL spécifiques pour gérer ces privilèges plutôt que de modifier directement les tables.

## Création d'un utilisateur

Utilisez la commande `CREATE USER` pour créer un nouveau compte utilisateur. Vous pouvez spécifier le nom de l'utilisateur, l'hôte depuis lequel ils peuvent se connecter, et leur mot de passe. L'hôte peut être spécifié pour restreindre d'où l'utilisateur peut se connecter. Utiliser `%` permet une connexion depuis n'importe quel hôte.

```sql
CREATE USER IF NOT EXISTS 'nomUtilisateur'@'hôte' IDENTIFIED BY 'motDePasse';
```

### Exemples

```sql
CREATE USER IF NOT EXISTS 'luc'@'localhost' IDENTIFIED BY 'qwerty4ever';
CREATE USER IF NOT EXISTS 'ray' IDENTIFIED BY 'qwerty4ever';
CREATE USER IF NOT EXISTS 'patate'@'156.20.12.2' IDENTIFIED BY 'qwerty4ever';

-- Permettre à un utilisateur de se connecter depuis n'importe quel hôte commençant par 156.20.12
CREATE USER IF NOT EXISTS 'luc'@'156.20.12.%' IDENTIFIED BY 'qwerty4ever';

-- Permettre une connexion depuis n'importe quel hôte
CREATE USER IF NOT EXISTS 'luc'@'%' IDENTIFIED BY 'qwerty4ever';
```

## Modification du nom d'un utilisateur

Pour changer le nom d'un utilisateur existant, utilisez `RENAME USER` :

```sql
RENAME USER 'luc'@'localhost' TO 'lucie'@'localhost';
```

## Suppression d'un utilisateur

Utilisez `DROP USER` pour supprimer un utilisateur :

```sql
DROP USER 'luc'@'localhost';
```

## Afficher la liste des utilisateurs

MySQL ne possède pas de commande `SHOW USERS`. Pour voir la liste des utilisateurs, vous pouvez exécuter une requête `SELECT` sur la table `user` dans la base de données `mysql` :

```sql
SELECT User, Host FROM mysql.user;
```

Cette requête affiche tous les utilisateurs et les hôtes associés, permettant ainsi de visualiser qui peut accéder au serveur MySQL.