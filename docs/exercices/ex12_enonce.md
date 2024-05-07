# Exercice 12 - pyCRUD

Comme premier exercice avec Python, on va créer une application console simple qui va couvrir sommairement les opération CRUD. Nous allons utiliser la base de données credit_social. Je vous laisse aller pour l'apprentissage de Python et des notions dont vous allez avoir besoin (afficher à l'écran, lire une saisie clavier, boucle, fonction, module?).

## Création du menu

Au lancement du programme, un menu s'affichera avec les options suivantes : 

1. Ajouter un nouveau citoyen
2. Obtenir les informations d'un citoyen
3. Modifier un citoyen
4. Supprimer un citoyen
5. Quitter

Exemple de menu

![ex12_01](../images/ex12_01.png){.center .shadow}


## Options du menu

### 1. Ajouter un citoyen

Demandez à l'usager les informations suivantes sur le citoyen à ajouter : 

- nom
- prénom
- no_civique
- adresse
- ville
- pin

Les champs classe_id et credit_initial seront "forcés" à respectivement 4 et 500. Une fois l'ajout fait, affichez un message de confirmation et revenez au menu principal.

![ex12_02](../images/ex12_02.png){.center .shadow}

### 2. Obtenir les informations d'un citoyen

Demandez à l'usager de saisir le id du citoyen. Affichez ensuite les informations suivantes à l'écran : 

- Prénom et nom
- Classe
- Score de crédit social

Ensuite revenez au menu principal.

![ex12_03](../images/ex12_03.png){.center .shadow}

### 3. Modifier un citoyen

Permettre en saisissant le id d'un citoyen de modifier son adresse ( no_civique, adresse, ville). Affichez un message de confirmation et revenez au menu principal.

![ex12_04](../images/ex12_04.png){.center .shadow}

### 4. Supprimer un citoyen

Supprimez un citoyen de la base de données avec son id. Attention présentement dans la base de données il n'y a aucune clés étrangères entre les tables citoyen, citoyen_evenement et evenement. On peut donc supprimer un citoyen sans supprimer les évènements auxquelles il a participé. Il faudrait s'assurer qu'en supprimant un citoyen, ses évènements soient aussi supprimé. À vous de choisir l'approche que vous voulez (le faire dans la requête suppression, supprimer en cascade depuis une clé étrangère, etc.)

![ex12_05](../images/ex12_05.png){.center .shadow}

### 5. Quitter

On quitte la boucle et le programme.

