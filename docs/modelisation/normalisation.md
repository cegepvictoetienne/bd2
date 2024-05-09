# Formes normales

Les formes normales constituent un ensemble de principes directeurs qui, lorsqu'ils sont appliqués, garantissent la solidité d'un modèle de données. L'adoption de ces règles offre plusieurs avantages significatifs :

- **Réduction de la redondance des données** : en évitant les doublons, on assure une gestion plus efficace des ressources de stockage.
- **Facilitation des mises à jour** : en minimisant les réplications de données, les modifications sont simplifiées, réduisant ainsi le risque d'erreurs.
- **Prévention des incohérences** : en éliminant les redondances, on réduit le risque d'erreurs de synchronisation entre les données, assurant ainsi leur intégrité.

Bien que huit niveaux de formes normales soient identifiés, dans la pratique et notamment dans le cadre de ce cours, seules les trois premières formes normales sont généralement implémentées. Pour qu'un modèle soit considéré comme étant en troisième forme normale, il est impératif qu'il respecte également les deux premières formes. Cette progression garantit une structuration logique et méthodique des données.

## Première forme normale (1FN)

Les règles de la première forme normale sont :

Pour assurer l'intégrité et l'efficacité d'une base de données, il est essentiel de respecter certaines règles de conception :

1. **Clé primaire de la table** : Chaque table doit posséder une clé primaire, qui identifie de manière unique chaque enregistrement. Si aucun attribut ne se prête naturellement à cette fonction, un champ auto-incrémenté peut être ajouté pour servir de clé primaire.

2. **Atomicité des attributs** : En conformité avec la première forme normale (1FN), chaque attribut doit être atomique, c’est-à-dire indivisible. Un attribut ne doit pas contenir une liste de valeurs ou être de nature composite. Si un attribut est décomposé, il doit aboutir à des informations distinctes et non à une subdivision de la même information.

3. **Uniformité des types de valeurs** : Chaque attribut d'une table doit contenir uniquement un type de valeur, assurant ainsi la cohérence des données.

4. **Absence de redondance dans les colonnes** : La duplication d'informations dans plusieurs colonnes d'une même table doit être évitée pour prévenir les incohérences.

### Exemple de Non-Respect de la 1FN

Prenons l'exemple de deux tables `Usagers` qui violent la première forme normale :

