# Exercice 9 - Crédit social

## Installation

Les scripts sql de génération de la base de données sont disponibles [ici](../ressources/ex09_credit_social.zip)

- Créez la base de données et les tables en exécutant le script sql **01_create_table.sql**
- Insérez les données en exécutant les scripts suivants (<u>**l'ordre est important**</u>). Certains scripts comportent beaucoup de lignes, 50 000 pour 04_insert_citoyen, c'est normal que le temps exécution soit long. {==Importez les scripts en ligne de commande pour gagner beaucoup de temps!!!==}

Liste des scripts à exécuter :  

   - 02_insert_classes
   - 03_insert_evenements_types
   - 04_insert_citoyens
   - 05_insert_evenements
   - 06_insert_citoyens_evenements



Veuillez inscrire les scripts des cinq numéros dans un fichier SQL. Une fois cette tâche terminée, merci de remettre le fichier dans l'espace de devoirs sur Teams.



## Diagramme des classes

![ex09_diagramme](../images/ex09_diagramme.svg)

## Descriptions

La base de données sert à stocker des informations sur les citoyens afin d'établir leur score de crédit social, une note de bon comportement qui détermine à quelle classe sociale appartient chaque citoyen.

## Calcul du crédit social

À la naissance, un citoyen reçoit un crédit initial de 500 (ce nombre peut être modifié par le parti). Tout au long de sa vie, le total de ce crédit fluctue selon les événements auxquels le citoyen participe. Le crédit social de chaque citoyen est la somme de son crédit initial et du score de tous les événements auxquels il a participé.

Les événements sont définis par un type et un score par défaut dans la table **evenements_types**. Ce score peut être ajusté selon la nature de l'événement via le champ **score_ajustement** de la table **citoyens_evenements**. Si ce champ est à **null**, le score par défaut de l'événement est utilisé; sinon, le score ajusté est pris en compte. Le score de crédit social peut varier entre 0 et 1000.

## Calcul de la classe du citoyen

Chaque citoyen appartient à une classe selon son score de crédit social. Cela lui donne droit aux avantages de sa classe ainsi qu'aux avantages de toutes les classes inférieures. Pour appartenir à une classe, le score de crédit social du citoyen doit être supérieur au crédit minimum de cette classe (colonne **credit_min** de la table **classes**). La classe est recalculée chaque nuit selon le score actuel du citoyen. Pour connaître la classe d'un citoyen, vous pouvez consulter le champ **classe_id** de la table **citoyens**.

## Exercices

### 1. Fonction calcul_credit()

Créez une fonction nommée **calcul_credit** qui prends en paramètre le id d'un citoyen et retourne le total du calcul de son crédit social. 

| Paramètres | IN/OUT | TYPE | Valeur test |
| ---------- | ------ | ---- | ----------- |
| id         | IN     | INT  | 20958       |
| RETURNS    | -    | INT  | 365         |

Ex. Le citoyen Harry Walsh, id 20958, pin 51d8fbc8-d473-45f5-991e-15aea899e8f9, a un score de crédit social de {==365==}. 

``````sql
select calcul_credit(20958) as score_credit
``````

### 2. Fonction privilege_valide()

Créez une fonction nommée **privilege_valide** qui prend en paramètres le code PIN d'un citoyen ainsi que l'ID d'une classe. Si la classe du citoyen est égale ou supérieure à la classe spécifiée, retournez TRUE, sinon retournez FALSE. Pour déterminer si une classe est supérieure à une autre, vous devez vous baser sur la colonne **credit_min** de la table **classes**.


| Paramètres | IN/OUT | TYPE         | Valeur test                          |
| ---------- | ------ | ------------ | ------------------------------------ |
| pin        | IN     | VARCHAR(100) | 51d8fbc8-d473-45f5-991e-15aea899e8f9 |
| classe_id  | IN     | INT          | 4                                    |
| RETURNS    | -    | BOOLEAN      | FALSE                                |

Ex. Le citoyen Harry Walsh, id 20958, pin 51d8fbc8-d473-45f5-991e-15aea899e8f9 appartient à la classe Delta. 

``````sql
-- Cette requête retournera 1
select privilege_valide('51d8fbc8-d473-45f5-991e-15aea899e8f9',4) as valide
-- Cette requête retournera 0
select privilege_valide('51d8fbc8-d473-45f5-991e-15aea899e8f9',3) as valide
``````

### 3. Vue citoyens_avec_credit

Créez une vue nommée **citoyens_avec_credit** qui contiendra les champs suivants :  

| Nom colonne | table   | colonne                      |
| ----------- | ------- | ---------------------------- |
| citoyen_id  | citoyens | id                           |
| nom         | citoyens | nom, prenom ("Walsh, Harry") |
| pin         | citoyens | pin                          |
| classe      | classes  | titre                        |
| credit      | calculé |                              |

Faites ensuite une requête sur cette vue pour afficher les informations du citoyen id 20958.  

### 4. Procédure stockée liste_manifestants

Créez une procédure stockée nommée **liste_manifestants** qui prend une date en paramètre et retourne une liste de manifestants présents à cette date. Assurez-vous que l'événement pour la date sélectionnée soit de type "manifestation". Le résultat doit être trié par ordre alphabétique des noms et prénoms.


| Nom colonne    | table     | colonne                      |
| -------------- | --------- | ---------------------------- |
| citoyen_id     | citoyens   | id                           |
| evenement_id   | evenements | id                           |
| nom            | citoyens   | nom, prenom ("Walsh, Harry") |
| pin            | citoyens   | pin                          |
| classe         | classes    | titre                        |
| date_evenement | evenements | date_evenement               |
| notes          | evenements | notes                        |

Pour valider votre procédure, utilisez la date 2021-04-01. Vous devriez obtenir 17 enregistrements. Si vous essayez avec la date 2022-09-15, vous ne devriez obtenir aucun enregistrement.

### 5. Procédure stockée update_classe

Créez une procédure stockée nommée **update_classe** qui mettra à jour la classe de chaque citoyen. Vous devrez calculer le crédit social de chaque citoyen, puis déterminer à quelle classe il appartient selon le crédit minimum de chaque classe.

- Parcourez tous les enregistrements de la table **citoyens** en utilisant un curseur.
- Si vous détectez une différence entre la classe actuelle du citoyen et celle déterminée par votre calcul, vous devez enregistrer le problème dans la table **log_update_classe**.

Pour tester votre procédure, limitez la requête **SELECT** qui alimente le curseur à un seul citoyen et modifiez la valeur du champ **credit_initial** de ce citoyen pour que la valeur du champ **classe_id** ne soit plus valide. Par exemple, modifiez la valeur du crédit initial du citoyen avec l'ID 2 à 850, ce qui lui donne une classe de 2 (Beta) au lieu de 4 (Delta).

Pour tester votre procédure, voici les étapes :

1. Limitez la requête **SELECT** pour n'inclure qu'un seul citoyen :
    ```sql
    DECLARE curs CURSOR FOR 
    SELECT c.id, c.credit_initial, c.classe_id 
    FROM citoyens c
    WHERE c.id = 2;
    ```

2. Modifiez la valeur du champ **credit_initial** pour le citoyen avec l'ID 2 :
    ```sql
    UPDATE citoyens
    SET credit_initial = 850
    WHERE id = 2;
    ```

3. Appelez la procédure :
    ```sql
    CALL update_classe();
    ```

![ex09_a](../images/ex09_a.png) 

Après avoir lancer la procédure, on peut voir que la valeur de classe_id a bien été modifiée et que l'opération a été enregistrée dans la table **log_update_classe**.

![ex09_b](../images/ex09_b.png)

![ex09_c](../images/ex09_c.png)

