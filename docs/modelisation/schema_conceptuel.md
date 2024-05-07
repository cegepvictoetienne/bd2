Le schema conceptuel

Dans le schéma conceptuel, les différents éléments du modèle entité-association seront représentés de la façon suivante:

Les entités sont défini par des rectangles avec leur nom en entête.
Les attributs seront nommés dans le rectangle leur entité ou association.
Les associations seront représentées par un cercle avec le verbe ou le mot le définissant.
Des traits relieront les entités aux associations. On va aussi ajouter une multiplicité à chaque trait marquant une association. Une multiplicité se note x..y, où x indique le nombre minimal d'objets reliés et y la valeur minimal. On utilise des nombres entiers positifs comme valeur, mais on peut aussi indiquer le symbole * qui désigne plusieurs sans donner de limite.

Prenons l'exemple suivant

![Exemple de schéma conceptuel](../images/schema_conceptuel_exemple.svg)

On a dans cette exemple 4 entités (pays, auteur, livre et genre) ayant chacune des attributs. Remarquez que j'ai ajouté des attributs id à chaque entité car elles ne possédaient pas d'identifiant naturel. On peut aussi voir qu'il y a trois associations: Est originaire de, Rédige et Appartient. Regardons maintenant les multiplicités.

!!! Note "Astuce"
    Les multiplicités sont importantes pour déterminer les contraintes.

Un truc pour les lire est de commencer par le nom de l'entité, ensuite le verbe de l'association, la multiplicité et finalement la deuxième entité. Si on prend par exemple l'association Rédige, on va lire que l'auteur peut rédiger entre 0 et plusieurs livres (0..*). À l'inverse un livre peut être rédigé par au moins un auteur mais aussi par plusieurs (1..*).