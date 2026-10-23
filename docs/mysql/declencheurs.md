# Déclencheurs

Comment résoudre les situations suivantes :

- Si l’on essaie d’ajouter une note plus grande que la note maximale d’évaluation, alors on affecte la note maximale
- Après la création d'une Evaluation, on crée un ligne de Evaluation_Etudiant pour chaque étudiant du groupe

Un déclencheur (appelé communément *Trigger*) permet d’effectuer un traitement immédiatement avant ou après l'une de ces opérations :

- INSERT  
- UPDATE  
- DELETE  

## Syntaxe des déclencheurs

```sql
DELIMITER $$
CREATE TRIGGER nom TEMPS EVENEMENT ON Table FOR EACH ROW
BEGIN
	traitement
END; $$
DELIMITER ;

TEMPS : BEFORE ou AFTER
EVENEMENT : INSERT, UPDATE ou DELETE
```

## Choisir BEFORE ou AFTER

**BEFORE** :
Quand il faut changer une valeur à insérer ou à modifier.

**AFTER** :
Quand on veut s’assurer que la donnée soit bien insérée avant de faire le traitement (ex. n’a pas déclenché un check erroné). 

## Accéder à l'enregistrement modifié

On peut utiliser les références **OLD** et **NEW** pour accéder à l'enregistrement qui fait l'objet d'un déclencheur.

|Type de requête|OLD|NEW|
||||
|INSERT|NULL|L'enregistrement inséré|
|UPDATE|L'enregistrement avant la modification|L'enregistrement après la modification|
|DELETE|L'enregistrement supprimé|NULL| 

## Exemple

Si l’on essaie d’ajouter une note plus grande que la note maximale d’évaluation, alors on affecte la note maximale

```sql
DELIMITER $$
CREATE TRIGGER respect_note_maximale BEFORE INSERT ON Evaluation_etudiant FOR EACH ROW
BEGIN
  DECLARE _note_maximale INTEGER;
  SET _note_maximale = (
    SELECT ponderation FROM evaluations 
      WHERE id_evaluation = NEW.id_evaluation
  );

  IF NEW.note > _note_maximale THEN
    SET NEW.note = _note_maximale;
  END IF;
END $$

DELIMITER ;
```

## Documenter un déclencheur

Pour documenter un déclencheur, on utilise un commentaire de style JavaDOC

```
/**
 * Description du TRIGGER
 *
 * @dependencies Table_dependante, table_dependante...
 */
```

## Démonstration

Si la date de remise d'une nouvelle évaluation_etudiant est hors de la durée de la session, alors on lui affecte la valeur nulle.

## :material-cog: --- Exercice 1 ---

Ajoutez les déclencheurs permettant d'effectuer les traitements suivants

A. Lorsqu'on supprime un enseignant, tous les programmes dont il est responsable sont modifiés pour que le responsable soit NULL (enlever la contrainte NOT NULL sur la colonne responsable) et tous les cours donnés par l'enseignant aient l'enseignant NULL.  

B. Après la création d'une évaluation, on crée une ligne de evaluations_etudiants pour chaque étudiant du groupe avec la date de remise à NULL et le nom du document à NULL.


## Conflits et limitations des déclencheurs et des fonctions

Les cas de figure suivant sont interdits :

- Une fonction ne peut pas s'appeler elle-même  
- Un déclencheur ne peut pas être appelé sur une table en modification par un déclencheur  

Un déclencheur peut appeler une fonction et l'exécution d'une fonction pourrait activer un déclencheur.  

**Les appels implicits sont aussi interdits !**

## Exemple de schémas d'exécution à problème

![](images/5_fct_trigger.png)

## Déclencheurs sur la même table

Appeler un déclencheur BEFORE et un AFTER sur la même table.

1. La table est verrouillée, le déclencheur BEFORE s'exécute, la table est libérée
2. La requête s'exécute
3. La table est verrouillée, le déclencheur AFTER s'exécute, la table est libérée

Donc une table peut définir jusqu'à 6 déclencheurs.

## Démonstration

Si la date de remise d'une nouvelle évaluation_etudiant est hors de la durée de la session, alors on lui affecte la valeur nulle.

Gérez cette validation pour l'insertion et la modification.

## Empêcher un ajout via un déclencheur

Pour empêcher un ajout, on peut utiliser la commande **SIGNAL SQLSTATE**.

## Syntaxe

```sql
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Message erreur';
```

## :material-cog: --- Exercice 2 ---

C. Si l'évaluation ajoutée cause la somme des pondérations du cours à excéder 100%, alors la pondération devient 0. Gérez cette validation lors de l'ajout et de la modification.
