# Examen 1 - Révision A

## Consignes

À partir de la mise en situation suivante, vous devez produire un ==schéma conceptuel== qui répondra aux normes suivantes: 

- Le schéma respecte les exigences de la mise en situation.
- La multiplicité des associations est juste.
- Le schéma respecte les normes de conception.

On va faire une auto-correction de vos schémas ensemble en classe.

## Mise en situation

L'entreprise qui vous emploie développe une plateforme Web de vente de musique appelée GroupCamp. Le principe du service est que les artistes  peuvent proposer leur album au prix qu'ils décident. L'acheteur peut ensuite décider de payer le prix demandé ou bien plus cher s'il veut encourager  l'artiste. Vous êtes en charge de produire une première ébauche d'enregistrement des informations dans une base de données MySQL. Pour l'instant, tout le volet transactionnel et sécurité ne sera pas pris en charge par votre modèle, ==vous devez seulement vous concentrer sur les éléments suivants==.

Les artistes seront invités à  s'inscrire à notre service en nous fournissant leur nom (nom d'artiste ou nom du groupe), une image qui les  représente ainsi que la localisation d'où ils proviennent. La localisation est  un court texte où ils peuvent entrer une information du genre "Victoriaville,  Québec", "Californie", "Le garage chez Fred", etc. 

Ensuite bien sûr les artistes vont nous informer sur les albums qui vont mettre en vente. Chaque album  comporte un titre, une description, une date de parution et une image. Que ce soit pour l'image de l'artiste ou de l'album, nous allons sauvegarder l'URL de l'image qui sera stockée sur un de nos serveurs. L'artiste va aussi nous indiquer le prix minimum qu'il demande pour l'album. Pour l'instant, tous les  montants seront en devise canadienne. L'album comportera une ou plusieurs pistes, dont on enregistrera son titre, son ordre dans l'album et sa durée en secondes.

Pour chaque album l'artiste  peut ajouter une série de mots-clés qui définit le type de musique de l'album.  Il pourra choisir parmi la liste des mots-clés de tous les albums de tous les artistes ou en entrer de nouveaux. Le but étant de permettre ensuite à l'utilisateur de faire une recherche par mot-clé. Cette option n'est pas obligatoire, l'artiste pourrait n’en ajouter aucun à l'album. Les mots-clés peuvent aussi varier d'un album à l'autre du même artiste. De plus, parmi tous les mots-clés choisis pour l'album, l'artiste peut en définir un qui sera "principal", ce mot-clé sera mis de l'avant à l'affichage et lors des recherches. Un album ne peut pas avoir plus d'un mot-clé principal.

Parlons maintenant du volet utilisateur. N'importe qui peut se créer un compte sur notre service. La personne devra nous fournir un nom d'usager et si elle le veut un court texte d'un maximum de 500 caractères qui la décrit. Le nom d'usager doit être unique dans la base de données.

Quand un utilisateur achète un album, celui-ci va être stocké dans sa "collection". On va y sauvegarder le prix que l'usager a payé. Il pourra aussi s'il le décide indiquer sa piste préférée de l'album et laisser un commentaire sur l'album en générale qui sera affiché sur la page de description de l'album. L'usager aura aussi la possibilité de se  créer une liste de souhaits d'album qu'il aime, mais qu'il n'a pas encore acheté. Dans ce cas, on enregistre uniquement un lien vers l'album. Si l'usager achète un album de sa liste de souhaits, il disparaitra de celle-ci.