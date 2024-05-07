# Exercice 9 - Crédit social

## Installation

Les scripts sql de génération de la base de données sont disponible [ici](../ressources/ex09_credit_social.zip)

- Créez la base de données et les tables en exécutant le script sql **01_create_table.sql**
- Insérez les données en exécutant les scripts suivants (<u>**l'ordre est important**</u>). Certains scripts comportent beaucoup de ligne, 50 000 pour 04_insert_citoyen, c'est normal que le temps exécution soit long. {==Importez les scripts en ligne de commande pour gagner beaucoup de temps!!!==}

Liste des scripts à exécuter

   - 02_insert_classe
   - 03_insert_evenement_type
   - 04_insert_citoyen
   - 05_insert_evenement
   - 06_insert_citoyen_evenement



Inscrivez moi les scripts des 5 numéros dans un fichier sql. Une fois terminé remettez moi le fichier dans le devoir sur Teams.



## Diagramme des classes

![ex09_diagramme](../images/ex09_diagramme.png)

## Descriptions

La base de données sert à stocker des informations sur les citoyens pour établir leur score de crédit social, une note de bon comportement qui détermine dans quel classe le citoyen est situé. 

### Calcul du crédit social

À la naissance, un citoyen se voit octroyer un crédit initial de 500 (par contre ce nombre pourrait être modifié par le parti). Tout au long de sa vie, le total de ce crédit va fluctuer selon des événements auquel le citoyen va participer. Donc le crédit social de chaque citoyen est la somme de son crédit initial et du score de tous les événements auxquels il a participé. Les événements sont défini par un type et un score par défaut (dans la table **evenement_type**, mais ce score peut être ajusté selon la nature de l'événement (le champ **score_ajustement** de la table **citoyen_evenement**, s'il est à **null** ne pas en tenir compte, sinon il outrepasse le score par défaut de l'événement). Le score de crédit social peut varier entre 0 et 1000.

### Calcul de la classe du citoyen

Chaque citoyen appartient à une classe selon son score de crédit social. Ça lui donne droit à certain avantage de sa classe mais aussi aux avantages de toutes les classes inférieurs. Pour appartenir à une classe, le score de crédit social du citoyen doit être supérieur au crédit minimum de cette classe ( colonne **credit_min** de la table **classe**). La classe est recalculé chaque nuit selon son score actuel. Donc pour connaitre la classe d'un citoyen vous n'avez qu'à utiliser le champ classe_id de la table citoyen.

## Exercices

### 1. Fonction calcul_credit()

Créez une fonction nommée **calcul_credit** qui prends en paramètre le id d'un citoyen et retourne le total du calcul de son crédit social. 

| Paramètres | IN/OUT | tYPE | Valeur test |
| ---------- | ------ | ---- | ----------- |
| id         | IN     | INT  | 20958       |
| RETURNS    | -    | INT  | 365         |

Ex. Le citoyen Harry Walsh, id 20958, pin 51d8fbc8-d473-45f5-991e-15aea899e8f9, a un score de crédit social de {==365==}. 

``````sql
select calcul_credit(20958) as score_credit
``````

### 2. Fonction privilege_valide()

Créez une fonction nommée **privilege_valide** qui prend en paramètre le code pin du citoyen ainsi que le id d'une classe. Si la classe du citoyen est égale ou supérieur à la classe passée en paramètre, retournez TRUE, sinon retournez FALSE. Pour déterminé si une classe est supérieur à une autre, vous devez vous fiez à la colonne **credit_min** de la table **classe**.

| Paramètres | IN/OUT | tYPE         | Valeur test                          |
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

### 3. Vue citoyen_avec_credit

Créez une vue nommée **citoyen_avec_credit** qui contiendra les champs suivants

| Nom colonne | table   | colonne                      |
| ----------- | ------- | ---------------------------- |
| citoyen_id  | citoyen | id                           |
| nom         | citoyen | nom, prenom ("Walsh, Harry") |
| pin         | citoyen | pin                          |
| classe      | classe  | titre                        |
| credit      | calculé |                              |

Faites ensuite une requête sur cette view pour afficher les informations du citoyen id 20958

### 4. Procédure stockée liste_manifestant

Créez une procédure stockée nommée **liste_manifestant** qui prend une date en paramètre et retourne une liste de manifestants qui était présent. Assurez-vous que pour la date sélectionnée s'il y a un événement il soit de type manifestation. Le résultat doit être classé en ordre alphabétique de nom et prénom.

| Nom colonne    | table     | colonne                      |
| -------------- | --------- | ---------------------------- |
| citoyen_id     | citoyen   | id                           |
| evenement_id   | evenement | id                           |
| nom            | citoyen   | nom, prenom ("Walsh, Harry") |
| pin            | citoyen   | pin                          |
| classe         | classe    | titre                        |
| date_evenement | evenement | date_evenement               |
| notes          | evenement | notes                        |

Faite ensuite une validation avec la date 2021-04-01, vous devriez avoir 17 enregistrements. Si vous essayer avec la date 2022-09-15 vous devriez en avoir aucun.

### 5. Procédure stockée update_classe

Créez une procédure stockée nommée **update_classe** qui va mettre à jour la classe de chaque citoyen. Il vous faudra calculer le crédit social de chacun, ensuite déterminer dans quelle classe il appartient selon le crédit minimum de chaque classe. 

- Vous devez parcourir tous les enregistrements de la table **citoyen** en utilisant un {==curseur==}.
- Si vous détectez une différence entre la classe du citoyen et votre calcul, vous devez "logger" le problème dans la table **log_update_classe**.

Pour tester votre procedure, limitez la requête **SELECT** qui alimente le curseur à un seul citoyen et modifier la valeur du champs credit_initial de ce citoyen pour que la valeur du champs classe_id ne soit plus valide. Dans l'exemple plus bas j'ai modifié la valeur du crédit initial du citoyen 2 pour 850, ce qui lui donne une classe de 2 (Beta) au lieu de 4 (Delta).

![ex09_a](../images/ex09_a.png) 

Après avoir lancer ma procédure, on peut voir que la valeur de classe_id a bien été modifié et que l'opération a été enregistré dans la table log_update_classe.

![ex09_b](../images/ex09_b.png)

![ex09_c](../images/ex09_c.png)

