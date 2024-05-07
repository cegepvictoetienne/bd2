# Qt Designer

Qt Designer est un éditeur graphique qui nous permet de créer visuellement des interfaces graphiques en pyQt. Les interfaces seront ensuite exporté en fichier python que nous pourront utiliser dans nos programme.

## Installation

Directement en ligne de commande

``````bash
pip install pip install PyQt5Designer
``````

Ou bien depuis le site officiel : [https://www.qt.io/download-qt-installer](https://www.qt.io/download-qt-installer){target=_blank}, vous allez devoir vous créer un compte pour l'installation.

## Lancer Qt Designer

En ligne de commande, utilisez la commande designer

``````bash
designer
``````

## Convertir un fichier ui en python

Les interfaces que vous allez créer avec Qt Designer seront enregistrées dans des fichiers avec l'extension **ui**. Pour les utiliser dans vos programme python on va devoir les convertir. On peut le faire directement en ligne de commande et utilisant la commande **pyuic5** suivi du **nom du fichier source**, de l'argument **-o** et du **nom du fichier de destination**. Le fichier de destination n'est pas obligé d'exister au moment d'exécuter la commande mais il doit porter l'extension py.

``````bash
pyuic5 masuperfenetre.ui -o MaSuperFenetre.py
``````

## Exemple

Au démarrage de l'application Qt Designer la fenêtre nouveau formulaire va s'afficher. Sélectionnez **Main Window** dans la section **templates\forms** et cliquez sur créer.

![qtdesigner_01](../images/qtdesigner_01.png){.center .shadow}

Une fenêtre vide va être créé avec une barre de menu dans le haut et une barre de statut dans le bas. Enregistrez cette fenêtre dans le répertoire de votre application. (Dans mon exemple j'ai nommé mon fichier exemple.ui). Vous voilà prêt à créer votre interface. On créer une interface où on pourra saisir un id et en cliquant sur un bouton de l'information va s'afficher à l'écran.

![qtdesigner_02](../images/qtdesigner_02.png){.center .shadow}

Commencez par supprimer le menu et la barre de statut. Dans l'inspecteur d'objet sélectionnez menubar et statusbar et avec un clique droit choisissez supprimer.

![qtdesigner_03](../images/qtdesigner_03.png){.center .shadow}

Dans la section de gauche vous avez une liste de widgets à utiliser. Glissez un **Vertical Layout** dans la fenêtre principale. Cliquez ensuite sur la fenêtre principale à l'extérieur du widget que vous venez d'ajouter et dans la barre de menu du haut de l'éditeur cliquez sur le bouton mettre en forme verticalement. Le widget **Vertical Layout** devrait s'étendre à la totalité de la fenêtre.

![qtdesigner_04](../images/qtdesigner_04.png){.center .shadow}

Ensuite dans l'ordre on va ajouter un **Label**, un **Line Edit**, un **Push Button** et un autre **Label**.

![qtdesigner_05](../images/qtdesigner_05.png){.center .shadow}

En sélectionnant chaque widget, modifiez la propriété **objectName** dans l'éditeur de propriétés. Je n'ai pas renommé le premier label, mais pour les suivants j'ai utilisé les noms suivants : 

- Line Edit = editCitoyenId
- Push Button = btnRechercher
- Label = lblResultat

![qtdesigner_06](../images/qtdesigner_06.png){.center .shadow}

Vous pouvez modifier le texte affiché sur un widget avec la propriété **text**. Vous pouvez ajuter le format du texte avec plusieurs propriétés, dont **font** et **alignment**.

![qtdesigner_07](../images/qtdesigner_07.png){.center .shadow}

 Dernière chose, on va associer une fonction à un événement, ici un clique de la souris sur le bouton. On peut le faire depuis l'interface de Qt Designer ou dans notre script python. Pour le faire depuis Qt Designer, dans le menu principal, sous **Édition** sélectionnez **Éditer signaux/slots**. Ensuite cliquez sur le bouton et sans relâcher le bouton glisser la souris vers la fenêtre principale (attention on cible la fenêtre principale et non le widget **layout**). Vous devriez avoir une ligne rouge avec à son bout une flèche composée de barre rouge. Relâcher maintenant le bouton de la souris et la fenêtre **Configurer connexion** va s'afficher.

![qtdesigner_08](../images/qtdesigner_08.png){.center .shadow}

Sélectionnez **clicked()** et cliquez sur **Éditer**. Dans la fenêtre qui va apparaître cliquez sur le bouton avec une croix verte dans la section **Slots**. Modifier ensuite le nom de la fonction (slot1() par défaut) pour le nom que vous allez donner à votre fonction. Cliquez ensuite sur ok. Dans la fenêtre précédente vous avez maintenant votre fonction dans la section de droite, sélectionnez la et cliquez sur ok.

![qtdesigner_09](../images/qtdesigner_09.png){.center .shadow}

![qtdesigner_10](../images/qtdesigner_10.png){.center .shadow}

Pour connecter un événement depuis le script python, voir plus bas dans l'exemble du fichier **app.py**.

Voila le travail pour notre interface vous pouvez sauvegarder le tout et ouvrir un terminal dans le répertoire où le fichier se trouve.  Utilisez la commande qu'on a vu plus haut pour convertir le fichier **ui** et fichier python.

``````bash
pyuic5 exemple.ui -o demo.py
``````

Si on regarde dans le fichier python qu'on a créé on peut voir qu'il y a une classe ==Ui_MainWindow== qui contient notre interface. Maintenant on va créer un fichier python qui va être le script principal et où on va appeler cette classe et l'afficher.

``````python title="app.py" linenums="1" hl_lines="4 8 12 18"
import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
# Importer la classe Ui_MainWindow du fichier demo.py
from demo import Ui_MainWindow

# En paramêtre de la classe MainWindow on va hériter des fonctionnalités
# de QMainWindow et de notre interface Ui_MainWindow
class MainWindow(QMainWindow, Ui_MainWindow):
    def __init__(self, *args, obj=None, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)
        # On va créer la fenêtre avec cette commande
        self.setupUi(self)
        # On a accès à tous les éléments de notre interface
        # Par exemple ici on branche une fonction à l'appui sur le bouton
        self.editCitoyenId.returnPressed.connect(self.test)

    # On défini la fonction qu'on avait déclaré pour le clique sur le bouton 
    # dans qtDesigner
    def rechercherCitoyen(self):
        # On récupère la valeur du line edit
        citoyen_id = self.editCitoyenId.text()
        # Ensuite on pourrait lancer une fonction qui interroge la BD
        # Pour l'exemple on va simplement afficher la valeur dans le label 
        # lblResultat
        self.lblResultat.setText(citoyen_id)
        # editCitoyenId et lblResultat sont les noms qu'on a donné au widget
        # dans l'éditeur Qt Designer

    def test(self):
        self.lblResultat.setText('Tu as appuyé sur Enter')

app = QApplication(sys.argv)

window = MainWindow()
window.show()
app.exec()
``````

Finalement exécutez le script app.py pour afficher le résultat.

![qtdesigner_11](../images/qtdesigner_11.png){.center .shadow}



## Ressources

- [https://realpython.com/qt-designer-python/](https://realpython.com/qt-designer-python/)
- [https://www.pythonguis.com/tutorials/qt-designer-gui-layout/](https://www.pythonguis.com/tutorials/qt-designer-gui-layout/)
- [https://doc.qt.io/qt-5/qtdesigner-manual.html](https://doc.qt.io/qt-5/qtdesigner-manual.html)



