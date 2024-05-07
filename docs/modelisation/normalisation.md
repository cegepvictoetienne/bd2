# Formes normales

Les formes normales sont un ensemble de règles qui, si elles sont suivies, nous assure de la robustesse de notre modèle de données. Elles nous offrent aussi les avantages suivants :

- Éviter la redondance des données
- Simplifier les mises à jour
- Interdire les incohérences de données venant des redondances

Il existe 8 niveaux de formes normales, mais le plus souvent seulement les trois premières sont appliquées. C'est aussi ce que nous verrons dans le cadre du cours. Chaque forme normale doit respecter toutes les formes qui la précèdent. Pour qu'on puisse dire qu'on est en troisième forme normale, il faut que la première et deuxième forme soit respectée.

## Première forme normale (1FN)

Les règles de la première forme normale sont :

- Chaque table doit avoir une clé primaire
- Chaque attribut doit être atomique et ne pas être une liste de valeur.
- Un attribut ne doit contenir qu'un type de valeur.
- On ne doit pas répéter la même information sur plusieurs colonnes

Une table doit toujours comporter une clé primaire. Si aucune données ne peut remplir se rôle naturellement, on va ajouter un champ autoincrémenté comme clé primaire.

Dans la première forme normale, on doit s'assurer que chaque attribut soit atomique, c'est-à-dire qu'il n'est pas une liste de valeurs ou bien composé (si on le décompose, on obtient d'autres informations).

Exemple de deux tables usager qui ne sont pas 1FN

| id | nom                 | courriel                                      |
|----|---------------------|--------------------------------------------|
| 1  | Roux, Lucien  | lucienr@gmail.com                   |
| 2  | Legendre, Linda   | linda_legendre@gmail.com, lindal@caramail.com |
| 3  | Mathis, Jennifer    | jennyM@gmail.com                           |

| id | nom                 | courriel1                 | courriel2                              |
|----|---------------------|------------------------|-------------------------------------|
| 1  | Roux, Lucien  | lucienr@gmail.com | null                                |
| 2  | Legendre, Linda   | linda_legendre@gmail.com         | lindal@caramail.com       |
| 3  | Mathis, Jennifer    | jennyM@gmail.com       | null                                |

La forme n'est pas respectée, car les valeurs de l'attribut nom sont composées et l'attribut courriel contient une liste de valeur dans la première table et est étalé sur deux colonnes dans la deuxième table. Pour être 1FN, on devrait créer une nouvelle table avec l'attribut email et séparer l'attribut nom en deux, nom et prénom :

table __usagers__

| ID | NOM        | PRENOM   |
|----|------------|----------|
| 1  | Roux  | Lucien  |
| 2  | Legendre  | Linda   |
| 3  | Mathis     | Jennifer |

table __courriels__

| ID | USAGER_ID | COURRIEL                            |
|----|-----------|----------------------------------|
| 1  | 1         | lucienr@gmail.com         |
| 2  | 2         | linda_legendre@gmail.com                   |
| 3  | 2         | lindal@caramail.com     |
| 4  | 3         | jennyM@gmail.com                 |


## Impact de l'application de la règle

- Aucun attribut n’est composé ou de valeurs multiples
- Augmente grandement la performance en évitant de parcourir des attributs sous forme de liste et en créant des indexes plus performants.

## Deuxième forme normale (2FN)

Pour être en 2FN, il faut :

- Respecter la première forme normale
- Que tous les attributs qui ne sont pas une clé primaire soient dépendant en totalité de la ou des clés primaires.

Supposons la table notes_cours dans laquelle on veut enregistrer la note obtenue par cours par étudiant :

| ETUDIANT_ID | COURS_ID | NOTE | NOM_COURS         |
|-------------|----------|------|------------------|
| 1           | 1        | 95   | Programmation 1  |
| 2           | 1        | 88   | Programmation 1  |
| 1           | 2        | 64   | Design Web       |

On peut noter rapidement quelques problèmes dans cette disposition :

- Il faut gérer les possibles doublons si on veut obtenir le nom d'un cours, par exemple le cours de Programmation 1.
- Est-ce que j'ai encore accès au nom du cours de Design Web si je supprime l'entrée de l'étudiant avec le id 1 pour ce cours?
- Si je modifie le nom Programmation 1 mais qu'il y a un problème et que seulement le premier est modifié, on se retrouve avec une inconsistence de données.
- Qu'est-ce qui se passe si je veux ajouter un nouveau cours mais que je n'ai pas encore de notes d'étudiants?

Pour chaque attribut qui n'est pas une clé primaire, il doit être dépendant de la clé primaire. Dans notre exemple, la note est dépendante de l'étudiant et du cours, mais le nom du cours n'est dépendant que du cours. Pour respecter la 2FN, on doit séparer la table en deux :

table __notes_cours__

| ETUDIANT_ID | COURS_ID | NOTE |
|-------------|----------|------|
| 1           | 1        | 95   |
| 2           | 1        | 88   |
| 1           | 2        | 64   |

table __cours__

| ID | NOM              |
|----|-----------------|
| 1  | Programmation 1 |
| 2  | Design Web      |

## Impact de l'application de la règle

- Permets d'éliminer plusieurs redondances des données.
- Facilite la mise à jour des données

# Troisième forme normale (3FN)

Pour respecter la troisième forme normale, on doit :

- Remplir toutes les exigences de la deuxième règle normale, donc implicitement de la première règle aussi.
- Tous les attributs qui ne sont pas une clé primaire doivent dépendre directement de la clé primaire et non d'autres attributs de la table.

Prenons par exemple la table inventaire suivante :  

| ID | QUANTITE | ITEM_ID | DESCRIPTION             |
|----|----------|---------|-------------------------|
| 1  | 3        | 1       | Potion de soins mineures |
| 2  | 11       | 2       | Épée de cuivre           |

Ici l'attribut __DESCRIPTION__ est dépendant de l'attribut __ITEM_ID__, mais pas de la clé primaire __ID__. La solution ici serait de supprimer l'attribut description de la table, en supposant que l'information se retrouve dans la table item.

## Impact de l'application de la règle

- Permets d'éliminer plusieurs redondances des données.
- Facilite la mise à jour des données

Dans certaines situations, une fois la troisième forme atteinte, il peut être acceptable de briser la règle à cause de certaines exigences ou problématiques précise. Par exemple dans une table où on enregistre le détail d'une ligne de facture, le total de la ligne ne doit pas être sauvegardé, car il peut être calculé à partir de la quantité et du prix unitaire. Par contre, si on a à faire beaucoup d'opération avec le total de la ligne, on pourrait conserver le total dans une colonne pour faciliter le traitement.

# Ressources

Une vidéo qui explique très bien la normalisation (en anglais) : [Normalisation](https://youtu.be/GFQaEYEc8_8)