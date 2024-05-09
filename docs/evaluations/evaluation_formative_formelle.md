# Évaluation formative formelle

## Consignes

- Vous avez droit à toutes vos notes et Internet.
- Aucune communication n'est permise (messagerie, courriel, etc.). Un élève pris en flagrant délit se verra attribuer la note de 0 pour plagiat.
- La durée de l'examen est de 1h50.
- Une fois l’examen terminé, vous devez me remettre vos fichiers image via le devoir de l’examen sur Teams. 
- Il est de votre devoir de vous assurer que votre fichier est inclus dans la remise. Aucun fichier ne sera accepté une fois que vous aurez quitté le lieu de l'examen. 

## Mise en situation

Le centre de recherche xLabs se spécialise dans des recherches dites marginales. Elle emploie une pléthore de cobayes pour ses différents projets et présentement il est difficile de garder une trace de l'état de tous ces "volontaires". La direction vous a donné le mandat de modéliser leur opération.

Pour chaque cobaye, on veut connaitre sa date de naissance, la date à laquelle il a commencé sa première expérience et aussi sa date de décès s'il y a lieu, car chez xlabs on est cobaye à vie. Un surnom et un numéro d'identification unique est attribué aux cobayes. Par contre ce numéro peut être réutilisé à la mort du cobaye.

Les cobayes peuvent participer à plus d'une expérience à la fois et chaque expérience doit comporter au minimum un cobaye mais peut en avoir plusieurs. On veut connaitre la date de début et de fin de la participation de chaque cobaye à chaque expérience. Chaque expérience à un titre, un niveau de sécurité qui se situe entre 0 et 10 et une courte description qui défini le sujet de l'expérience. Un ou plusieurs chercheurs peuvent être associés à une expérience et un chercheur peut participer à plus d'une expérience à la fois. Parmi les chercheurs impliqués, un rôle est attribué à chacun. Il y a présentement trois rôles disponible (directeur de recherche, assistant, appariteur) mais il n'est pas impossible que ça change dans l'avenir. Le rôle d'un chercheur peut aussi varier d'une expérience à l'autre. Au niveau des chercheurs, on veut connaitre uniquement leur nom et leur numéro d'identification personnelle. 

Durant le temps que dure une expérience, les chercheurs vont faire des observations. Pour chaque observation, il y a un chercheur impliqué, un cobaye, une expérience, une date d'observation et les notes de l'observation. 

Afin de s'assurer de la bonne rentabilité des cobayes, un chercheur effectue chaque jour une évaluation générale de ceux-ci. L'évaluation consiste uniquement en une prise de notes. On veut donc conserver pour chaque évaluation le cobaye évalué, le chercheur impliqué, la date de l'évaluation ainsi que les notes prises. 

## Directives

À partir de cette mise en situation vous devez créer: 

1. Un schema conceptuel en format image portant le nom **NomPrenom_shema**
2. Un diagramme de classes en format image portant le nom **NomPrenom_diagramme**
3. Un script de création des tables portant le nom **NomPrenom_script**

### Schéma conceptuelle

- La multiplicité des associations doit être inscrite. 

### Diagramme de classes

- Votre diagramme doit répondre aux règles de la troisième forme normale.
- Vous devez respecter la convention de nomenclature telle que décrite dans les notes de cours "Convention de nommage MySQL".

### Script SQL

- Le script SQL doit pouvoir être lancé à plusieurs reprises sans causer d'erreurs.
- Vous devez créer toutes les tables et les champs de votre diagramme.
- Les clés primaires et étrangères doivent aussi être crées.

## Grille de correction

| Éléments                                         | Atteint | Satisfaisant | Faible | Non-atteint |
| :----------------------------------------------- | -- | -- | -- | -- |
| **Shéma conceptuel**                             |    |    |    |    |
| Le schéma respecte la mise en situation          | 40 | 28 | 16 |  0 |
| La multiplicité des associations est juste       | 10 | 7  |  4 |  0 |
| Le schéma respecte les normes de conception      | 5  | 4  |  2 |  0 |
| **Diagramme de classes**                         |    |    |    |    |
| Les relations entrent les tables sont juste      | 10 | 7  | 4  |  0 |
| Le diagramme respecte la troisième forme normale | 10 | 7  | 4  |  0 |
| Les type de données sont juste                   | 10 | 7  | 4  |  0 |
| **Script SQL**                                   |    |    |    |    |
| Le script peut être lancé sans causer d'erreurs  | 5  | 4  | 2  |  0 |
| Toutes les informations nécessaires sont créées  | 10 | 7  | 4  |  0 |