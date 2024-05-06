# Gestion des erreurs

Pour intercepter les erreurs dans un script, une procédure stockée ou un déclencheur, on va utiliser des handlers. On peut aussi générer une erreur avec la commande SIGNAL.

# HANDLER

La syntaxe de déclaration d'un handler est la suivante :
```sql
DECLARE handler_action HANDLER FOR condition_value statement;
handler_action
```

De quelle façon l'exécution des instructions va être affectée lorsque l'erreur survient.

- CONTINUE : L'exécution des instructions va se continuer.
- EXIT : L'exécution des instructions comprisent à l'intérieur du bloc BEGIN ... END d'où l'erreur est survenue se termine.

condition_value

Quelle est l'erreur qu'on veut intercepter avec le handler

mysql_error_code : Un code d'erreur MySQL. En voici la liste [ici](https://dev.mysql.com/doc/refman/8.0/en/server-error-reference.html)  

SQLSTATE [VALUE] : Où VALUE représente un code de 5 caractère qui représente un code d'état MySQL. Très similaire à mysql_error_code. Vous pouvez consulter la liste [ici](https://dev.mysql.com/doc/refman/8.0/en/server-error-reference.html)  

condition_name : On peut définir un nom de condition qui est associé à un code d'erreur ou d'état et l'utiliser ensuite dans le handler.

```sql
DECLARE no_such_table CONDITION FOR 1051;
DECLARE CONTINUE HANDLER FOR no_such_table
  BEGIN
    -- body of handler
  END;
```

SQLWARNINGS : Un raccourci pour les code d'état SQLSTATE qui commence par 01, le plus souvent des messages d'avertissements

NOT FOUND: On l'a vue dans notre utilisation des cursors. Se déclenche quand le curseur arrive à la fin de ses résultats

SQLEXCEPTION: Un raccourci pour les code d'état SQLSTATE qui ne commence pas par 00, 01 ou 02.

## Exemple

Quand ma procédure stockée provoque une erreur, je veux annuler les opérations déjà effectuées et quitter le traitement en affichant un message d'erreur. On va utiliser ROLLBACK pour annuler les opérations et SELECT avec notre message d'erreur.

```sql
CREATE PROCEDURE exemplebd.test_error(valeur INT)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Une erreur est survenue, les opérations ont été annulées.';
    END;

    START TRANSACTION;

    ...

    COMMIT;
END
```

# SIGNAL

Avec SIGNAL on va pouvoir géréner une erreur qui va stopper l'éxécution du script. On peut aussi jumeler SIGNAL avec un HANDLER

La syntaxe de déclaration de SIGNAL est la suivante :

```sql
SIGNAL condition_value SET signal_information_item;
```

## condition_value

Comme pour le HANDLER, on va utiliser un SQLSTATE ou une condition qu'on aura défini auparavant. Le plus souvent on va utiliser SQLSTATE = '45000' qui indique une erreur définie par l'utilisateur.

## signal_information_item

On peut ensuite définir des valeurs à des variables prédéfinis associés à SIGNAL. Une de cess variables est MESSAGE_TEXT qui nous permet de retourner un message d'erreur. La liste complête est ici.

## Exemple

Dans une procédure je veux arrêter l'éxécution si la valeur de la variable nombre est inférieur à 0

```sql
CREATE PROCEDURE exemplebd.test_error(nombre INT)
BEGIN
    IF (nombre < 0) THEN
        SIGNAL SQLSTATE SET MESSAGE_TEXT = "La valeur doit être supérieure à 0";
    END IF;

    SELECT nombre;

END
```

### résultat 

```terminal
mysql> CALL test_error(-2);
ERROR 1644 (45000): La valeur doit être supérieure à 0
```

Le même exemple avec un HANDLER.

```sql
CREATE PROCEDURE exemplebd.test_error(nombre INT)
BEGIN

    DECLARE EXIT HANDLER FOR SQLSTATE '45000' 
    BEGIN 
        SELECT "La valeur doit être supérieure à 0" AS message_erreur;
    END;

    IF (nombre < 0) THEN
        SIGNAL SQLSTATE '45000';
    END IF;

    SELECT nombre;

END
```

### résultat

```terminal
mysql> CALL test_error(-2);
+------------------------------------+
| message_erreur                     |
+------------------------------------+
| La valeur doit être supérieure à 0 |
+------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
```

L'avantage d'utiliser le handler est qu'on pourrait éxécuter un traitement lors de l'erreur alors qu'avec signal on ne peut pas. La méthode pour récupérer l'erreur dans notre code ne sera pas la même selon ce qu'on utilise.

Avec le handler, c'est selon le traitement utilisé. Dans notre exemple plus haut, quand on lance la procédure on s'attend à recevoir un résultat de requête. Si une erreur est retournée, on pourrait vérifier qu'il y a un champ message_erreur dans le résultat et l'afficher.

Avec signal uniquement, on va devoir récupérer l'exception avec un try .. catch. 

Voici un exemple en Python avec MySQL Connector

```python
def TestError():

    result = []
    try:
        connection = mysql.connect(**db_config)
        cursor = connection.cursor()
        cursor.callproc('test_error', (12,))
        for result in cursor.stored_results():
            # Si j'utilise un handler avec le signal
            # mon message d'erreur se retrouvera ici
            print(result.fetchall())

    except mysql.Error as erreur:
        # Le message d'erreur avec signal est ici
        print(erreur.msg)
    finally:
        cursor.close()
        connection.close()
```

# Source

- [https://dev.mysql.com/doc/refman/8.0/en/declare-handler.html](https://dev.mysql.com/doc/refman/8.0/en/declare-handler.html)  
- [https://dev.mysql.com/doc/refman/8.0/en/signal.html](https://dev.mysql.com/doc/refman/8.0/en/signal.html)  
- [https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/](https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/)