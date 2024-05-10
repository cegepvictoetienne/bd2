# Gestion des erreurs

La gestion des erreurs dans les scripts SQL, les procédures stockées, ou les déclencheurs est cruciale pour maintenir l'intégrité de la base de données et assurer un traitement approprié des données. On utilise des gestionnaires d'erreurs (HANDLERs) pour intercepter les erreurs, et la commande `SIGNAL` pour générer des erreurs personnalisées.

## HANDLER

Un handler permet de gérer les erreurs ou conditions spécifiques qui surviennent dans un bloc SQL. 

### Syntaxe

```sql
DECLARE handler_action HANDLER FOR condition_value statement;
```

- **handler_action** : Définit si l'exécution doit continuer (`CONTINUE`) ou se terminer (`EXIT`) après l'interception de l'erreur.
- **condition_value** : Spécifie l'erreur à intercepter. Peut être un `mysql_error_code`, un `SQLSTATE value`, ou une condition nommée préalablement définie.

#### Exemples de conditions
- `mysql_error_code` : Code d'erreur MySQL spécifique.
- `SQLSTATE value` : Code d'état SQL à cinq caractères.
- `condition_name` : Nom de condition associé à un code d'erreur ou d'état.
- `SQLWARNINGS` : Pour les avertissements SQLSTATE commençant par '01'.
- `NOT FOUND` : Utilisé pour gérer les situations où une requête ne retourne pas de résultat.
- `SQLEXCEPTION` : Pour les erreurs SQLSTATE ne commençant pas par '00', '01', ou '02'.

### Exemple d'utilisation

```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'Une erreur est survenue, les opérations ont été annulées.';
END;
```

## SIGNAL

`SIGNAL` est utilisé pour générer une erreur ou un état qui interrompt l'exécution du script.

### Syntaxe

```sql
SIGNAL SQLSTATE VALUE 'erreur_code' SET signal_information_item = value;
```

- **SQLSTATE** : Utilisé généralement avec '45000' pour indiquer une erreur définie par l'utilisateur.
- **signal_information_item** : Permet de définir des informations supplémentaires sur l'erreur, comme `MESSAGE_TEXT`.

### Exemple

```sql
IF (nombre < 0) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La valeur doit être supérieure à 0';
END IF;
```

## Intégration avec des Handlers

Combinez `SIGNAL` et `HANDLER` pour gérer finement les erreurs dans vos procédures :

### Exemple avec Handler

```sql
CREATE PROCEDURE exemplebd.test_error(nombre INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLSTATE '45000'
    BEGIN
        SELECT 'La valeur doit être supérieure à 0' AS message_erreur;
    END;

    IF (nombre < 0) THEN
        SIGNAL SQLSTATE '45000';
    END IF;

    SELECT nombre;
END;
```

## Gestion d'erreurs dans les applications clientes

Les erreurs générées par `SIGNAL` peuvent être capturées et gérées dans les applications clientes, comme avec Python en utilisant MySQL Connector :

```python
import mysql.connector as mysql

def TestError():
    try:
        connection = mysql.connect(**db_config)
        cursor = connection.cursor()
        cursor.callproc('test_error', [-2])
        for result in cursor.stored_results():
            print(result.fetchall())
    except mysql.Error as err:
        print('Erreur interceptée:', err.msg)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

TestError()
```


# Source

- [https://dev.mysql.com/doc/refman/8.0/en/declare-handler.html](https://dev.mysql.com/doc/refman/8.0/en/declare-handler.html)  
- [https://dev.mysql.com/doc/refman/8.0/en/signal.html](https://dev.mysql.com/doc/refman/8.0/en/signal.html)  
- [https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/](https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/)