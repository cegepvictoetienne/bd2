# Gestion des rôles

Un rôle est une regroupement nommé de privilèges qu'on peut accorder à un ou plusieurs utilisateurs. On retrouve le même fonctionnement qu'avec l'utilisateur : on va créer un rôle et ensuite lui octroyer des privilèges.

# Créer un rôle

On va créer un ou plusieurs rôles avec la commande CREATE ROLE suivi du nom du rôle. On peut créer plus d'un rôle à la fois en séparant chaque nom de rôle par une virgule.

```sql
CREATE ROLE IF NOT EXISTS 'nomRole1', 'nommRole2';
```

# Ajouter ou enlever des privilèges à un rôle

Voir la section [autorisations](autorisations.md) pour plus d'informations sur les privilèges.

# Accorder un rôle à un utilisateur

Pour accorder un rôle à un utilisateur on utilise la commande GRANT suivi du nom du rôle et du nom d'un ou plusieurs utilisateur. (Attention il faut ajouter l'hôte de l'utilisateur si celui-ci est différent de %)

```sql
GRANT 'nomRole1' TO 'user1', 'user2'@'192.168.1.%';
```

# Révoquer un rôle à un utilisateur

Pour révoquer un rôle d'un utilisateur on utilise la commande REVOKE suivi du nom du rôle et du nom d'un ou plusieurs utilisateurs. (Attention il faut ajouter l'hôte de l'utilisateur si celui-ci est différent de %)

```sql
REVOKE 'nomRole1' FROM 'user1', 'user2'@'192.168.1.%';
``` 

# Supprimer un rôle

```sql
DROP ROLE 'nomRole1';
```

# Activer un rôle

Une fois le rôle créé, il faut qu'il soit activé pour qu'il puisse être appliqué. Attention un usager ne peut avoir qu'un role d'activé à la fois. On doit être connecté à l'usager pour activer son rôle.

```sql
SET ROLE nomRole
```

# Afficher le rôle qui est actif

On peut connaître le rôle présentement activé pour l'utilisateur de cette façon. Le résultat sera null si aucun rôle n'est activé.

```sql
SELECT current_role();
```

# Définir un rôle par défaut

Lors de la connexion, le rôle défini de cette façon sera automatiquement activé.

```sql
SET DEFAULT ROLE nomRole FOR nomUsager
```