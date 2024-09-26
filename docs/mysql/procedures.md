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

# Utilisation de transactions dans une procédure stockée.

Une des utilisations de procédures stockées est de regrouper des opérations dans une transaction. Cela permet de garantir l'intégrité des données en cas d'erreur. L'uitilisation de transactions dans une procédure stockée est similaire à celle dans un script SQL.

Ex: 

Prenons la table `compte` suivante :

```sql
CREATE TABLE compte (
  id INT PRIMARY KEY,
  solde DECIMAL(10,2)
);

INSERT INTO compte (id, solde) VALUES (1, 1000.00);
INSERT INTO compte (id, solde) VALUES (2, 500.00);
```

Nous voulons créer une procédure `transfert_fonds` qui transfère un montant d'un compte à un autre. Voici un exemple de procédure qui effectue cette opération :

```sql  
DELIMITER $$

CREATE PROCEDURE transfert_fonds(
    IN id_source INT, 
    IN id_destination INT, 
    IN montant DECIMAL(10,2)
)
BEGIN
    -- Déclaration des variables pour la gestion d'erreur
    DECLARE error_message TEXT;
    DECLARE sql_state CHAR(5) DEFAULT '';
  
    -- Variable de travail
    DECLARE solde_source DECIMAL(10,2);
    

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback de la transaction
        ROLLBACK;
        
        -- Extraire les informations d'erreur
        GET STACKED DIAGNOSTICS CONDITION 1
            error_message = MESSAGE_TEXT,
            sql_state = RETURNED_SQLSTATE;
        
        -- Afficher le message d'erreur
        SELECT sql_state,
            error_message AS message_erreur;
    END;

    START TRANSACTION;

    -- Extraire le solde du compte source
    SELECT solde INTO solde_source
    FROM compte
    WHERE id = id_source
    FOR UPDATE; -- Optional: Pour barrer l'enregistrement pour éviter la concurence (race condition)

    -- Vérifier si le compte existe
    IF solde_source IS NULL THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Compte source inexistant';
    END IF;

    -- Vérifier si le solde du compte source est suffisant
    IF solde_source < montant THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Solde insuffisant';
    END IF;

    -- Enlever le montant du compte source
    UPDATE compte
    SET solde = solde - montant
    WHERE id = id_source;

    -- Ajouter le montant au compte de destination
    UPDATE compte
    SET solde = solde + montant
    WHERE id = id_destination;

    -- Vérifier si le compte de destination existe
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Compte destination inexistant';
    END IF;

    -- Transaction réussie!
    COMMIT;

    -- Message pour indiquer que le transfert est réussi
    SELECT 'Transfert réussi' AS message_succes;
END $$
DELIMITER ;
```

Ressources

- [Documentation officielle](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)  
- [MySQL Tutorial](https://www.mysqltutorial.org/mysql-stored-procedure-tutorial.aspx)
