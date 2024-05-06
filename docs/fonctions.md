# Les fonctions

Une fonction est une petite routine qui retourne une valeur unique et qui peut être réutilisée. MySQL comporte déjà plusieurs fonctions (NOW(), CONCAT()) mais il est aussi possible d'en créer de nouvelles.

# Création d'une fonction

Voici la syntaxe de création d'une fonction

```sql
DELIMITER $$

CREATE FUNCTION [IF NOT EXISTS] nom_fonction(
    paramètre1,
    paramètre2,…
)
RETURNS type_de_donnée
[NOT] DETERMINISTIC
BEGIN
 -- Le traitement
END $$

DELIMITER ;
```

## Paramètres
- Les paramètres sont définis par un nom et un type de données 
- Chaque paramêtre est séparé par une virgule.

## Type de retour

Après le mot-clé RETURNS on indique le type de données de la valeur de retour de la fonction. Ça peut être n'importe quel type MySQL valide (INTEGER, VARCHAR(), TINYINT(1))

## DETERMINISTIC vs NOT DETERMINISTIC

Une fonction DETERMINISTIC va toujours retourner la même valeur si on lui donne les mêmes paramètres. Une fonction NOT DETERMINISTIC peut retourner un résultat différent même si on lui donne les mêmes paramètres. C'est une valeur "indicative" et MySQL fait confiance au développeur quand à la véracité de l'affimation. Par contre pour une question d'optimisation et de performance il est préférable d'indiquer le bon type. Par défaut la fonction sera NOT DETERMINISTIC.

!!! Note "Truc du métier"
	Il est commun de qualifier une fonction NOT DETERMINISTIC lorsque la fonctions retourne des données dérivées d'une ou de plusieurs tables.

## Le traitement

Habituellement dans le traitment on va déclarer une variable au tout début qui sera utilisée pour contenir le résultat de retour de la fonction.

Le traitement doit absolument contenir un instruction RETURN qui marque la fin de la fonction et retourne la valeur.

On peut utiliser des HANDLERs dans une fonction pour controller les erreurs et le traitement.

Exemple d'une fonction qui reçoit en paramètre une note et qui retourne un commentaire selon la note.

```sql
DELIMITER $$

CREATE FUNCTION note_commentaire(resultat INTEGER)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE commentaire VARCHAR(20);

    IF resultat >= 60 THEN
        SET commentaire = "Réussite";
    ELSE
        SET commentaire = "Échec";
    END IF;

    RETURN commentaire;

END$$

DELIMITER ;
```

# Utilisation d'une fonction

On peut utiliser la fonction dans n'importe quelle instruction MySQL ou procédure stockée.

```sql
SELECT note_commentaire(r.note)
FROM resultats AS r
WHERE r.etudiant_id = 1234; 
```

# Modification d'une fonction

On ne peut pas modifier le traitement d'une fonction. Si des modifications doivent être apportées, il faut supprimer la fonction et la recréer.

## Suppression d'une fonction

Syntaxe
```sql
DROP FUNCTION [IF EXISTS] function_name;
```
