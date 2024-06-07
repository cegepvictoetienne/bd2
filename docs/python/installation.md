# Installation de Python

Téléchargez la dernière version de Python disponible pour votre système à cette adresse [https://www.python.org/downloads/](https://www.python.org/downloads/).

Exécutez le fichier téléchargé et au premier écran de l'installateur assurez-vous de bien cocher l'option **"Add python.exe to PATH"** dans le bas.

![py_install_01.png](../images/py_install_01.png){.center .shadow}

Ouvrez ensuite un terminal et entrez la commande suivante pour vérifier que Python est bien installé : 

## Vérifier l'installation sur Windows  
```bash
python --version
```

## Vérifier l'installation sur MacOS et Linux
```bash
python3 --version
```

## Exécuter votre premier programme Python

Pour lancer un programme Python il suffit de faire la commande `python` suivie du nom du fichier dans un terminal. Si vous codez avec vsCode je vous conseille d'installer les extensions suivantes : 

- **Python** *par Microsoft* : [https://marketplace.visualstudio.com/items?itemName=ms-python.python](https://marketplace.visualstudio.com/items?itemName=ms-python.python){target=_blank}
- **Pylance** *par Microsoft* : [https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance){target=_blank}

Créer un fichier nommé hello.py et copiez-y le code suivant : 

```python title="hello.py" linenums="1"
print("Hello")
```

Tentez de l'exécuter depuis la console et ensuite depuis vsCode en cliquant sur l'icone *Play* en haut à droite de la fenêtre du fichier.

## Supprimer Python

On peut supprimer une version de Python facilement en passant par la suppression des programmes Windows, elle va être dans la liste des programmes installés. Parcontre vous devriez aussi aller vérifier ensuite dans les variables d'environnement car Python y ajoute des références qui ne sont pas toujours supprimées.