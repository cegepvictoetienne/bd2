# MySQL Connector pour python

Pour nous permettre de communiquer avec notre base de données MySQL depuis nos programmes Python on va utiliser la librairie MySQL Connector.

## Installation

En ligne de commande 

``````
pip install mysql-connector-python
``````

## Utilisation

Premièrement on doit importer la librairie MySQL Connector. Ensuite on crée une connexion vers la base de données dans laquelle on veut travailler. On va aussi déclarer un curseur qui va s'occuper d'exécuter les requêtes. Finalement on doit refermer le curseur et la connexion à la base de données. 

Voici un petit exemple de programme Python qui exécute une requête SELECT et qui affiche ensuite à la console le résultat obtenue.

```python title="select_exemple.py" linenums="1" hl_lines="5-9 14 20 27-28"
# Importation de la librairie mysql.connector
import mysql.connector

# Création de la connexion à la base de données
cnx = mysql.connector.connect(
    user='root', 
    password='********',
    host='localhost',
    database='bd2_ex10')

# Création du curseur
# Le paramêtre dictionary=True permet de faire 
# référence aux champs du résultat par leur nom
cursor = cnx.cursor(dictionary=True)

# Stockage de la requête dans une variable
query = "SELECT nom FROM houblon h ORDER BY nom;"

# Exécution de la requête
cursor.execute(query)

# Affichage des résultats
for (ligne) in cursor:
    print(ligne["nom"])

# Fermeture du curseur et de la connexion
cursor.close()
cnx.close()
```

Le résultat contenu dans le curseur est un tableau de toutes les lignes du résultat dont chaque élément est aussi un tableau qui contient chaque colonne de la ligne. Dans l'exemple plus haut chaque élément du tableau est un tableau d'un item, la colonne nom.

!!! note

    Quand vous exécutez une requête INSERT, UPDATE ou DELETE vous devez faire un commit pour que les modifications soit sauvegardées. Utilisez la fontion **commit()** de votre objet connexion.

Voici un autre exemple qui supprime un élément d'une table. Dans cet exemple on voit comment passer des paramètres à la requête et faire une gestion d'erreurs avec un **try ... catch**.

```python title="delete_exemple.py" linenums="1" hl_lines="20"
import mysql.connector

houlon_id = 1;

houblonDelete = False
requete = "DELETE FROM houblon WHERE id = %(houblon_id)s"
parametres = {'houblon_id' : houlon_id}

try:
    connexion = mysql.connector.connect(
      user='root', 
      password='r00t_bd2',
      host='localhost',
      database='bd2_ex10')
    cursor = connexion.cursor()

    # Exécution de la requête avec passage de paramètres
    cursor.execute(requete, parametres)
    # Validation de la transaction
    connexion.commit()
    
    houblonDelete = True
except mysql.Error as erreur:
    print(erreur)
finally:
    cursor.close()
    connexion.close()
```


## Documentation

- [Documentation officielle](https://dev.mysql.com/doc/connector-python/en/){target=_blank}
- [Documentation sur W3Schools](https://www.w3schools.com/python/python_mysql_getstarted.asp){target=_blank}
