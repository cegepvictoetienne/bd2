# Déclencheurs (triggers)  

Un déclencheur (trigger)) est une routine, une série d'instruction enregistrée, qui est relié à une table de la base de données. Les instructions seront exécutées automatiquement lors d'une insertion, d'une mise à jour ou d'une suppression dans la table à laquelle le déclencheur est attaché et ça pour chacune des lignes affectées par la requête. On doit aussi spécifier à quel moment il sera déclenché, avant l'instruction SQL ou après. On peut donc définir jusqu'à 6 déclencheurs par table : avant ou après une insertion, avant ou après une mise à jour, avant ou après une suppression.

Il est possible d'utiliser un déclencheur pour modifier et insérer des données dans n'importe quel table de la base de données à l'exception des tables utilisées dans la requête qui l'a déclenché. Si on veut travailler sur la table à laquelle le déclencheur est attaché, on n'a accès qu'à la ligne qu'on est en train de traiter.

Pourquoi utiliser des déclencheurs ?

- S'assurer de la validité des données avant leur insertion ou leur modification.
- Pour pouvoir utiliser des traitements plus complexe lors d'opération qui affectent plusieurs tables. Par exemple si on veut supprimer des données qui sont reliées à d'autres tables par des clés étrangères et que les options offerte ne nous suffise pas.
- Pour garder une trace des opérations effectuées dans la base de données.
- Mettre à jour des informations qu'on utilise régulièrement pour pouvoir les retrouver facilement, comme par exemple le solde actif d'un compte client.
Syntaxe

On utilise la commande ```CREATE TRIGGER``` pour la création d'un déclencheur. Le nom du déclencheur doit être unique dans la base de données. Il est d'usage de nommer le déclencheur avec le nom de la table associée, du moment de son déclenchement et de l'opération effectuée. Par exemple :  un déclencheur sur la table __usagers__ qui se déclenchera __avant__ une __insertion__, sera nommé __usagers_before_insert__.

```sql
CREATE TRIGGER nomTrigger 
    momentDuDeclenchement operationSQL ON nomTable
    FOR EACH ROW
    corpsDuTrigger;
```

- Le moment du déclenchement est BEFORE ou AFTER
- L'opération SQL est soit INSERT, UPDATE ou DELETE

Si le corps du trigger contient plus d'une requête et/ou opération, on doit les englober par un BEGIN END.

# NEW et OLD

On peut utiliser les mots clés dans le corps du déclencheur pour accéder aux données avant ou après leur modification.

OLD représente les données avant qu'elles ne soient modifiées par la requête. Ces données ne peuvent pas être modifiées. OLD est disponible pour les UPDATE et DELETE.

NEW représente les données après qu'elles aient été modifiées. Ces données peuvent être lues et modifiées. NEW est disponible pour les INSERT et UPDATE.

| Requête | OLD | NEW |
|---------|-----|-----|
| INSERT  |  -  | OUI |
| UPDATE  | OUI | OUI |
| DELETE  | OUI |  -  |

# Erreur dans un déclencheur

Si un déclencheur exécuté avant (BEFORE) une requête cause une erreur, la requête ne sera pas exécutée. Les déclencheurs exécutés après (AFTER) une requête qui génère une erreur feront échouer celle-ci. Il est donc important de bien concevoir les déclencheurs et d'inclure une gestion des erreurs dans notre traitement.

# Supprimer un déclencheur

Pour supprimer un déclencheur, on utilise la commande ```DROP TRIGGER``` suivie du nom du déclencheur. Si on supprimer une table, tous les déclencheurs qui lui sont associés seront aussi supprimés.

```sql
DROP TRIGGER before_insert_usager;
```

# Gestion d'erreurs dans un déclencheur

MySQL gère les erreurs dans les déclencheurs de la façon suivante :

- Si un déclencheur de type BEFORE échoue, l'opération sur la ligne correspondante ne sera pas effectuée.
- Un déclencheur BEFORE est activé par l'essaie d'insérer ou de modifier la ligne, même s'il y a échec de l'opération.
- Un déclencheur AFTER est exécuté seulement après qu'un déclencheur BEFORE et l'opération sur la ligne soient réussis.
- Une erreur dans un déclencheur BEFORE et AFTER cause l'échec de toute l'opération.

On peut aussi gérer les erreurs, les exceptions et même les contraintes à l'aide de HANDLER ou de la commande SIGNAL. Voir les notes sur la gestions des erreurs

Voici un court exemple de gestion avec SIGNAL. On a une table compte avec un champ solde qui ne peut être initialisé à une valeur inférieur à 0.

## Exemple gestion d'exceptions

```sql
DELIMITER $$

CREATE TRIGGER compte_before_insert
    BEFORE INSERT
    ON compte FOR EACH ROW
    BEGIN

        IF NEW.solde < 0 THEN 
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Le solde du nouveau compte ne peut être négatif';
        END IF;

    END $$

DELIMITER ;
```

# Restrictions

- On en peut pas utiliser de transaction dans un déclencheur, START TRANSACTION, COMMIT ou ROLLBACK

- On peut utiliser une procédure stockée mais avec les restrictions suivantes :
	- La procédure ne peut pas retourner d'informations, à part en utilisant un paramètre OUT ou IN/OUT.
	- La procédure ne doit pas utiliser de transaction.
- On ne peut pas modifier les données d'une table qui est utilisée dans la requête qui déclenche le trigger. Ça compte pour toutes les tables de la requête et non seulement la table associée au trigger.
- Une suppression ou modification de données déclenchée par une clé étrangère ne provoquera pas l'exécution du trigger associé à cette table.

## Exemple de déclencheur

Prenons par exemple une table joueurs, un table guildes et une table joueurs_guildes_log. Dans la table joueurs il y a un champ guilde_id qui fait référence à la clé primaire de la table guildes. Quand on modifie la guilde d'un joueur, il faudrait sauvegarder les informations dans une autre table (le id du joueur, l'id de son ancienne guile, l'id de la nouvelle guilde et la date de la modification). Il se doit de créer un déclencheur AFTER sur la table joueur. Il faut  aussi valider que la colonne guilde_id a été modifiée avant d'ajouter les informations dans la table joueurs_guildes_log.


```sql
DELIMITER $$

CREATE TRIGGER joueur_after_update
    AFTER UPDATE
    ON joueur FOR EACH ROW
    BEGIN

        IF OLD.guilde_id <> NEW.guilde_id THEN 
            INSERT INTO joueur_guild_log (joueur_id, 
                                          old_guild_id, 
                                          new_guild_id, 
                                          mod_date)
            VALUES (old.id, 
                    old.guilde_id, 
                    new.guilde_id, 
                    NOW());
        END IF;

    END $$

DELIMITER ;
```

## Documentation

- [https://www.mysqltutorial.org/mysql-triggers/](https://www.mysqltutorial.org/mysql-triggers/)
- [https://www.javatpoint.com/mysql-trigger](https://www.javatpoint.com/mysql-trigger)  
- [https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html](https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html)