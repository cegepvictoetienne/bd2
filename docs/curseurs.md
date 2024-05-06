# Les curseurs

Parfois on peut vouloir effectuer un traitement sur chaque lignes du résultat d'une requête. Les curseurs (cursor) nous permettent justement de parcourir ligne par ligne un résultat, un peu à la manière d'une boucle "while" en programmation.

Il y a trois caractéristiques à savoir sur les curseurs :

- Ils sont en lecture seule, on ne peut pas modifier les valeurs du résultat.
On ne peut que parcourir les lignes du résultat de la première à la dernière et on ne peut pas sauter de ligne. Pour modifier "l'ordre de lecture" on doit utiliser le résultat avec la clause ORDER BY de la requête qui générera le résultat.
- En MySQL, les données du curseurs pointent vers les vrais données de la base de données. Ce qui veut dire que si une modification est faite durant l'utilisation du curseur, les données de celui-ci seront aussi modifiées.
- On peut utiliser les curseurs dans des procédures stockées, des fonctions et des "triggers".

L'utilisation des curseurs se fait en quatre étapes :

- DECLARE : On déclare notre curseur en lui spécifiant la requête qui sera utilisée
- OPEN : On "ouvre" notre curseur. On le place dans un état où il pourra recevoir les données
- FETCH : On ajoute les données de la ligne courante du résultat de la requête. La valeur de chaque colonne de la ligne de résultat sera ajoutée dans une variable que l'on aura déclaré préalablement.
- CLOSE : On ferme le curseur une fois notre utilisation terminée.

# Déclaration du curseur

La déclaration du curseur doit se faire après la déclaration des autres variables sinon MySQL va générer un erreur. La syntaxe pour déclarer un curseur est la suivante :

```sql
DECLARE mon_curseur CURSOR FOR requete_select;
```

On doit toujours utiliser une requête SELECT pour générer le résultat qui va être utilisé par le curseur. Voici un exemple où l'on voudrait utiliser le matricule des employées qui ont été embauché il y a 5 ans ou plus

```sql
DECLARE curseur_employe CURSOR FOR
    SELECT matricule 
    FROM employe
    WHERE TIMESTAMPDIFF(year,date_embauche, now()) >= 5;
```

# Ouverture du curseur

Pour ouvrir le curseur, on doit simplement utiliser la commande OPEN suivie du nom du curseur :

```sql
OPEN mon_curseur;
```

Si on reprend l'exemple plus haut, on ferais

```sql
OPEN curseur_employe;
```

# Ajout de données au curseur

Une fois le curseur disponible, on peut y ajouter des données avec la commande FETCH. On le verra plus loin mais le cette opération s'effectue à l'intérieur d'une boucle. Le résultat du FETCH sera les valeurs des colonnes du résultat pour la ligne courante. La syntaxe est la suivante :

```sql
FETCH mon_curseur INTO liste de variable;
```

Les variables doivent être séparées par des espaces et correspondre au nombre de colonnes du résultat. Ces variables auront été déclarées au début de la procédure comme on l'expliquait plus haut. En reprenant notre exemple, nom allons assigner la valeur du matricule de la ligne courante du résultat dans une variable nommée no_matricule :

```sql
FETCH curseur_employe INTO no_matricule;
```

Chaque fois qu'on execute la commande FETCH, MySQL essaie de lire la ligne suivante du résultat. S'il n'y a plus d'enregistrement (qu'on est à la dernière ligne), une exception sera levée. On doit gérer cette exception si on veut que tout se déroule bien. Pour se faire, on va ajouter un HANDLER. Sa déclaration se fera après la déclaration du curseur (on va voir plus loin l'ordre en détail avec un exemple).

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_enregistrement = 1;
```

En résumé, on indique à MySQL que si il rencontre l'exception NOT FOUND de continuer le traitement (CONTINUE) et d'assigner à la variable fin_enregistrement la valeur 1. La variable fin_enregistrement aura été déclaré plus haut.

# Fermeture du curseur

Finalement, une fois notre traitement terminé, il nous reste qu'à fermer le curseur.

```sql
CLOSE mon_curseur;
```

ou avec notre exemple

```sql
CLOSE curseur_employe;
```

# Exemple d'une procédure utilisant un curseur

Une entreprise veut créer deux listes de diffusion pour ses employées, une première pour les employées qui compte moins de x années d'anciennetés et une pour les autres (le nombre d'années sera reçu en paramêtre). La liste comportera le nom et prénom de l'employé ainsi que son adresse courriel. Dans la base de données il y a déjà deux tables qui ont été créé pour recevoir ces listes : employe_moins et employe_plus. En réalité il y aurait plus d'étapes en mettre en place dans notre procédure pour s'assurer de l'intégrité de nos données (utiliser une transaction, vider les tables avant l'ajout, "attraper" les erreurs, etc...). Pour simplifier les choses prenons pour acquis que les tables sont vides et que tout va se dérouler sans erreurs comme par magie.

```sql
DELIMITER $$
CREATE PROCEDURE generer_liste_employe (IN nombre_annee)
BEGIN
    -- Déclaration de la variable utilisée dans le handler "NOT FOUND"
    DECLARE fin_enregistrement INTEGER DEFAULT 0;
    -- Déclaration des variables utilisées dans le fetch du curseur
    DECLARE nom varchar(30) DEFAULT "";
    DECLARE prenom varchar(30) DEFAULT "";
    DECLARE courriel varchar(255) DEFAULT "";
    DECLARE calcul_anciennete INT DEFAULT 0;

    -- Déclaration du curseur des employées
    DEClARE curseur_employe CURSOR FOR 
        SELECT nom, prenom, email, TIMESTAMPDIFF(year,date_embauche, now()) 
        FROM employees;

    -- Déclaration du handler NOT FOUND
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_enregistrement = 1;

    -- Ouverture du curseur
    OPEN curseur_employe;

    -- Début de la boucle
    liste_employee: LOOP
        -- On assigne les valeurs de la ligne du résultat aux variables
        FETCH curseur_employe INTO nom, prenom, courriel, calcul_anciennete;
        -- On s'assure qu'on n'a pas atteind la fin des enregistrements avant de continuer
        IF fin_enregistrement = 1 THEN 
            LEAVE liste_employee;
        END IF;

        -- En utilisant la variable calcul_anciennete utilisée dans le fetch et le paramêtre
        -- nombre_annee, on valide avec un si dans quelle tables ajoutées les données
        IF  calcul_anciennete < nombre_annee THEN
            INSERT INTO employe_moins(nom, prenom, courriel) VALUES (nom, prenom, courriel)
        ELSE
            INSERT INTO employe_plus(nom, prenom, courriel) VALUES (nom, prenom, courriel)
        END IF;

    END LOOP liste_employee;

    -- Fermeture du curseur
    CLOSE curseur_employe;

END$$
DELIMITER ;
```

# Sources et documentation supplémentaire

- [https://dev.mysql.com/doc/refman/8.0/en/cursors.html](https://dev.mysql.com/doc/refman/8.0/en/cursors.html)
- [https://www.mysqltutorial.org/mysql-cursor/](https://www.mysqltutorial.org/mysql-cursor/)