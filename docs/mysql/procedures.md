# Procédures stockées

Une procédure stockée est un ensemble d'instructions SQL enregistrées sur le serveur MySQL, qui peuvent être réutilisées. Contrairement à une fonction, une procédure stockée peut retourner un ou plusieurs jeux de résultats.

## Création d'une procédure

### Syntaxe de base

```sql
DELIMITER $$

CREATE PROCEDURE nom_procedure()
BEGIN
  -- Traitement
END $$

DELIMITER ;
```

## Paramètres

Les paramètres d'une procédure sont définis par leur nom, leur type de données et leur mode (IN, OUT, ou INOUT) :

- **IN** : Le paramètre est passé à la procédure et utilisé pour les calculs internes.
- **OUT** : La procédure peut modifier ce paramètre pour retourner une valeur.
- **INOUT** : Combinant les modes IN et OUT, ce paramètre peut être modifié et lu.
- Par défaut, un paramètre est considéré comme IN si aucun mode n'est spécifié.
- Les paramètres doivent être séparés par des virgules.

## Traitement

- Une procédure stockée peut mais n'est pas obligée de retourner une valeur. Elle peut effectuer diverses opérations, comme supprimer des enregistrements suivant certains critères.
- Il est conseillé de retourner un indicateur de succès ou d'erreur pour signaler l'issue de la procédure.
- Les gestionnaires d'erreurs (`HANDLERs`) peuvent être utilisés pour contrôler le traitement et gérer les exceptions.

## Utilisation de variables

Les variables dans une procédure sont déclarées comme suit :

```sql
DECLARE nom_variable type_de_donnee [DEFAULT valeur_default];
```

- **DEFAULT** est optionnel et permet d'assigner une valeur initiale à la variable.

Exemples d'utilisation de variables :

```sql
DECLARE prenom VARCHAR(50) DEFAULT 'Lucien';

SET prenom = 'Paul';

SELECT u.prenom INTO prenom
FROM usager u
WHERE u.id = 1234;
```

- Les variables peuvent être assignées directement avec `SET` ou via un `SELECT ... INTO`, qui doit retourner une valeur unique.

## Suppression d'une procédure

Pour supprimer une procédure stockée, utilisez :

```sql
DROP PROCEDURE [IF EXISTS] nom_procedure;
```

Ressources

- [Documentation officielle](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)  
- [MySQL Tutorial](https://www.mysqltutorial.org/mysql-stored-procedure-tutorial.aspx)
