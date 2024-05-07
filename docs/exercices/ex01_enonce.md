# Exercice 1 - Révision

Question de se remettre en mode "BD", voici un petit exercice de révision des concepts vus durant le cours de Base de données 1. Inscrivez-moi dans un fichier SQL les commandes et requêtes que vous avez utilisées pour compléter les questions de la section **Manipulation des données**. Le fichier est à remettre dans le devoir Teams correspondant. 

La base de données contient une liste de sorts pour le jeu Donjons et Dragons 5e édition. Chaque sort appartient à une seule école de magie, mais il peut être utilisé par plus d'une classe de personnage. Il y a aussi une liste d'usagers qui peuvent créer une liste de leurs sorts favoris.

Voici le diagramme de classes de la base de données

![ex01_a](../images/ex01_diagramme.png)


## Création d'une base de données et exécution d'un script SQL

- Créez une nouvelle base de données et nommez la **bd2_01**
- Téléchargez le fichier [**ex01_create_tables.sql**](../ressources/ex01_create_tables.sql). 
- Lancez le script pour créer les tables et ajouter les données.
- Allez-y en ligne de commande ou avec DBeaver

## Manipulation des données
Pour chacune des questions, j'ai ajouté une image du résultat attendu avec le nom des colonnes désiré.

1. Sélectionnez le nom de toutes les classes trié en ordre alphabétique inversé.
![ex01_01](../images/ex01_01.png)

2. Comptez le nombre de sorts qui appartient à l'école **Conjuration**.
![ex01_02](../images/ex01_02.png)

3. Comptez le nombre de sorts de chacune des écoles. (ecole | nb_sorts)
![ex01_03](../images/ex01_03.png)

4. Sélectionnez la liste des sorts de la classe **Bard** de niveau 0, triez en ordre alphabétique de nom de sort.
![ex01_04](../images/ex01_04.png)

5. Sélectionnez la liste de tous les sorts qui contiennent le mot **fire** dans leur nom.
![ex01_05](../images/ex01_05.png)

6. Trouvez les trois écoles de magie qui comptent le plus de sorts faisant partie des sorts favoris des usagers. Triez les écoles en commençant par la plus populaire.
![ex01_06](../images/ex01_06.png)

7. Sélectionnez la liste des sorts qui ont le composant **verbal** mais pas **somatic** et **material** et qui ont une durée d'une heure OU qu'ils n'ont pas le composant **verbal** et qui ont une portée de **Touch**
![ex01_07](../images/ex01_07.png)

8. Sélectionnez le nombre de sorts pour chaque classe.
![ex01_08](../images/ex01_08.png)

9. En vous aidant de la requête précédente, affichez la moyenne de sort par classe de personnage. Essayez d'utiliser une sous-requête et la fonction SQL **AVG**
![ex01_09](../images/ex01_09.png)

10. Sélectionnez tous les sorts d'une classe donnée et d'un niveau donnée. Pour chaque sort affichez le id et le nom du sort ainsi qu'une colonne composante qui sera généré comme suit. Pour les champs **verbal**, **somatic** et **material**, affichez respectivement un V, S ou M si la valeur est égale à 1, sinon n'affichez rien. Chaque lettre doit être séparée par une virgule. Finalement affichez la valeur du champ **material_cost**. Vous pouvez vous aider des fonctions **IF()** et **CONCAT()**. Dans mon exemple j'affiche tous les sorts de la classe Bard du niveau 0.
![ex01_10](../images/ex01_10.png)