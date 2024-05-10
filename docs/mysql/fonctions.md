# Les fonctions

Une fonction en SQL est une routine programmée qui retourne une valeur unique et qui peut être utilisée à plusieurs reprises. MySQL inclut plusieurs fonctions prédéfinies telles que `NOW()` et `CONCAT()`, et permet également la création de fonctions personnalisées.

## Création d'une fonction

### Syntaxe de base

```sql
DELIMITER $$

CREATE FUNCTION [IF NOT EXISTS] nom_fonction(
    paramètre1 TYPE,
    paramètre2 TYPE, …
)
RETURNS type_de_retour
[NOT] DETERMINISTIC
BEGIN
    -- Instructions
    RETURN valeur;
END $$

DELIMITER ;
```

#### Paramètres
- **Définis par un nom et un type** : Chaque paramètre est défini par un nom suivi de son type de données.
- **Séparés par des virgules** : Les paramètres sont listés et séparés par des virgules.

#### Type de retour
- **Specifié après `RETURNS`** : Le type de la valeur de retour de la fonction doit être un type de données valide en MySQL (par exemple, `INTEGER`, `VARCHAR()`, `TINYINT(1)`).

#### DETERMINISTIC vs NOT DETERMINISTIC
- **DETERMINISTIC** : La fonction retourne toujours la même valeur pour les mêmes paramètres.
- **NOT DETERMINISTIC** : La fonction peut retourner des valeurs différentes même pour les mêmes paramètres.
- **Importance de la spécification** : Cette spécification est importante pour l'optimisation et la performance. Par défaut, une fonction est considérée comme NOT DETERMINISTIC.

### Traitement
- **Déclaration de variables** : Typiquement, une variable est déclarée au début pour stocker le résultat à retourner.
- **Instruction RETURN** : La fonction doit inclure une instruction `RETURN` qui termine la fonction et retourne la valeur.

### Gestion des erreurs
- **Utilisation de HANDLERs** : Des gestionnaires d'erreurs (`HANDLER`) peuvent être utilisés pour contrôler les exceptions et les erreurs.

#### Exemple de création de fonction

```sql
DELIMITER $$

CREATE FUNCTION note_commentaire(resultat INTEGER)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE commentaire VARCHAR(20);
    IF resultat >= 60 THEN
        SET commentaire = 'Réussite';
    ELSE
        SET commentaire = 'Échec';
    END IF;
    RETURN commentaire;
END $$

DELIMITER ;
```

## Utilisation d'une fonction

Les fonctions peuvent être utilisées dans toutes les requêtes SQL ou procédures stockées.

```sql
SELECT note_commentaire(r.note)
FROM resultats AS r
WHERE r.etudiant_id = 1234;
```

## Modification d'une fonction

Pour modifier une fonction, il est nécessaire de la supprimer et de la recréer, car SQL ne permet pas de modifier directement le corps d'une fonction.

### Suppression d'une fonction

#### Syntaxe de suppression

```sql
DROP FUNCTION [IF EXISTS] nom_fonction;
```