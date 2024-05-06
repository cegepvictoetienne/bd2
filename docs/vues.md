# Vues (Views)  

En SQL, on peut enregistrer une requête qu'on utilise régulièrement et la réutiliser facilement dans d'autres requêtes. Pour ce faire on crée ce qu'on appelle une vue (VIEW) .

## Avantages de créer une vue

- Simplification des requêtes
- Sécuriser des données sensibles
- Faciliter la maintenance

Il faut se rappeler qu'une vue n'est pas une façon d'optimiser nos requêtes. Quand une vue est utilisé dans une requête, la requête de la vue est exécuté en premier lieu et ensuite la requête principale. On pourrait voir ça comme une sous-requête qui est plus simple à utiliser pour le programmeur.

# Créer une vue

Pour créer une vue, on utilise la déclaration ```CREATE VIEW``` :

```sql
CREATE [OR REPLACE] VIEW [nom_bd.]nom_view [(liste_colonne)]
AS
requête_select;
``` 

Le nom de la vue doit être unique dans la base de données, aucune autre vue ni table ne doit avoir le même nom.
Si on ajoute l'option OR REPLACE et que la vue existe déjà, la nouvelle vue va remplacer l'ancienne, sinon ça n'aura aucun effet.
On peut définir optionnellement les noms de colonnes de la vue, sinon les noms de colonnes seront celle de la requête select.
Pour terminer, on ajoute une requête select. La requête peut interroger des tables et d'autres vues.

## Exemple

```sql
CREATE OR REPLACE VIEW etudiants_informatique (nom_complet, da)
AS 
    SELECT CONCAT(e.nom, ', ', e.prenom),
           e.da
    FROM etudiants e
        INNER JOIN etudiants_concentration ec ON ec.etudiant_id = e.id
            INNER JOIN concentrations c ON c.id = ec.concentration
    WHERE c.description = "Technique informatique";
```  

Ensuite pour se servir de la vue, on n'a qu'à utiliser la vue comme une table :

```sql
SELECT * 
FROM etudiants_informatique
ORDER BY da;
``` 

# Modifier une vue

Pour modifier une vue, on peut utiliser la déclaration ```CREATE OR REPLACE VIEW``` ou bien ```ALTER VIEW```. Les deux méthodes sont similaires dans leur résultat. On a déjà vu la syntaxe du ```CREATE OR REPLACE VIEW```. Voici un exemple pour le ```ALTER VIEW``` :

```sql
ALTER VIEW nom_view [(liste_colonne)]
AS requête_select;;
```

On ne peut pas modifier le nom de la vue par ces méthodes, pour se faire, on doit utiliser la déclaration ```RENAME TABLE```

Renommer une vue

```sql


RENAME TABLE vue 
TO nouveau_nom_vue;
```

# Supprimer une vue

```sql
DROP VIEW [IF EXISTS] nom_vue;
```

Source

- [https://dev.mysql.com/doc/refman/8.0/en/create-view.html](https://dev.mysql.com/doc/refman/8.0/en/create-view.html)
- [https://www.mysqltutorial.org/mysql-views-tutorial.aspx](https://www.mysqltutorial.org/mysql-views-tutorial.aspx)