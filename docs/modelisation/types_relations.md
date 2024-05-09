# Types de relations

Il existe trois types possibles de relation entre les tables :

## Un à plusieurs (1-n)

Vous avez bien décrit une manière de structurer une base de données pour un jeu d'aventure afin de gérer les relations entre les usagers et leurs personnages. Voici une version améliorée et plus détaillée de votre explication, en tenant compte des meilleures pratiques de modélisation de bases de données :

Dans le contexte d'un jeu d'aventure, où un usager peut créer et gérer plusieurs personnages simultanément, la structure de la base de données doit efficacement représenter la relation entre les usagers et leurs personnages. Chaque personnage est exclusif à un usager, ce qui signifie qu'un personnage ne peut appartenir qu'à un seul usager. Pour modéliser cette relation "un à plusieurs" dans la base de données, on utilise la technique de la clé étrangère.

Voici comment cette relation peut être structurée :

1. **Table Usagers** : Cette table contient les informations de base des usagers.
    - **id** (clé primaire) : Identifie de manière unique chaque usager dans le jeu.
    - Autres attributs : Tels que le nom d'usager, l'email, etc.

2. **Table personnages** : Cette table stocke les informations relatives aux différents personnages créés par les usagers.
    - **id** (clé primaire) : Identifie de manière unique chaque personnage dans le jeu.
    - **usager_id** (clé étrangère) : Relie chaque personnage à un usager spécifique. Cette clé étrangère fait référence à la clé primaire de la table Usagers, assurant que chaque personnage est lié à un seul usager.
    - Autres attributs : Tels que le nom du personnage, niveau, classe, etc.

![Relation 1-n](../images/relation_un_plusieurs.svg)  

En utilisant une clé étrangère dans la table Personnages qui pointe vers la clé primaire de la table Usagers, on assure une intégrité référentielle entre les tables. Cela permet de garantir que chaque personnage est associé à un usager existant et empêche les orphelins de données, c'est-à-dire des personnages sans usagers associés. Cette structure facilite également les requêtes pour retrouver tous les personnages appartenant à un usager spécifique, optimisant ainsi les interactions dans le jeu.


## Plusieurs à plusieurs (n-n)

Dans le cadre du jeu d'aventure où un personnage peut posséder plusieurs exemplaires d'un même item et où un item peut être présent dans plusieurs inventaires, nous avons affaire à une relation de type plusieurs à plusieurs entre les personnages (ou directement les inventaires) et les items. Pour modéliser correctement cette relation dans la base de données, il est nécessaire de créer une table de jonction qui transforme cette relation complexe en relations plus simples de type un à plusieurs.

### Structure des tables :

1. **Table Inventaires** : Contient les détails de chaque inventaire associé à un personnage.
    - **id** (clé primaire) : Identifie de manière unique chaque inventaire.

2. **Table Items** : Détaille chaque item qui peut être possédé dans le jeu.
    - **id** (clé primaire) : Identifie de manière unique chaque item.

3. **Table de Jonction inventaires_items** : Démembre la relation plusieurs à plusieurs entre les inventaires et les items.
    - **inventaire_id** (clé étrangère) : Relie chaque entrée à un inventaire spécifique dans la table Inventaires.
    - **item_id** (clé étrangère) : Relie chaque entrée à un item spécifique dans la table Items.
    - Autres attributs possibles : Quantité de l'item dans l'inventaire, condition de l'item, etc.

![Relation n-n](../images/relation_plusieurs_plusieurs.svg)  

### Fonctionnement de la table de jonction :

La table de jonction, souvent appelée table associative, permet de stocker les informations spécifiques à chaque association entre un inventaire et un item, comme la quantité d'un item spécifique dans un inventaire donné. Chaque ligne de cette table représente une occurrence unique d'un item dans un inventaire particulier, ce qui permet de gérer efficacement les multiples instances d'un même item.

En utilisant des clés étrangères qui pointent vers les clés primaires des tables Inventaires et Items, la table de jonction maintient l'intégrité référentielle et simplifie les requêtes qui visent à déterminer quels items se trouvent dans quel inventaire, ou inversement, dans quels inventaires un item particulier est présent. Cette méthode de modélisation est essentielle pour maintenir une base de données organisée, cohérente et facile à gérer dans le contexte d'un jeu complexe avec de multiples éléments interactifs.

## Un à un (1-1)

Dans certains cas de figure en modélisation de bases de données, nous rencontrons des relations de type un-à-un, où chaque entrée dans une table est directement liée à une seule entrée dans une autre table, et vice versa. Ce type de relation est relativement rare car, dans de nombreux cas, les données correspondantes pourraient simplement être regroupées au sein d'une seule table. Cependant, il existe des situations spécifiques où une séparation est justifiée.

### Utilisation des relations un-à-un :

1. **Sécurité et confidentialité des données** : Une relation un-à-un peut être utilisée pour séparer des informations sensibles ou confidentielles des autres données d'un utilisateur. Par exemple, les détails personnels d'un usager, tels que les numéros d'assurance sociale ou les informations bancaires, pourraient être stockés dans une table distincte des autres informations moins sensibles, comme le nom d'usager ou le courriel. Cette séparation aide à mieux sécuriser les données sensibles en limitant l'accès uniquement aux parties de la base de données qui en ont strictement besoin.

2. **Performance et optimisation** : La séparation des données peut également être motivée par des questions de performance. Si certaines données sont accédées ou mises à jour plus fréquemment que d'autres, les placer dans des tables séparées peut réduire le temps de chargement et améliorer l'efficacité des requêtes.

### Exemple de mise en œuvre :

Supposons une base de données avec deux tables, `Usagers` et `Informations_Sensibles` :  

- **Table Usagers** : Contient des données générales comme l'ID de l'usager, le nom, et le courriel.  
- **Table Informations_Sensibles** : Contient des données plus délicates, telles que les informations de paiement ou les numéros d'assurance sociale, avec une clé étrangère qui référence la clé primaire de la table Usagers.  

Dans cette structure, chaque entrée de la table `Usagers` a une correspondance unique dans la table `Informations_Sensibles`, garantissant que chaque usager a exactement un ensemble de données sensibles associé, et inversement.

Ce modèle offre non seulement une meilleure protection des données grâce à une gestion plus ciblée des accès, mais il facilite également la maintenance et l'évolutivité de la base de données en maintenant la séparation logique des différents types de données.


![Relation 1-1](../images/relation_un_un.svg)  