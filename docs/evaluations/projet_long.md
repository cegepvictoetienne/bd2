### Énoncé d'Évaluation : Création d'une Application de Gestion de Pizzeria en Python et MySQL

#### Contexte
Dans le cadre du cours de Bases de Données 2, vous êtes chargé de développer une application Web en Python pour la gestion d'une pizzeria. L'application doit permettre de prendre des commandes de pizzas pour la livraison en utilisant une base de données MySQL.

#### Objectifs
Votre programme devra permettre aux clients de fournir leur nom, numéro de téléphone, adresse de livraison et de choisir les détails de leur pizza. La personnalisation de la pizza comprend le choix de la croûte, de la sauce et des garnitures.

#### Spécifications de la pizza
- **Types de Croûtes** : Classique, Mince, Épaisse
- **Choix de Sauces** : Tomate, Spaghetti, Alfredo
- **Choix de Garnitures** (maximum 4) : Pepperoni, Champignons, Oignons, Poivrons, Olives, Anchois, Bacon, Poulet, Maïs, Fromage, Piments forts

#### Exigences de la base de données
1. **Modélisation et création de la base de données**
    - Créez les tables nécessaires pour stocker les informations des clients, les commandes, les détails des pizzas et les types de croûtes, sauces, et garnitures disponibles.
    - Assurez-vous de mettre en place des relations appropriées entre les tables pour maintenir l'intégrité des données.

2. **Fonctionnalités de l'application**
    - Interface Web pour saisir les données du client et de la commande.
    - Fonctionnalité pour choisir les options de personnalisation de la pizza.
    - Affichage du résumé de la commande avant confirmation finale.
    - Affichage de la liste des commandes en attente de livraison.
    - Interface pour compléter une livraison et retirer la commande de la liste des livraisons en attente.

3. **Déclencheur dans la base de données**
    - Implémentez un déclencheur MySQL qui se déclenche à chaque nouvelle commande pour ajouter automatiquement la commande à une liste de commandes en attente de livraison.

#### Critères de livraison
Créez un dépôt GitHub pour le travail, à l'intérieur duquel vous aurez les éléments suivants :

- **Code Source** : Votre script Python complet avec des commentaires pour expliquer les fonctions clés.
- **Script SQL** : Un script SQL pour créer la base de données, les tables, et le déclencheur et un script SQL pour l'insertion des données.
- **Documentation** : Un diagramme de classe décrivant la base de données analysée. 

#### Conseils
- Utilisez des transactions pour garantir que les données soient cohérentes et que les opérations sur la base de données soient sécurisées.
- Gérez les exceptions pour s'assurer que l'application peut gérer les erreurs de saisie des utilisateurs et les problèmes de base de données de manière élégante.

Cette évaluation vise à tester vos compétences en programmation Python, en conception de bases de données MySQL, et en développement d'applications interactives en console. Bonne chance!



## Grille de correction

| Critères                                                     | Réussi | Satisfaisant | insatisfaisant | Points |
| :----------------------------------------------------------- | ------ | ------------ | -------------- | ------ |
| Les scripts SQL de création de tables et d'insertion de données sont fonctionnels et couvrent l'ensemble de l'application. | 2      | 1            | 0              | /2     |
| Le diagramme de classes respecte les points à couvrir de l'analyse de cas et les normes de nomenclature définies dans les notes de cours. | 3      | 2            | 0              | /3     |
| La base de données comportent un déclencheur | 2      | 1            | 0              | /2     |
| L'application Web permet de saisir adéquatement les informations du client. | 2      | 1            | 0              | /2     |
| L'application Web permet de saisir adéquatement une commande client | 3      | 2            | 0              | /3     |
| L'application Web permet d'afficher adéquatement le résumé d'une commande client | 3      | 2            | 0              | /3     |
| L'application Web permet d'afficher adéquatement la liste des commandes en attente de livraison| 3      | 2           | 0              | /3     |
| L'application Web permet de compléter adéquatement une livraison             | 2      | 1            | 0              | /2     |
| Total                                                        |        |              |                | /20    |

