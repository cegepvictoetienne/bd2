# Exercice 14 - qtDesigner

Vous devez créer un écran avec qtDesigner qui permettra de créer un nouvel événement dans la base de données **credit_social** et du même coup ajouter des citoyens qui étaient présent.

Voici une capture d'écran de la disposition de la fenêtre ainsi que des divers *Widgets*.

![ex14_01.png](../images/ex14_01.png){.center .shadow}

## Widgets à utiliser

- Liste des types d'événements : **QComboBox**, la liste est alimenté par le résultat d'une requête de la table evenement_type.
- Date : **QDateEdit**, pour initialiser à la date du jour : `self.inputDate.setDateTime(QDateTime.currentDateTime())`
- Notes : **QTextEdit**
- Liste des citoyens présents : **QTableWidget**, [info ici](https://www.pythontutorial.net/pyqt/pyqt-qtablewidget/){target=_blank}
- Id du citoyen et score : **QLineEdit**
- Les boutons : **QPushButton**

## Comportement

### Initialisation de la fenêtre

Au chargement de la fenêtre, remplissez la liste déroulante des types d'événements avec les types présents dans la table evenement_type. Ajouter le texte et aussi le id dans chaque item de la liste pour pouvoir utiliser le id lors de la création de l'événement.

### Ajout de citoyen

Pour ajouter un citoyen, on doit inscrire un id et optionnellement un score ajustement. Ensuite en cliquand sur le bouton *Ajouter* un requête est fait à la BD pour valider que le citoyen existe. Si oui ajoutez une ligne dans le tableau avec le id du citoyen, son nom complet ainsi que la valeur du score ajustement.

On peut aussi sélectionner un citoyen dans le tableau et cliquer sur le bouton *Supprimer* pour l'enlever de la liste. Si aucun citoyen n'est sélectionné, affichez un message d'erreur avec un **QMessageBox**.

### Création de l'événement

Quand on clique sur le bouton *Créer l'événement*, commencez par créer l'événement avec les informations du type, de la date et des notes. Ensuite, pour chaque citoyen dans le tableau, faite une entrée dans la table **citoyen_evenement**. Si le score ajustement était resté vide, insérez Null dans la table. Utilisez **None** en Python pour simuler le Null lors de l'insertion.

Finalement une fois les enregistrements faits, effacer les différents champs et réinitialisez la date à celle d'aujourd'hui.


![ex14_02.png](../images/ex14_02.png){.center .shadow}
