# Exercice 12 - pyCRUD

Cet exercice introduit les opérations CRUD (Créer, Lire, Mettre à jour, Supprimer) à travers une application console simple en Python. Vous allez travailler avec la base de données "credit_social" pour gérer les informations des citoyens.

## Installation

Commencez par télécharger et exécuter le script SQL disponible ici : [Crédit social](../ressources/ex09_credit_social.zip) pour configurer votre base de données.

## Démarrage de l'application

Au lancement de l'application, un menu principal s'affiche avec les options suivantes :

```console
 =================
 = Crédit Social =
 =================

 Menu principal
 1- Ajouter un nouveau citoyen
 2- Obtenir les informations d'un citoyen
 3- Modifier un citoyen
 4- Supprimer un citoyen
 5- Quitter
 
 Veuillez choisir une option :
```

## Fonctionnalités du menu

### 1. Ajouter un citoyen

L'utilisateur doit fournir les informations suivantes pour ajouter un nouveau citoyen :

- Prénom
- Nom
- Numéro civique
- Adresse
- Ville
- PIN

Les champs `classe_id` et `credit_initial` sont définis automatiquement à 4 et 500, respectivement. Un message de confirmation s'affiche après l'ajout :

```console
 ==============================
 = Ajouter un nouveau citoyen =
 ==============================

 Veuillez saisir les informations suivantes :
 Prénom : Michael
 Nom : Scott
 Numéro civique : 1725
 Adresse : Slough Avenue
 Ville : Scranton
 PIN : db123fe-00xx-fagsv

 Le citoyen Michael Scott - id [50001] a été ajouté avec succès.
 Appuyez sur une touche pour revenir au menu...
```

### 2. Obtenir les informations d'un citoyen

Demandez l'ID du citoyen pour afficher son prénom, nom, classe, et score de crédit social, puis revenez au menu principal :

```console
 =========================================
 = Obtenir les informations d'un citoyen =
 =========================================

 Entrez le ID du citoyen : 50001
 > Michael Scott - Classe Delta - Crédit social : 500
 
 Appuyez sur une touche pour revenir au menu...
```

### 3. Modifier un citoyen

Permettez la modification de l'adresse d'un citoyen en saisissant son ID. Un message de confirmation est affiché après la modification :

```console
 =======================
 = Modifier un citoyen =
 =======================

 Veuillez saisir l'ID du citoyen et les nouvelles informations :
 ID du citoyen : 50001
 Numéro civique : 1725
 Adresse : Slough Avenue
 Ville : Scranton, PA

 Le citoyen Michael Scott - id [50001] a été modifié avec succès.
 Appuyez sur une touche pour revenir au menu...
```

### 4. Supprimer un citoyen

Supprimez un citoyen en saisissant son ID. Considérez la gestion des événements liés pour éviter des données orphelines :

```console
 ========================
 = Supprimer un citoyen =
 ========================

 Veuillez saisir l'ID du citoyen à supprimer :
 ID du citoyen : 50001

 Le citoyen Michael Scott - id [50001] a été supprimé avec succès.
 Appuyez sur une touche pour revenir au menu...
```

### 5. Quitter

Terminez l'exécution du programme et fermez l'application.

## Conseils de développement

Familiarisez-vous avec les bases de Python, notamment les affichages à l'écran, la saisie clavier, les boucles, les fonctions, et les modules pour réussir cet exercice.