- **Table Usagers 1** :
  - `ID` : clé primaire
  - `Nom` : nom de l'usager
  - `Téléphones` : liste des numéros de téléphone (violation de la 1FN car l'attribut est une liste)

- **Table Usagers 2** :
  - `ID` : clé primaire
  - `Nom` : nom de l'usager
  - `Adresse` : adresse complète (rue, ville, code postal) (violation de la 1FN car l'attribut est composé)

Dans chacun de ces cas, l'attribut en violation doit être modifié pour respecter la première forme normale. Pour la table `Usagers 1`, l'attribut `Téléphones` pourrait être géré via une table séparée. Pour la table `Usagers 2`, l'adresse peut être divisée en attributs distincts comme `Rue`, `Ville`, et `Code Postal`.

### Table Usagers 1
| ID  | Nom          | Téléphones                               |
|-----|--------------|------------------------------------------|
| 1   | Alice Durand | (819) 363-4444, (819) 564-7878           |
| 2   | Bob Martin   | (819) 765-4321                           |
| 3   | Clara Dubois | (819) 123-4567, (819) 987-6543           |
| 4   | Denis Petit  | (819) 345-6789                           |

### Table Usagers 2
| ID  | Nom          | Adresse                                             |
|-----|--------------|-----------------------------------------------------|
| 1   | Alice Durand | 123 rue de l'Église, Québec, G1R 4S9                |
| 2   | Bob Martin   | 456 boulevard Charest, Québec, G1K 8R2              |
| 3   | Clara Dubois | 789 avenue Cartier, Québec, G1S 3P9                 |
| 4   | Denis Petit  | 101 chemin Sainte-Foy, Québec, G1V 1T3               |

Ces données fictives montrent toujours les violations de la première forme normale avec les attributs `Téléphones` et `Adresse`.
Pour rendre les tables `Usager 1` et `Usager 2` conformes à la première forme normale (1FN), nous devons éliminer les listes de valeurs et décomposer les valeurs composites en attributs plus simples. Voici les tables mises à jour :

### Table Usagers 1
Pour rendre cette table conforme à la 1FN, nous créons une nouvelle table pour gérer les numéros de téléphone, assurant qu'un seul numéro soit présent par ligne :

#### Table Usagers
| ID  | Nom         |
|-----|-------------|
| 1   | Alice Durand|
| 2   | Bob Martin  |
| 3   | Clara Dubois|
| 4   | Denis Petit |

#### Table Téléphones
| Usager_ID | Téléphone         |
|-----------|-------------------|
| 1         | (819) 363-4444    |
| 1         | (819) 564-7878    |
| 2         | (819) 765-4321    |
| 3         | (819) 123-4567    |
| 3         | (819) 987-6543    |
| 4         | (819) 345-6789    |

### Table Usagers 2
Pour cette table, chaque composante de l'adresse est scindée en colonnes distinctes pour respecter l'atomicité :

#### Table Usagers
| ID  | Nom          | Rue                    | Ville   | Code Postal |
|-----|--------------|------------------------|---------|-------------|
| 1   | Alice Durand | 123 rue de l'Église    | Québec  | G1R 4S9     |
| 2   | Bob Martin   | 456 boulevard Charest  | Québec  | G1K 8R2     |
| 3   | Clara Dubois | 789 avenue Cartier     | Québec  | G1S 3P9     |
| 4   | Denis Petit  | 101 chemin Sainte-Foy  | Québec  | G1V 1T3     |

Ces modifications permettent à chaque table de respecter la première forme normale en s'assurant que chaque champ contient des données non divisibles et uniques, évitant ainsi la redondance et les problèmes de mise à jour.

## Impact de l'application de la règle

- Aucun attribut n’est composé ou de valeurs multiples
- Augmente grandement la performance en évitant de parcourir des attributs sous forme de liste et en créant des indexes plus performants.

## Deuxième forme normale (2FN)

Pour qu'une table de données soit conforme à la deuxième forme normale (2FN), elle doit remplir les conditions suivantes :

- Être déjà conforme à la première forme normale (1FN).
- Assurer que chaque attribut non-clé dépende entièrement de la clé primaire, ou des clés primaires dans le cas d'une clé composite. Cela signifie qu'aucun attribut ne doit être dépendant uniquement d'une partie d'une clé composite.

Cette structuration vise à garantir une dépendance complète des attributs par rapport à la clé primaire, évitant ainsi les dépendances partielles qui pourraient entraîner des anomalies de données.

Supposons la table notes_cours dans laquelle on veut enregistrer la note obtenue par cours par étudiant :

| ETUDIANT_ID | COURS_ID | NOTE | NOM_COURS         |
|-------------|----------|------|------------------|
| 1           | 1        | 95   | Programmation 1  |
| 2           | 1        | 88   | Programmation 1  |
| 1           | 2        | 64   | Design Web       |


Il existe plusieurs problématiques notables dans la disposition actuelle de la base de données :

1. **Gestion des doublons** : Il peut être difficile de gérer les doublons, particulièrement si l'on souhaite récupérer le nom d'un cours spécifique, tel que "Programmation 1". La présence de doublons peut compliquer l'extraction de données fiables.

2. **Accès aux données après suppression** : Si un étudiant est supprimé de la base, l'accès aux informations du cours auquel il était inscrit, tel que "Design Web", pourrait être compromis. Cette situation pose un risque de perte d'information non négligeable.

3. **Consistance des données** : En cas de modification du nom d'un cours, des erreurs peuvent survenir si la mise à jour n'est pas appliquée uniformément à toutes les occurrences. Cela peut entraîner des incohérences dans les noms des cours, affectant la fiabilité des données.

4. **Ajout de nouveaux cours** : L'ajout de nouveaux cours à la base de données pourrait se heurter à des complications si aucun étudiant n'est encore inscrit pour recevoir des notes, ce qui rend difficile la gestion prévisionnelle des cours.

Pour remédier à ces problèmes et assurer la conformité avec la 2FN, il est préconisé de scinder la table existante en deux tables distinctes :

- **Table Cours** : Contiendrait des informations uniques sur les cours, telles que `ID_Cours` (clé primaire) et `Nom_Cours`.
- **Table Inscriptions** : Relierait les étudiants aux cours et inclurait `ID_Étudiant`, `ID_Cours`, et `Note`. Chaque attribut de cette table serait pleinement dépendant de la clé primaire composée (`ID_Étudiant`, `ID_Cours`), assurant ainsi une dépendance fonctionnelle complète.

Cette restructuration permettrait une gestion plus efficace des données et éviterait les problèmes cités, en s'alignant avec les principes de la modélisation relationnelle et les normes de normalisation des données.

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

Pour qu'une table soit conforme à la troisième forme normale (3FN), elle doit :

- Satisfaire toutes les exigences de la deuxième forme normale (2FN), et par conséquent, celles de la première forme normale (1FN) également.
- Assurer que tous les attributs non-clés dépendent uniquement de la clé primaire, et non d'autres attributs non-clés de la table.

Considérons, à titre d'exemple, la table d'inventaire suivante :

| ID | QUANTITE | ITEM_ID | DESCRIPTION             |
|----|----------|---------|-------------------------|
| 1  | 3        | 1       | Potion de soins mineures |
| 2  | 11       | 2       | Épée de cuivre           |

Dans cette table, l'attribut **DESCRIPTION** dépend de **ITEM_ID** et non directement de la clé primaire **ID**. Pour rendre la table conforme à la 3FN, il conviendrait de retirer l'attribut **DESCRIPTION** de cette table, à condition que cette information soit déjà contenue dans une table distincte associée aux **ITEM_ID** (par exemple, une table **Item**). Cette séparation permet d'éliminer les dépendances transitives et d'assurer que chaque attribut non-clé est directement dépendant de la clé primaire seule, garantissant ainsi l'intégrité et la normalisation des données.

## Impact de l'application de la règle

- Permets d'éliminer plusieurs redondances des données.
- Facilite la mise à jour des données

Dans certaines circonstances, atteindre et maintenir la troisième forme normale (3FN) n'est pas toujours pratique ou nécessaire, en particulier lorsque des exigences spécifiques ou des problématiques de performance le justifient. Prenons l'exemple d'une table qui enregistre les détails des lignes de facture : idéalement, le total de chaque ligne ne devrait pas être stocké puisqu'il peut être calculé dynamiquement à partir de la quantité et du prix unitaire. Cependant, si les opérations sur le total des lignes sont fréquentes et lourdes en termes de calcul, il peut être judicieux de déroger à la 3FN et de conserver ce total dans une colonne dédiée. Cela peut significativement réduire le temps de traitement et améliorer la performance du système, particulièrement dans les contextes où la rapidité d'accès aux données est critique.

Cette approche pragmatique doit être évaluée soigneusement, en pesant les avantages en termes de performance contre les risques potentiels d'incohérence des données, particulièrement lors des mises à jour. Cette décision doit être prise en considération du contexte spécifique et des besoins opérationnels de l'application ou du système de gestion de base de données.

# Ressources

Une vidéo qui explique très bien la normalisation (en anglais) : [Normalisation](https://youtu.be/GFQaEYEc8_8)