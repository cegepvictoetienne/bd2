# Exercice 7 - Création de déclencheurs

## Préparation

Importez le script SQL **ex07_create_tables.sql** disponible [ici](../ressources/ex07_create_tables.sql) pour préparer votre environnement de base de données.

## Instructions pour les déclencheurs

### Question #1 : Suivi des modifications
Créez un déclencheur qui enregistre chaque modification dans la table `resultats` dans une table de journalisation `resultats_log`. Les détails à enregistrer dépendent du type d'opération effectuée :

| Type d'opération | Colonne `operation` | Colonne `ancien_resultat`      | Colonne `nouveau_resultat`     | Colonne `resultat_id` | Colonne `date_operation`   |
|------------------|---------------------|------------------------|------------------------|---------------|--------------------|
| Insertion        | "insert"            | null                   | `new.resultat_ms`      | `new.id`      | Date actuelle      |
| Mise à jour      | "update"            | `old.resultat_ms`      | `new.resultat_ms`      | `new.id`      | Date actuelle      |
| Suppression      | "delete"            | `old.resultat_ms`      | null                   | `old.id`      | Date actuelle      |

**Note :** Pour les mises à jour, enregistrez les changements uniquement si la colonne `resultat_ms` est modifiée.

### Question #2 : Validation à l'insertion
Implémentez un déclencheur pour valider que l'identifiant de l'utilisateur (`cree_par`) qui insère un nouveau résultat existe dans la table `usagers`. Si l'identifiant n'est pas valide, la requête INSERT doit être bloquée et un message d'erreur retourné.

### Question #3 : Validation à la modification
Appliquez la même validation que dans la Question #2 pour les modifications, mais vérifiez la colonne `modifie_par` lors de la mise à jour d'un résultat.

### Question #4 : Gestion des doublons de descriptions
Avant l'insertion ou la modification d'une description dans la table `epreuves_types`, assurez-vous que la description n'est pas déjà utilisée. Si elle l'est, ajoutez un suffixe numérique entre parenthèses, qui correspond au nombre de fois que la description est déjà présente moins un. Par exemple, si "Marathon" est déjà utilisé, la nouvelle valeur à insérer ou à modifier sera "Marathon (1)".

## Livrables

Soumettez les requêtes SQL des déclencheurs créés, ainsi que des exemples de requêtes qui démontrent leur fonctionnement correct, dans un script SQL.