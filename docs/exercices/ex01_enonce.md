# Exercice 1 - Révision

Pour se remettre dans le bain des bases de données, voici un petit exercice qui récapitule les concepts abordés durant le cours de Base de données 1. Veuillez inscrire dans un fichier SQL toutes les commandes et requêtes que vous avez utilisées pour répondre aux questions de la section **Manipulation des données**. Ce fichier doit être soumis via le devoir Teams correspondant.

**Contexte de l'exercice :**

La base de données utilisée pour cet exercice contient une liste de sorts du jeu Donjons et Dragons, 5e édition. Chaque sort est associé à une unique école de magie mais peut être utilisé par plusieurs classes de personnages. La base de données inclut également une liste d'utilisateurs qui peuvent créer et gérer une liste de leurs sorts favoris.

**Diagramme de classes de la base de données :**

![ex01_a](../images/ex01_diagramme.svg)

**Création d'une base de données et exécution d'un script SQL**

- Téléchargez le fichier [**ex01_create_tables.sql**](../ressources/ex01_create_tables.sql). 
- Lancez le script pour créer la base de données, les tables et le contenu des tables.
- Allez-y en ligne de commande ou avec DBeaver

**Visualisation des résultats :**

Pour chaque question, une image illustrant le résultat attendu est fournie. Ces images montrent clairement le nom des colonnes désirées pour les résultats de vos requêtes. Assurez-vous de configurer vos requêtes pour que les résultats correspondent à ce format.

**Manipulation des données**

| Énoncé | Résultats attendus |
|--------|-------------------|
| 1. Sélectionnez le nom de toutes les classes. Triez le résultat en ordre alphabétique inversé. | ![ex01_01](../images/ex01_01.png) |
| 2. Comptez le nombre de sorts qui appartient à l'école **Conjuration**. | ![ex01_02](../images/ex01_02.png) |
| 3. Comptez le nombre de sorts de chacune des écoles. (ecole - nb_sorts) | ![ex01_03](../images/ex01_03.png) |
| 4. Sélectionnez la liste des sorts de la classe **Bard** de niveau 0, triez en ordre alphabétique de nom de sort. | ![ex01_04](../images/ex01_04.png) |
| 5. Sélectionnez la liste de tous les sorts qui contiennent le mot **fire** dans leur nom. | ![ex01_05](../images/ex01_05.png) |
| 6. Trouvez les trois écoles de magie qui comptent le plus de sorts faisant partie des sorts favoris des usagers. Triez les écoles en commençant par la plus populaire. | ![ex01_06](../images/ex01_06.png) |
| 7. Sélectionnez la liste des sorts qui ont le composant **verbal** mais pas **somatic** et **material** et qui ont une durée d'une heure OU qu'ils n'ont pas le composant **verbal** et qui ont une portée de **Touch** | ![ex01_07](../images/ex01_07.png) |
| 8. Sélectionnez le nombre de sorts pour chaque classe. | ![ex01_08](../images/ex01_08.png) |
| 9. En vous aidant de la requête précédente, affichez la moyenne de sort par classe de personnage. Essayez d'utiliser une sous-requête et la fonction SQL **AVG** | ![ex01_09](../images/ex01_09.png) |
| 10. Pour cet exercice, votre tâche est de sélectionner tous les sorts correspondant à une classe et à un niveau spécifiques. Pour chaque sort, vous devrez afficher les informations suivantes : <br/>- **ID du sort** : Identifiant unique du sort. <br/>- **Nom du sort** : Nom descriptif du sort. <br/>- **Composante** : Une colonne générée qui indique les types de composantes utilisées pour le sort. Utilisez les abréviations suivantes : <br/>  - **V** pour verbal, si le champ `verbal` est égal à 1. <br/>  - **S** pour somatique, si le champ `somatic` est égal à 1. <br/>  - **M** pour matériel, si le champ `material` est égal à 1. <br/> <br/>Chaque lettre doit être séparée par une virgule seulement si la composante suivante est présente. La construction de cette chaîne doit être réalisée en utilisant les fonctions `IF()` et `CONCAT()`. <br/>- **Coût matériel** : Affichez la valeur du champ `material_cost` pour indiquer le coût des matériaux nécessaires au sort. <br/> <br/>Dans l'exemple pratique de cette tâche, sélectionnez tous les sorts de la classe 'Bard' au niveau 0. Assurez-vous de structurer votre requête pour refléter ces critères spécifiques. | ![ex01_10](../images/ex01_10.png) |
