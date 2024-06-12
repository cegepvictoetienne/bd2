# Utilisation de Flask pour afficher les données d'une base de données MySQL

## Objectifs

À la fin de cette leçon, vous serez capables de :
- Configurer un environnement de développement Flask.
- Connecter une application Flask à une base de données MySQL.
- Récupérer des données depuis MySQL et les afficher sur une page web.

## Installation des paquets nécessaires

Commencez par installer Flask et un connecteur MySQL pour Python. Ouvrez votre terminal et exécutez :

```bash
pip install flask mysql-connector-python
```

## Configuration de votre application Flask

Créez un nouveau dossier pour votre projet et à l'intérieur, créez un fichier appelé `app.py`. Ajoutez le code suivant pour configurer votre application :

```python
from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# Configuration de la connexion à la base de données
db = mysql.connector.connect(
    host="localhost",
    user="votre_user",
    passwd="votre_mot_de_passe",
    database="nom_de_la_base_de_donnees"
)

@app.route('/')
def index():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM votre_table")
    data = cursor.fetchall()
    cursor.close()
    return render_template('index.html', data=data)

if __name__ == '__main__':
    app.run(debug=True)
```

## Création du template HTML

Dans le même dossier que `app.py`, créez un dossier `templates`. À l'intérieur, créez un fichier `index.html`. Ajoutez le code HTML suivant pour afficher les données :

```html
<!DOCTYPE html>
<html>
<head>
    <title>Page de données</title>
</head>
<body>
    <h1>Données de la Base</h1>
    <ul>
        {% for row in data %}
        <li>{{ row }}</li>
        {% endfor %}
    </ul>
</body>
</html>
```

## Exécution de l'application

Pour exécuter votre application, retournez à votre terminal et lancez :

```bash
python app.py
```

Ouvrez votre navigateur et allez à `http://127.0.0.1:5000/`. Vous devriez voir les données extraites de votre base de données MySQL affichées sur la page.

## Conclusion

Vous avez maintenant une application Flask simple qui peut récupérer des données d'une base de données MySQL et les afficher sur une page web. Ce projet peut être étendu pour inclure des fonctionnalités plus complexes comme des formulaires pour insérer ou modifier les données.