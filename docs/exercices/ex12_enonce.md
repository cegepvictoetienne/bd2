# Exercice 12 - pyCRUD

Comme premier exercice avec Python, on va créer une application console simple qui va couvrir sommairement les opération CRUD. Nous allons utiliser la base de données credit_social. Je vous laisse aller pour l'apprentissage de Python et des notions dont vous allez avoir besoin (afficher à l'écran, lire une saisie clavier, boucle, fonction, module).

## Création du menu

Au lancement du programme, un menu s'affichera avec les options suivantes : 

1. Ajouter un nouveau citoyen
2. Obtenir les informations d'un citoyen
3. Modifier un citoyen
4. Supprimer un citoyen
5. Quitter

Exemple de menu
```console
 =================
 = Crédit social =
 =================

 Menu principal
 1- Ajouter un nouveau citoyen
 2- Obtenir les informations d'un citoyen
 3- Modifier un citoyen
 4- Supprimer un citoyen
 5- Quitter
 
 Veuillez choisir une option :
``` 


## Options du menu

### 1. Ajouter un citoyen

Demandez à l'usager les informations suivantes sur le citoyen à ajouter : 

- nom
- prénom
- no_civique
- adresse
- ville
- pin

Utiliser les valeurs suivantes pour les autres champs :
- classe_id : 4
- credit_initial : 500

Une fois l'ajout fait, affichez un message de confirmation et revenez au menu principal.
```console
 ==============================
 = Ajouter un nouveau citoyen =
 ==============================

 Veuillez nous donner les informations suivantes au sujet du nouveau citoyen
 Prénom : Michael
 Nom : Scott
 Numéro civique : 1725
 Adresse : Slough Avenue
 Ville : Scranton
 PIN : db123fe-00xx-fagsv
 Le citoyen Michael Scott - id [50001] a été ajouté avec succès
 Appuyez sur une touche pour revenir au menu...
```

### 2. Obtenir les informations d'un citoyen

Demandez à l'usager de saisir le id du citoyen. Affichez ensuite les informations suivantes à l'écran : 

- Prénom et nom
- Classe
- Score de crédit social

Ensuite revenez au menu principal.

```console
 =========================================
 = Obtenir les informations d'un citoyen =
 =========================================

 Entrez le id du citoyen : 50001
 > Michael Scott - Classe Delta - Crédit social : 500
 
 Appuyez sur une touche pour revenir au menu...
```

### 3. Modifier un citoyen

Permettre en saisissant le id d'un citoyen de modifier son adresse ( no_civique, adresse, ville). Affichez un message de confirmation et revenez au menu principal.

```console
 =======================
 = Modifier un citoyen =
 =======================

 Veuillez nous donner les informations suivantes au sujet du  citoyen à modifier
 ID du citoyen : 50001
 Numéro civique : 1725
 Adresse : Slough Avenue
 Ville : Scranton, PA
 Le citoyen Michael Scott - id [50001] a été modifié avec succès

 Appuyez sur une touche pour revenir au menu...
```

### 4. Supprimer un citoyen

Supprimez un citoyen de la base de données avec son id. Attention présentement dans la base de données il n'y a aucune clés étrangères entre les tables *citoyens*, *citoyens_evenements* et *evenements*. On peut donc supprimer un citoyen sans supprimer les évènements auxquelles il a participé. Il faudrait s'assurer qu'en supprimant un citoyen, ses évènements soient aussi supprimés. À vous de choisir l'approche que vous voulez (le faire dans la requête suppression, supprimer en cascade depuis une clé étrangère, etc.)

```console
 ========================
 = Supprimer un citoyen =
 ========================

 Veuillez nous donner les informations suivantes au sujet du  citoyen à supprimer
 ID du citoyen : 50001
 
 Le citoyen Michael Scott - id [50001] a été supprimé avec succès

 Appuyez sur une touche pour revenir au menu...
```

### 5. Quitter

On quitte la boucle et le programme.

