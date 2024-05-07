# Transactions

En SQL, une transaction est une série d'instructions ou de requêtes qui doivent être exécuté en un seul bloc. Cette série d'opérations peut être acceptée (COMMIT) ou refusée (ROLLBACK). C'est une pratique qui est essentielle quand on veut lancer une série d'opérations et s'assurer de l'intégrité de notre base de données. Ça nous protège à la fois des erreurs humaines (erreur dans le code, mauvaise manipulation des données, etc.) et des erreurs externes (pannes de serveur durant un traitement par exemple).

# Démarrer une transaction

## AUTOCOMMIT

Par défaut MySQL n'utilise pas les transactions et toutes les requêtes sont automatiquement validées. On peut modifier ce comportement en changeant la valeur de la variable système autocommit. Attention, la variable autocommit est une variable de session, c'est-à-dire que la modification qu'on y fait n'est valide que pour la session en cours et qu'elle reprendra sa valeur par défaut à la session suivante.

```sql
-- Modification pour que les requêtes ne soit plus automatiquement "commité"
SET autocommit = 0;

-- Insertion d'un enregistrement
insert into athlete (nom, prenom) 
values ('Fréchette', 'Mathieu');

-- Étant donné que la variable autocommit est maintenant à false, 
-- l'insertion ne sera permanente qu'après avoir validé la transaction
START TRANSACTION
```

La façon la plus courante de démarrer une transaction est d'utiliser la commande START TRANSACTION. Une fois la commande lancée, toutes les requêtes suivantes seront "en attente" tant que la transaction ne sera pas validée.

```sql

-- Pour l'exemple, je m'assure que la valeur de la variable autocommit est bien à TRUE.
-- C'est la valeur par défaut, on n'est pas obligé de le spécifié en temps normal.
SET autocommit = 1;
-- Début de la transaction
START TRANSACTION;

-- Insertion d'un enregistrement
insert into athlete (nom, prenom) 
values ('Fréchette', 'Mathieu');

-- Étant donné qu'on a débuté une transaction, l'insertion ne sera permanente 
-- qu'après l'avoir validée ou annulée.
```

# Terminer une transaction

## COMMIT

Si toutes les requêtes se sont bien exécutées et qu'on veut confirmer les changements, on va utiliser la commande COMMIT. Les modifications apportées seront maintenant permanentes et la transaction va se terminer.

```sql
START TRANSACTION;
-- Opérations à effectuer
...

-- Valider la transaction et rendre les opérations permanentes.
COMMIT;
```

## ROLLBACK

Pour terminer la transaction en annulant TOUTES les modifications effectuées, on va utiliser la commande ROLLBACK.

```sql
START TRANSACTION;
-- Opérations à effectuer
...

-- Annuler toutes les opérations depuis le début de la transaction
ROLLBACK;
```

# Utiliser des points de sauvegarde

On ne peut pas débuter une seconde transaction "à l'intérieur" d'une transaction déjà débutée, ça va causer la validation de la première et lancer la seconde. Par contre on peut créer des points de sauvegarde qui nous permettront d'annuler uniquement les opérations effectuées depuis un point de sauvegarde.

## SAVEPOINT

Pour créer un point de sauvegarde, on va utiliser la commande SAVEPOINT. On peut définir plusieurs point de sauvegarde à l'intérieur d'une même transaction.

```sql
SAVEPOINT nom_du_savepoint
ROLLBACK TO SAVEPOINT
```

Une fois le point de sauvegarde créé, on peut annuler uniquement les transactions effectuées depuis celui-ci.

```sql
-- Début de la transaction
START TRANSACTION;

-- Insertion d'un enregistrement
insert into athlete (nom, prenom) 
values ('Fréchette', 'Mathieu');

-- Création d'un point de sauvegarde
SAVEPOINT save_Math;

-- Insertion d'un second enregistrement
insert into athlete (nom, prenom) 
values ('Fréchette', 'Marianne');

-- Annulation jusqu'au savepoint save_Math
ROLLBACK TO SAVEPOINT save_Math;

-- Validation de la transaction
COMMIT;

-- L'athlète Mathieu Fréchette sera inséré dans la base de données mais pas Marianne Fréchette.
```

# Commandes qui terminent automatiquement une transaction

Attention, certaines commandes SQL vont clôturer automatiquement une transaction et aussi valider toutes les opérations, comme si on aurait utilisé la commande COMMIT. 

Voici une liste de ces commandes

- Toutes les commandes qui apportent une modification à la structure de la base de données vont valider une transaction
- La création ou suppression d'une base de données
- Toutes les modifications apportées aux tables, création, modification, etc...
- La création ou suppression d'un index.
- La création de procédures stockées, de fonctions ou de vues.
- La création, suppression ou modification d'un utilisateur.
- Le début d'une nouvelle transaction sans avoir terminé la première.
- Changer la valeur de la variable autocommit à TRUE.
- La création ou suppression d'un LOCK sur une table.

# Sources

- [https://dev.mysql.com/doc/refman/8.0/en/sql-transactional-statements.html](https://dev.mysql.com/doc/refman/8.0/en/sql-transactional-statements.html)
- [https://www.javatpoint.com/mysql-transaction](https://www.javatpoint.com/mysql-transaction)
- [https://www.mysqltutorial.org/mysql-transaction.aspx](https://www.mysqltutorial.org/mysql-transaction.aspx)
