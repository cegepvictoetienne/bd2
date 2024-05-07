# Gestion des utilisateurs

Pour se connecter à MySQL on doit avoir en main un utilisateur et un mot de passe. Chaque utilisateur à ses propres privilèges sur ce qui peut faire ou ne pas faire dans la base de données. Les informations sur les utilisateurs et leur privilèges sont stockés dans les tables suivantes de la base de données mysql :

- __user__ : les informations sur les utilisateurs.
- __db__, __tables_priv__, __columns_priv__ et __proc_priv__ : les privilèges de l'utilisateur.

On peut modifier les valeurs de ces tables mais il est préférable de ne pas le faire directement dans ces tables, il y a des commandes appropriées qu'on va voir.

# Créer un utilisateur

On utilise la commande CREATE USER en spécifiant un nom d'utilisateur, un hôte et un mot de passe. L'hôte est optionnel et représente l'adresse à partir de laquelle l'utilisateur va se connecter. On utilise souvent localhost ou 127.0.0.1, ce qui veut dire que l'utilisateur pourra se connecter à partir de la machine où est situé le serveur. Si on ne spécifie pas d'hôte, l'utilisateur pourra se connecter depuis n'importe quel hôte.

```sql
CREATE USER IF NOT EXISTS 'nomUtilisateur'@'hote' IDENTIFIED BY 'motDePasse';

-- Exemple
CREATE USER IF NOT EXISTS 'math'@'localhost' IDENTIFIED BY 'qwerty4ever';
CREATE USER IF NOT EXISTS 'math2' IDENTIFIED BY 'qwerty4ever';
CREATE USER IF NOT EXISTS 'patate'@'156.20.12.2' IDENTIFIED BY 'qwerty4ever';
```

On peut utiliser le joker __%__ pour permettre la création d'un utilisateur qui va pouvoir se connecter depuis une plage d'hôtes :

```sql
-- L'utilisateur va pourvoir se connecter depuis n'importe quel hôte dont 
-- l'adresse ip commence par 156.20.12
CREATE USER IF NOT EXISTS 'math'@'156.20.12.%' IDENTIFIED BY 'qwerty4ever';

-- L'utilisateur va pouvoir se connecter depuis n'importe quel hôte
CREATE USER IF NOT EXISTS 'math'@'%' IDENTIFIED BY 'qwerty4ever';
```

# Modifier le nom d'un utilisateur

Pour modifier le nom d'un utilisateur, on utilise la commande RENAME USER :

```sql
RENAME USER 'Math'@'localhost' TO 'Mathieu'@'localhost';
```

# Supprimer un utilisateur

Pour supprimer un utilisateur, on va utiliser DROP USER :

```sql
DROP USER 'Math'@'localhost'
```

# Afficher la liste des utilisateurs

En mysql il n'y a pas de commande SHOW USERS pour nous afficher la liste de tous les utilisateurs. On a vu plus haut que les informations de l'utilisateur était stocké dans la table user de la base de données mysql. On peut donc avec une requête SELECT sur cette table afficher la liste des utilisateurs. Les usagers et les rôles sont stockés ensemble dans cette table. 


```sql
-- Affiche tout les usagers et les rôles
SELECT * FROM mysql.user;
```

