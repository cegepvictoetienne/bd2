# Documentation de code en Python avec Docstrings et Pydoc

## Objectifs de la leçon
- Comprendre l'importance de la documentation du code.
- Apprendre à utiliser les docstrings pour documenter les fonctions et méthodes en Python.
- Utiliser `pydoc` pour générer de la documentation automatiquement.

## 1. Introduction à la documentation du code

### Pourquoi documenter le code ?
La documentation du code est cruciale pour plusieurs raisons :
- Facilite la compréhension du code par d'autres développeurs (ou par vous-même plus tard).
- Améliore la maintenabilité du code.
- Permet de générer automatiquement des documents expliquant l'utilisation et le fonctionnement du code.

## 2. Utilisation des docstrings en Python

### Qu'est-ce qu'une docstring ?
Une docstring (ou chaîne de documentation) est un littéral de chaîne qui apparaît juste après la définition d'une fonction, méthode, classe ou module. Elle est utilisée pour documenter l'objet.

### Syntaxe des docstrings
Les docstrings en Python sont entourées de triples guillemets (`"""` ou `'''`). Elles peuvent être simples ou multi-lignes.

#### Exemple de docstring pour une fonction

```python
def ajouter(a, b):
    """
    Ajoute deux nombres.

    Paramètres:
        a (int): Le premier nombre.
        b (int): Le deuxième nombre.

    Retourne:
        int: La somme des deux nombres.
    """
    return a + b
```

### Exemple de docstring pour une classe et ses méthodes

```python
class Voiture:
    """
    Représente une voiture.

    Attributes:
        marque (str): La marque de la voiture.
        modèle (str): Le modèle de la voiture.
        année (int): L'année de fabrication de la voiture.
    """

    def __init__(self, marque, modèle, année):
        """
        Initialise une nouvelle voiture.

        Args:
            marque (str): La marque de la voiture.
            modèle (str): Le modèle de la voiture.
            année (int): L'année de fabrication de la voiture.
        """
        self.marque = marque
        self.modèle = modèle
        self.année = année

    def démarrer(self):
        """
        Démarre la voiture.
        """
        print(f"{self.marque} {self.modèle} démarre.")

    def arrêter(self):
        """
        Arrête la voiture.
        """
        print(f"{self.marque} {self.modèle} s'arrête.")
```

## 3. Génération de documentation avec Pydoc

### Qu'est-ce que Pydoc ?
Pydoc est un module intégré de Python qui génère de la documentation en lisant les docstrings du code. Il peut afficher cette documentation dans le terminal ou générer des pages HTML.

### Utilisation de Pydoc

#### Afficher la documentation dans le terminal

Pour afficher la documentation d'un module, d'une classe ou d'une fonction dans le terminal, utilisez la commande suivante :

```bash
pydoc nom_du_module
```

#### Exemple

Si nous avons un fichier `voiture.py` contenant notre classe `Voiture`, nous pouvons afficher sa documentation avec :

```bash
pydoc voiture
```

#### Générer de la documentation HTML

Pour générer de la documentation HTML pour un module, utilisez la commande suivante :

```bash
pydoc -w nom_du_module
```

Cela créera un fichier `nom_du_module.html` contenant la documentation.

#### Exemple

Pour générer la documentation HTML pour le module `voiture.py`, utilisez :

```bash
pydoc -w voiture
```

## 4. Conclusion

Documenter votre code est une pratique essentielle pour tout développeur. En utilisant les docstrings et `pydoc`, vous pouvez créer une documentation claire et accessible pour vos projets Python. Assurez-vous de toujours documenter vos fonctions, méthodes, et classes pour faciliter le travail de tous ceux qui liront ou maintiendront votre code.