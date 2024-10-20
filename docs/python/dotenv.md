# Utilisation de dotenv en Python pour sécuriser les informations de connexion à MySQL

Voici comment utiliser le module python-dotenv en Python pour stocker de manière sécuritaire les informations de connexion à une base de données MySQL. Le module python-dotenv permet de charger les variables d’environnement à partir d’un fichier .env, ce qui vous permet de garder vos informations de configuration séparées de votre code.

## Pourquoi utiliser dotenv ?

Lors du développement d’applications, il est crucial de ne pas exposer les informations sensibles (comme les identifiants de connexion à une base de données) dans le code source, surtout si celui-ci est partagé sur des plateformes publiques comme GitHub. Le module `python-dotenv` permet de charger les variables d’environnement à partir d’un fichier `.env`, vous permettant ainsi de garder vos informations de configuration séparées de votre code.

## Étapes pour utiliser dotenv

1. Installation du module python-dotenv

    Pour commencer, vous devez installer le module python-dotenv. Vous pouvez l’installer en utilisant pip :

    ```bash
    pip install python-dotenv
    ```

2. Création du fichier .env

    Créez un fichier nommé .env à la racine de votre projet. Ce fichier contiendra vos variables d’environnement, telles que les informations de connexion à la base de données.

    Exemple de contenu du fichier `.env` :

    ```plaintext
    DB_HOST=localhost
    DB_USER=mon_utilisateur
    DB_PASSWORD=mon_mot_de_passe
    DB_NAME=nom_de_ma_base
    DB_PORT=3306
    ```

    Attention : Ne partagez jamais ce fichier publiquement, car il contient des informations sensibles.

3. Chargement des variables d’environnement dans votre script Python

    Dans votre script Python, vous devez importer le module dotenv et charger les variables d’environnement à partir du fichier `.env`.

    Exemple :

    ```python
    import os
    from dotenv import load_dotenv
   

    # Charge les variables d'environnement à partir du fichier .env
    load_dotenv()

    # Récupère les variables d'environnement
    db_host = os.getenv('DB_HOST')
    db_user = os.getenv('DB_USER')
    db_password = os.getenv('DB_PASSWORD')
    db_name = os.getenv('DB_NAME')
    db_port = os.getenv('DB_PORT')
    ```
4. Connexion à la base de données MySQL

    Utilisez les variables d’environnement pour établir une connexion à la base de données MySQL. Voici un exemple avec le module mysql.connector :

    ```python
    import mysql.connector

    # Établir la connexion à la base de données
    connexion = mysql.connector.connect(
        host=db_host,
        user=db_user,
        password=db_password,
        database=db_name,
        port=db_port
    )

    # Vérifier si la connexion est établie
    if connexion.is_connected():
        print("Connexion réussie à la base de données")
    else:
        print("Échec de la connexion à la base de données")
    ```

## Ajout du fichier .env à .gitignore

Pour éviter que le fichier .env ne soit suivi par Git et ne se retrouve sur GitHub, vous devez l’ajouter au fichier `.gitignore`.

1. Création ou modification du fichier `.gitignore`

    Si vous n’avez pas de fichier `.gitignore` à la racine de votre projet, créez-en un. Sinon, ouvrez le fichier existant.

2. Ajout de `.env` au fichier `.gitignore`

    Ajoutez la ligne suivante au fichier `.gitignore` :
    
    ```plaintext
    .env
    ```

    Cela indique à Git d’ignorer le fichier .env lors des opérations de suivi et de commit.

3. Retrait du fichier `.env` du suivi Git (si nécessaire)

    Si vous avez déjà commité le fichier .env, vous devez le retirer du suivi Git :

    ```bash
    git rm --cached .env
    git commit -m "Retrait du fichier .env du suivi Git"
    ```

# Bonnes pratiques

- Ne partagez jamais vos informations sensibles : Assurez-vous que le fichier .env n’est pas partagé ou commité dans un dépôt public.  
- Utilisez des variables d’environnement pour toutes les configurations sensibles : Pas seulement pour la base de données, mais aussi pour les clés API, les jetons d’authentification, etc.  
- Créez un fichier `.env.example` : Fournissez un exemple de fichier `.env` sans les valeurs sensibles pour que d’autres développeurs sachent quelles variables d’environnement sont nécessaires.  

Exemple de fichier `.env.example` :

```plaintext  
DB_HOST=  
DB_USER=  
DB_PASSWORD=  
DB_NAME=  
DB_PORT=  
```

# Conclusion

L’utilisation de dotenv en Python est une pratique essentielle pour sécuriser les informations sensibles de votre application. En chargeant les variables d’environnement depuis un fichier `.env` et en vous assurant que ce fichier n’est pas suivi par Git, vous protégez vos données tout en gardant votre code propre et modulaire.
