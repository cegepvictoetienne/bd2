# Procédures stockées

Une procédure stockée nous permet d'enregistrer sur le serveur MySQL une série d'instructions qu'on pourra réutiliser à notre guise. À la différence de la fonction, la procédure stockée peut retourner un jeu de résultat.

# Création d'une procédure

```sql
DELIMITER $$

CREATE PROCEDURE nom_procedure()
BEGIN
  traitement
END $$

DELIMITER ;
```

# Paramètres

- Les paramètres sont définis par un nom, un type de données et un indicateur IN, OUT ou INOUT.
- IN indique que le paramêtre est en entrée, OUT en sortie et INOUT pour les deux. La valeur d'un paramêtre IN est "passée" dans la fonction et utilisée dans celle-ci. 
- Pour un paramêtre OUT on peut récupérer sa valeur à la sortie de la fonction. Ce n'est pas la même valeur que le retour de la fonction, on peut donc s'en servir pour retourner plus d'une valeur à la fonction. 
- INOUT permet les deux. Par défaut et si on ne l'indique pas le paramêtre sera IN.
- Chaque paramêtre est séparé par une virgule.

# Le traitement

- La procédure n'est pas tenue de retourner une valeur. On pourrait par exemple faire une procédure qui supprimerait les enregistrements d'une table selon certain critères.
- Par contre il est préférable de toujours retourner une valeur, comme un indicateur de succès pour l'exemple précédent.
- On peut utiliser des HANDLERs dans une procédure pour controller le traitement.

# Utilisation de variables

Les variables sont déclarées de la façon suivante :

```sql
DECLARE nom_variable type_de_donnee [DEFAULT valeur_default]
``` 

La section DEFAULT est optionnelle et sert à assigner une valeur par défaut à la variable.

```sql
DECLARE prenom VARCHAR(50) DEFAULT 'Mathieu';
```

On peut ensuite assigner une valeur à la variable avec SET ou un SELECT ... INTO ma_variable FROM .... Si on utilise le Select le résultat doit être une valeur unique.

```sql
SET prenom = "Alexandre";

SELECT u.prenom 
INTO prenom
FROM usager u
WHERE u.id = 1234;
```

# Suppression d'une procedure

```sql
DROP PROCEDURE [IF EXISTS] nom_procedure;
```

Ressources

- [Documentation officielle](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)  
- [MySQL Tutorial](https://www.mysqltutorial.org/mysql-stored-procedure-tutorial.aspx)
