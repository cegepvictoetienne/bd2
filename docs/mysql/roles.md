# Gestion des rôles dans MySQL

Les rôles dans MySQL sont des collections nommées de privilèges qui simplifient la gestion des droits d'accès des utilisateurs. Un rôle peut être attribué à plusieurs utilisateurs, permettant une gestion centralisée des permissions.

## Créer un rôle

Pour créer un rôle, utilisez la commande `CREATE ROLE`. Vous pouvez créer plusieurs rôles simultanément en les listant, séparés par des virgules.

```sql
CREATE ROLE IF NOT EXISTS 'nomRole1', 'nomRole2';
```

## Ajouter ou enlever des privilèges à un rôle

Pour gérer les privilèges d'un rôle, référez-vous à la documentation sur les privilèges pour les commandes spécifiques, telles que `GRANT` et `REVOKE`.

## Accorder un rôle à un utilisateur

Pour attribuer un rôle à un ou plusieurs utilisateurs, utilisez la commande `GRANT`. Notez qu'il est nécessaire d'indiquer l'hôte si celui-ci est spécifique.

```sql
GRANT 'nomRole1' TO 'user1', 'user2'@'192.168.1.%';
```

## Révoquer un rôle d'un utilisateur

Pour retirer un rôle d'un ou plusieurs utilisateurs, utilisez la commande `REVOKE`. Comme pour l'attribution, l'hôte doit être spécifié si nécessaire.

```sql
REVOKE 'nomRole1' FROM 'user1', 'user2'@'192.168.1.%';
```

## Supprimer un rôle

Pour supprimer un rôle existant :

```sql
DROP ROLE 'nomRole1';
```

## Activer un rôle

Un rôle doit être activé pour un utilisateur pour qu'il prenne effet. Un utilisateur ne peut avoir qu'un seul rôle actif à la fois. L'utilisateur doit se connecter pour activer son rôle.

```sql
SET ROLE 'nomRole';
```

## Afficher le rôle actif

Pour vérifier quel rôle est actuellement actif pour l'utilisateur connecté :

```sql
SELECT current_role();
```

Si aucun rôle n'est actif, le résultat sera `NULL`.

## Définir un rôle par défaut

Pour que le rôle soit automatiquement activé lors de la connexion d'un utilisateur, vous pouvez le définir comme rôle par défaut :

```sql
SET DEFAULT ROLE 'nomRole' FOR 'nomUsager';
```

Cette configuration facilite la gestion des permissions, en s'assurant que les utilisateurs disposent des privilèges appropriés dès leur connexion.