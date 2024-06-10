# Exercice 9 - Crédit social

## Installation

Téléchargez et installez la base de données à partir des scripts SQL disponibles [ici](../ressources/ex09_credit_social.zip). Suivez les étapes ci-dessous pour une configuration correcte :

1. **Création de la base de données :** Exécutez le script `01_create_table.sql` pour créer les tables nécessaires.
2. **Insertion des données :** Exécutez les scripts dans l'ordre suivant. Notez que certains scripts, comme `04_insert_citoyen`, contiennent jusqu'à 50 000 lignes et peuvent prendre du temps à s'exécuter. Il est recommandé d'importer les scripts via la ligne de commande pour accélérer le processus.

    - `02_insert_classes`
    - `03_insert_evenements_types`
    - `04_insert_citoyens`
    - `05_insert_evenements`
    - `06_insert_citoyens_evenements`

## Description du système

La base de données est conçue pour stocker des informations sur les citoyens et calculer leur score de crédit social. Ce score, qui varie de 0 à 1000, est une évaluation de leur comportement, influençant leur classe sociale et les avantages associés.

## Fonctionnalités à implémenter

### 1. Fonction `calcul_credit()`

Créez une fonction qui retourne le score de crédit social total d'un citoyen, basé sur son crédit initial et les scores des événements auxquels il a participé.

- **Paramètre d'entrée :** ID du citoyen (INT)
- **Valeur de retour :** Score total (INT)
- **Calcul** : Le crédit social total est calculé en ajoutant le crédit initial de 500 points (modifiable) au total des scores ajustés ou par défaut des événements auxquels le citoyen a participé.

#### Validation 

Le citoyen Harry Walsh, id 20958, pin 51d8fbc8-d473-45f5-991e-15aea899e8f9, a un score de crédit social de {==365==}. 

```sql
select calcul_credit(20958) as score_credit
```

### 2. Fonction `privilege_valide()`

Développez une fonction qui détermine si le citoyen a accès aux privilèges d'une classe donnée, en fonction de son score de crédit social.

- **Paramètres d'entrée :** PIN du citoyen (VARCHAR(100)), ID de la classe (INT)
- **Valeur de retour :** Vrai ou faux (BOOLEAN)
- **Calcul** : Vérifie si le score de crédit social du citoyen est supérieur ou égal au crédit minimum requis pour la classe spécifiée.

#### Validations

Le citoyen Harry Walsh, id 20958, pin 51d8fbc8-d473-45f5-991e-15aea899e8f9 appartient à la classe Delta. 

```sql
-- Cette requête retournera 1
select privilege_valide('51d8fbc8-d473-45f5-991e-15aea899e8f9',4) as valide
-- Cette requête retournera 0
select privilege_valide('51d8fbc8-d473-45f5-991e-15aea899e8f9',3) as valide
```

### 3. Vue `citoyens_avec_credit`

Créez une vue qui affiche les informations détaillées des citoyens, y compris leur classe et leur crédit social actuels.

| Nom colonne | table   | colonne                      |
| ----------- | ------- | ---------------------------- |
| citoyen_id  | citoyens | id                           |
| nom         | citoyens | nom, prenom ("Walsh, Harry") |
| pin         | citoyens | pin                          |
| classe      | classes  | titre                        |
| credit      | calculé |                              |

### 4. Procédure stockée `liste_manifestants`

Développez une procédure stockée qui liste les citoyens ayant participé à une manifestation à une date spécifique, triés par nom et prénom.

### 5. Procédure stockée `update_classe`

Élaborez une procédure qui met à jour la classe sociale des citoyens en fonction de leur score de crédit. Enregistrez toute modification de classe dans la table `log_update_classe`.

## Diagramme et ressources

Visualisez le diagramme des classes et les relations entre les tables pour mieux comprendre la structure de la base de données.

![Diagramme des classes](../images/ex09_diagramme.svg)

## Livrables

Regroupez toutes les requêtes et procédures dans un fichier SQL unique. Soumettez ce fichier dans l'espace de devoirs sur Teams une fois toutes les tâches complétées.
