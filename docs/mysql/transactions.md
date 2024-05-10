# Transactions

Une transaction en SQL est un ensemble d'opérations exécutées comme un seul bloc logique, garantissant ainsi la cohérence et l'intégrité des données. Ces opérations peuvent être validées (COMMIT) ou annulées (ROLLBACK). Utiliser des transactions est crucial pour préserver l'intégrité des données face aux erreurs humaines ou aux problèmes systèmes, tels que les pannes de serveur durant le traitement.

## Démarrer une transaction

### AUTOCOMMIT

Par défaut, MySQL valide automatiquement chaque requête individuellement. Pour modifier ce comportement et permettre la gestion manuelle des transactions, on peut désactiver l'autocommit pour la session en cours.

```sql
-- Désactiver l'autocommit
SET autocommit = 0;
```

La commande `START TRANSACTION` est couramment utilisée pour initier explicitement une transaction. Toutes les opérations suivantes seront alors en attente jusqu'à validation ou annulation de la transaction.

```sql
-- Démarrer une transaction
START TRANSACTION;
INSERT INTO athlete (nom, prenom) VALUES ('Laurier', 'William');
```

## Terminer une transaction

### COMMIT

Pour valider toutes les opérations réalisées depuis le début de la transaction et les rendre permanentes, utilisez `COMMIT`.

```sql
START TRANSACTION;
-- Opérations à effectuer
COMMIT;
```

### ROLLBACK

Pour annuler toutes les opérations depuis le début de la transaction, utilisez `ROLLBACK`.

```sql
START TRANSACTION;
-- Opérations à effectuer
ROLLBACK;
```

## Utiliser des points de sauvegarde

Les points de sauvegarde permettent de revenir à un état spécifique dans une transaction sans annuler toutes les opérations.

### SAVEPOINT

Pour créer un point de sauvegarde :

```sql
SAVEPOINT nom_du_savepoint;
```

Pour annuler les opérations jusqu'à un point de sauvegarde spécifique :

```sql
ROLLBACK TO SAVEPOINT nom_du_savepoint;
```

Exemple d'utilisation :

```sql
START TRANSACTION;
INSERT INTO athlete (nom, prenom) VALUES ('Laurier', 'William');
SAVEPOINT save_will;
INSERT INTO athlete (nom, prenom) VALUES ('Laurier', 'Marianne');
ROLLBACK TO SAVEPOINT save_will;
COMMIT;
```

Dans cet exemple, seul l'enregistrement de William Laurier est conservé.

## Commandes qui terminent automatiquement une transaction

Certaines opérations SQL terminent automatiquement une transaction en cours et agissent comme un `COMMIT` :

- Modifications de la structure de la base de données.
- Création ou suppression de bases de données, tables, index, vues, ou procédures stockées.
- Modification de paramètres de configuration ou de sécurité, comme les utilisateurs.
- Démarrage d'une nouvelle transaction sans clôturer la précédente.
- Activation de l'autocommit.

# Sources

- [https://dev.mysql.com/doc/refman/8.0/en/sql-transactional-statements.html](https://dev.mysql.com/doc/refman/8.0/en/sql-transactional-statements.html)
- [https://www.javatpoint.com/mysql-transaction](https://www.javatpoint.com/mysql-transaction)
- [https://www.mysqltutorial.org/mysql-transaction.aspx](https://www.mysqltutorial.org/mysql-transaction.aspx)
