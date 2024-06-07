# MySQL Connector pour Python

Le MySQL Connector permet de communiquer avec des bases de données MySQL à partir de programmes Python. Voici comment l'utiliser.

## Installation

Ouvrez votre terminal et installez MySQL Connector avec la commande suivante :

```bash
pip install mysql-connector-python
```

## Utilisation

Pour utiliser MySQL Connector, suivez ces étapes :

1. **Importation** : Importez la librairie MySQL Connector.
2. **Connexion** : Établissez une connexion avec la base de données.
3. **Curseur** : Créez un curseur pour exécuter les requêtes.
4. **Fermeture** : Fermez le curseur et la connexion après l'utilisation.

### Exemple de Requête SELECT

Voici un exemple simple qui effectue une requête SELECT et affiche les résultats :

```python title="select_exemple.py"
import mysql.connector

# Connexion à la base de données
cnx = mysql.connector.connect(user='root', password='********', host='localhost', database='bd2_ex10')

# Création du curseur avec des résultats nommés
cursor = cnx.cursor(dictionary=True)

# Exécution de la requête
query = "SELECT nom FROM houblons ORDER BY nom;"
cursor.execute(query)

# Affichage des résultats
for ligne in cursor:
    print(ligne["nom"])

# Fermeture du curseur et de la connexion
cursor.close()
cnx.close()
```

**Note** : Pour les requêtes modifiant les données (INSERT, UPDATE, DELETE), il est nécessaire de valider les changements avec `commit()`.

### Exemple de Suppression avec Gestion d'Erreurs

Voici comment supprimer un élément tout en gérant les erreurs potentielles :

```python title="delete_exemple.py"
import mysql.connector

houblon_id = 1

try:
    connexion = mysql.connector.connect(user='root', password='r00t_bd2', host='localhost', database='bd2_ex10')
    cursor = connexion.cursor()

    # Exécution de la requête avec paramètres
    requete = "DELETE FROM houblons WHERE id = %(houblon_id)s"
    parametres = {'houblon_id': houblon_id}
    cursor.execute(requete, parametres)
    connexion.commit()

except mysql.connector.Error as erreur:
    print(erreur)
finally:
    if cursor:
        cursor.close()
    if connexion:
        connexion.close()
```

## Documentation

- [Documentation officielle](https://dev.mysql.com/doc/connector-python/en/)
- [Documentation sur W3Schools](https://www.w3schools.com/python/python_mysql_getstarted.asp)
