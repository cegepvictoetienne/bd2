# Exercice 7 - Déclencheurs 

## Préparation des données
- Importer le script sql **ex07_create_tables.sql** disponible [ici](../ressources/ex07_create_tables.sql)

## Déclencheurs à créer

### Question #1 
Pour chaque modification à la table **resultats**, insérez les informations nécessaires dans la table **resultats_log** APRÈS l'exécution de la requête INSERT, UPDATE et DELETE. Attention, lors d'un UPDATE, ajoutez les informations seulement si la colonne **resultat_ms** a été modifié.

| colonne          | insert          | update          | delete          |
| ---------------- | --------------- | --------------- | --------------- |
| operation        | "insert"        | "update"        | "delete"        |
| ancien_resultat  | null            | old.resultat_ms | old.resultat_ms |
| nouveau_resultat | new.resultat_ms | new.resultat_ms | null            |
| resultat_id      | new.id          | new.id          | new.id          |
| date_operation   | La date du jour | La date du jour | La date du jour |

### Question #2
 Quand un résultat est inséré, validez que la valeur de la colonne cree_par existe dans la table **usagers**. Si la valeur est invalide, empêchez la requête INSERT et retournez un message d'erreur. La valeur à insérer dans le champ cree_par est le id d'un usager de la table **usagers**. 

### Question #3
Effectuez les mêmes opérations que la question #2 quand on modifie un résultat mais sur la colonne modifie_par.

### Question #4
AVANT l'insertion ou la modification de la description d'une épreuve dans la table epreuves_types, valider que la description n'est pas déjà utilisée. Si oui, modifiez la valeur à ajouter ou modifier en ajoutant (x) à la description. ( x vaudra le nombre de fois que le nom se retrouve dans la table -1 ) Ex. On veut insérer Marathon comme valeur mais elle est déjà présente comme description dans la table. On va utiliser Marathon (1) comme nouvelle valeur à insérer.
