# Les curseurs

Un curseur en SQL permet de parcourir les lignes d'un résultat de requête une par une, similaire à une boucle "while" en programmation. C'est particulièrement utile pour effectuer des traitements spécifiques sur chaque ligne obtenue d'une requête.

## Caractéristiques des curseurs
- **Lecture seule** : Les curseurs ne permettent pas de modifier les données récupérées; ils servent uniquement à lire les résultats.
- **Parcours séquentiel** : Les lignes sont lues de la première à la dernière sans possibilité de sauter ou revenir en arrière. Pour modifier l'ordre de lecture, utilisez `ORDER BY` dans votre requête.
- **Données dynamiques** : En MySQL, les curseurs reflètent l'état actuel de la base de données. Si les données sous-jacentes sont modifiées pendant l'utilisation du curseur, ces modifications seront visibles.
- **Contexte d'utilisation** : Les curseurs peuvent être utilisés dans les procédures stockées, les fonctions et les déclencheurs.

## Mise en œuvre des curseurs
L'utilisation des curseurs se fait en quatre étapes principales :

### 1. Déclaration
Le curseur doit être déclaré avec une requête `SELECT` qui définit les données à parcourir.

```sql
DECLARE mon_curseur CURSOR FOR 
    SELECT colonne1, colonne2 FROM table WHERE condition;
```

### 2. Ouverture
Avant de pouvoir utiliser le curseur, il doit être ouvert :

```sql
OPEN mon_curseur;
```

### 3. Récupération des données
Les données sont récupérées ligne par ligne à l'aide de la commande `FETCH`. Chaque `FETCH` récupère la ligne suivante du résultat de la requête et stocke les valeurs dans des variables préalablement déclarées.

```sql
FETCH mon_curseur INTO variable1, variable2;
```

### 4. Fermeture
Une fois toutes les données traitées, le curseur doit être fermé pour libérer les ressources associées.

```sql
CLOSE mon_curseur;
```

## Gestion des exceptions
Lorsqu'un `FETCH` tente de lire au-delà de la dernière ligne du résultat, une exception `NOT FOUND` est levée. Pour gérer cette exception et éviter l'interruption du processus, un handler peut être défini :

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_enregistrement = 1;
```

Cette déclaration configure le comportement en cas d'exception, permettant au bloc de code de continuer l'exécution, typiquement en vérifiant la valeur de la variable `fin_enregistrement` après chaque `FETCH`.

## Exemple complet
Voici un exemple illustrant la création d'une procédure stockée utilisant un curseur pour traiter les données des employés :

```sql
DELIMITER $$

CREATE PROCEDURE generer_listes_employes(IN nombre_annee INT)
BEGIN
    DECLARE fin_enregistrement INTEGER DEFAULT 0;
    DECLARE nom VARCHAR(30);
    DECLARE prenom VARCHAR(30);
    DECLARE courriel VARCHAR(255);
    DECLARE calcul_anciennete INT;

    DECLARE curseur_employe CURSOR FOR 
        SELECT nom, prenom, courriel, TIMESTAMPDIFF(YEAR, date_embauche, NOW()) 
        FROM employes;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_enregistrement = 1;

    OPEN curseur_employe;
    boucle_employes: LOOP
        FETCH curseur_employe INTO nom, prenom, courriel, calcul_anciennete;
        IF fin_enregistrement = 1 THEN 
            LEAVE boucle_employes;
        END IF;
        IF calcul_anciennete < nombre_annee THEN
            INSERT INTO employe_moins(nom, prenom, courriel);
        ELSE
            INSERT INTO employe_plus(nom, prenom, courriel);
        END IF;
    END LOOP;
    CLOSE curseur_employe;
END$$

DELIMITER ;
```

Cette procédure crée deux listes de diffusion basées sur l'ancienneté des employés, en utilisant un curseur pour parcourir et traiter chaque employé individuellement.

# Sources et documentation supplémentaire

- [https://dev.mysql.com/doc/refman/8.0/en/cursors.html](https://dev.mysql.com/doc/refman/8.0/en/cursors.html)
- [https://www.mysqltutorial.org/mysql-cursor/](https://www.mysqltutorial.org/mysql-cursor/)