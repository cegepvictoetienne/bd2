# Fonctions 

Qu'est-ce qu'une fonction ?

* Traitement regroupé dans une structure. Peut accepter des valeurs et les transformer pour retourner un résultat.
  
Particularité en SQL :

* Le type de retour **VOID** n'existe pas. Toutes les fonctions retournent un résultat.

## Types de fonction

Plusieurs types de caractéristiques de fonctions existent dans MySQL. On en distingue principalement 2 :

- Caractère déterministe  
- Contenu de la fonction (Type de requête qu'elle contient)  

## Caractère déterministe

Indique si la valeur de retour est déterminée seulement selon les paramètres ou non.

2 valeurs possibles :

- DETERMINISTIC  
- NOT DETERMINISTIC (NOW, RAND...)  

## Contenu

4 valeurs représentent le contenu d’une fonction :

**NO SQL** : ne contient pas d’instruction SQL  
**CONTAINS SQL** : contient des instructions SQL  
**READS SQL DATA** : contient une opération *SELECT*  
**MODIFIES SQL DATA** : contient une opération *INSERT*, *UPDATE* ou *DELETE*  

On indique toujours une seule caractéristique de contenu. (*MODIFIES* implique *READS*). 

## Exigence minimale

Dans vos fonctions, vous devez préciser explicitement au moins une caractéristique de déterministe ou de contenu.

**Pour le cours, il faut préciser les deux caractéristiques en tout temps**

*Par défaut* :  
Déterminisme : **NOT DETERMINISTIC**  
Valeur : **CONTAINS SQL**  

Vous pouvez en préciser une de chaque type.

## Cas des fonctions non déterministe

*ERREUR 1418* : This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable).

Pour éviter cette erreur, on peut exécuter la ligne suivante AVANT de créer la fonction :

```sql
SET GLOBAL log_bin_trust_function_creators = 1;
```

Référence : https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i

## Déclarer une fonction

```sql
DELIMITER $$

CREATE FUNCTION nom_fonction() RETURNS TYPE CARACTERISTIQUE_1 CARACTERISTIQUE_2
BEGIN	
  ...
  RETURN VALEUR;
END $$

DELIMITER ;
```

## Exemple de fonction déterministe

Fonction qui retourne le produit de deux entiers.

```sql
DELIMITER $$

CREATE FUNCTION multiplier(_val1 INT, _val2 INT) RETURNS INT DETERMINISTIC NO SQL
BEGIN   
  RETURN _val1 * _val2;
END $$

DELIMITER ;
```
Pour exécuter la fonction

```sql
SELECT multiplier(2, 3);
```

## Exemple de fonction non déterministe

Fonction qui retourne le nombre d’enregistrements de la table **etudiants**.

```sql
DELIMITER $$

CREATE FUNCTION nombre_etudiants() RETURNS INTEGER NOT DETERMINISTIC READS SQL DATA
BEGIN		
  DECLARE _nombre INT;    
  SET _nombre = (SELECT count(*) FROM etudiants);	
  RETURN _nombre;
END $$

DELIMITER ;
```

Pour exécuter la fonction

```sql
SELECT nombre_etudiants();
```

## Ajouter des paramètres

On précise les paramètres entre les parenthèses en utilisant la syntaxe 
```
nom_parametre TYPE
```

## Exemple de fonction

La fonction ajoute 1 à son argument.

```sql
DELIMITER $$

CREATE FUNCTION plus_un(_nombre INTEGER) RETURNS INTEGER DETERMINISTIC CONTAINS SQL
BEGIN		
  RETURN _nombre + 1;
END $$

DELIMITER ;
```

## Supprimer une fonction

L’instruction pour retirer une fonction est :

```mysql
DROP FUNCTION nom_fonction;
```

## Documenter une fonction

Pour documenter une fonction, on utilise un commentaire de style JavaDOC

```
/**
 * Description de la fonction
 *
 * @param _nom_parametre Description
 * @param _nom_parametre Description
 * @return Description de la valeur retournée
 */
```

## :material-cog: --- Exercice 1 ---

A. Faites une fonction qui retourne la somme de deux entiers.

B. Faites une fonction qui calcule la factorielle d’un entier.
 
 Rappel :

  6! = 6 x 5 x 4 x 3 x 2 x 1 x 1  
  0! = 1

C. Retournez le nombre d’étudiants inscrit dans un groupe dont vous connaissez la session (semestre et annee), le cours (sigle) et le numéro du groupe.

Effectuez cet exerice de deux façons : sans utiliser de jointure et en utilisant des jointures.

**Paramètres** : semestre, annee, sigle, numero_groupe 

**Exemples d'exécution:**

|Semestre|Annee|Sigle|Numéro de groupe|Nombre d'étudiants|
||||||
|Automne|2020|420-1D6-VI|1|3|
|Automne|2021|420-1D6-VI|1|2|

