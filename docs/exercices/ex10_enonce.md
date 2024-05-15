# Exercice 10 - Curseur

Cet exercice à pour objectif de vous rendre plus à l'aise avec la création et l'utilisation de curseurs.

- Téléchargez et exécutez le script sql disponible ici : [ex10_create_tables](../ressources/ex10_create_tables.sql). 

## Première question

Dans la table *houblons* de la base de données, il y a un champ *pays* qui contient le nom du pays producteur du type de houblon.  

**Créez une procédure stockée avec curseur qui va lister tous les pays présents dans la table.**

- Le format du résultat est un string avec la liste des pays séparés par un point-virgule ("Canada;États-Unis")
- Il ne doit pas avoir de doublon dans la liste
- Les pays doivent être classé en ordre alphabétique
- Utilisez une variable **OUT** pour récupérer le résultat

Vous devriez avoir comme résultat 
```sql title="résultat" linenums="1"
"Allemagne;Australie;États-Unis;France;Japon;Nouvelle-Zélande;Pologne;République-Tchèque;Royaume-Uni;Russie;Slovénie"
```

Créez un script SQL nommée **NomPrenom_ex10_1.sql** qui va contenir la création de la procédure et un test à la fin de votre procédure.

## Deuxième question

Encore dans la table *houblons*, il y a un champ *similitude* qui contient une liste de houblons similaires au houblon sélectionné. Le but est de pouvoir proposer des houblons qui s'accompagnent bien ensemble. On va extraire cette information dans de nouvelles tables.

Créez un script SQL nommée **NomPrenom_ex10_2.sql** qui va contenir l'ensemble des éléments de votre réponse.

**Créez les tables selon le diagramme UML suivant**

![ex10_01](../images/ex10_01.svg)

**Créez une procédure stockée selon les critères suivants:**

- La procédure doit utiliser un curseur
- Créez une transaction qui sera complête uniquement si le traitement se déroule bien jusqu'à la fin
- Supprimez le contenu des tables *similitudes* et *similitude_logs*
- Pour chaque ligne de la table *houblons*, isoler les valeurs de la colonne *similitude* (elles sont séparées par des virgules)
- Pour chaque valeur, déterminez si un houblon du même nom existe déjà.
- Si oui, ajoutez dans la nouvelle table *similitudes* le id du houblon de la ligne et le id du houblon de la valeur trouvée.
- Si non, ajoutez dans la table *similitude_logs* le id du houblon de la ligne et la valeur en texte.
- Si on rencontre une erreur de type **SQLEXCEPTION** le traitement doit s'arrêter et les modifications annulées. Affichez aussi un message d'erreur à l'usager.

Pour tester votre procédure, lancez-là et ensuite faites une requête sur le houblon "Admiral" pour sortir ses houblons similaires depuis la table similitude. Vous devriez avoir comme résultat les houblons "Target" et "Challenger".

**Déposez vos deux scripts SQL dans le devoir sur Teams**