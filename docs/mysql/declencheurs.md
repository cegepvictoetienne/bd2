# Déclencheurs (Triggers)

Un déclencheur est une routine automatique associée à une table dans une base de données. Les instructions du déclencheur s'exécutent automatiquement lors d'une insertion, mise à jour, ou suppression dans la table liée, affectant chaque ligne modifiée. Le moment de l'exécution du déclencheur doit être spécifié : avant (BEFORE) ou après (AFTER) l'exécution de l'instruction SQL. Chaque table peut comporter jusqu'à six déclencheurs : avant ou après chacun des trois types d'opérations (INSERT, UPDATE, DELETE).

Les déclencheurs peuvent modifier ou insérer des données dans n'importe quelle table de la base de données, sauf dans celle utilisée par la requête déclencheuse. Pour les opérations sur la table liée au déclencheur, seule la ligne en cours de traitement peut être manipulée.

## Pourquoi utiliser des déclencheurs ?

- **Validation des données** : Assurer l'intégrité des données avant leur insertion ou modification.
- **Traitements complexes** : Gérer des opérations complexes affectant plusieurs tables, utiles notamment lors de la gestion de clés étrangères.
- **Audit** : Suivre les modifications dans la base de données.
- **Mise à jour automatique** : Actualiser les informations fréquemment consultées, comme le solde d'un compte client.

## Création d'un déclencheur

La syntaxe pour créer un déclencheur est la suivante :

```sql
CREATE TRIGGER nomTrigger
    momentDuDeclenchement operationSQL ON nomTable
    FOR EACH ROW
    corpsDuTrigger;
```

- **momentDuDeclenchement** : BEFORE ou AFTER.
- **operationSQL** : INSERT, UPDATE, ou DELETE.
- Le **corpsDuTrigger** peut contenir plusieurs requêtes, encapsulées entre BEGIN et END si nécessaire.

## Utilisation des mots-clés NEW et OLD

- **NEW** : Accède aux données telles qu'elles sont après la modification (disponible pour INSERT et UPDATE).
- **OLD** : Accède aux données avant la modification (disponible pour UPDATE et DELETE).

| Requête | OLD | NEW |
|---------|-----|-----|
| INSERT  |  -  | Oui |
| UPDATE  | Oui | Oui |
| DELETE  | Oui |  -  |

## Gestion des erreurs dans les déclencheurs

- Si un déclencheur BEFORE échoue, l'opération sur la ligne est annulée.
- Les erreurs dans les déclencheurs AFTER annulent l'opération en cours.
- Utilisation de `SIGNAL` pour renvoyer des erreurs personnalisées dans les déclencheurs.

## Suppression d'un déclencheur

Pour supprimer un déclencheur :

```sql
DROP TRIGGER IF EXISTS nomTrigger;
```

La suppression d'une table entraîne aussi la suppression de tous les déclencheurs qui lui sont associés.

## Restrictions

- Les transactions ne sont pas autorisées dans les déclencheurs (pas de START TRANSACTION, COMMIT, ou ROLLBACK).
- Les procédures stockées utilisées dans les déclencheurs ne peuvent pas retourner de valeurs sauf via des paramètres OUT ou IN/OUT.

## Exemple de déclencheur

Voici un exemple où un changement de guilde par un joueur est enregistré :

```sql
DELIMITER $$

CREATE TRIGGER joueur_after_update
    AFTER UPDATE
    ON joueurs FOR EACH ROW
    BEGIN
        IF OLD.guilde_id <> NEW.guilde_id THEN 
            INSERT INTO joueurs_guildes_log (joueur_id, old_guilde_id, new_guilde_id, mod_date)
            VALUES (OLD.id, OLD.guilde_id, NEW.guilde_id, NOW());
        END IF;
    END $$

DELIMITER ;
```

## Documentation

- [https://www.mysqltutorial.org/mysql-triggers/](https://www.mysqltutorial.org/mysql-triggers/)
- [https://www.javatpoint.com/mysql-trigger](https://www.javatpoint.com/mysql-trigger)  
- [https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html](https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html)