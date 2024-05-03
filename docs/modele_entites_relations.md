# Modèle entité-association

## Définition

Le modèle entité-association aide à représenter conceptuellement les données d'un problème et fournit une représentation graphique des associations entre les données. Ceci est essentiel pour créer des diagrammes et modéliser différents systèmes.

## Les entités

Les entités dans ce modèle représentent les éléments du système, pouvant être des objets physiques ou des concepts. Chaque entité est identifiable de manière unique et peut inclure des attributs qui sont des données à stocker.

Exemples d'entité :  

- Étudiant  
- Professeur  
- Cours  
- Livre  

## Les attributs

Les attributs sont les données stockées dans la base de données pour chaque entité. Il est important de distinguer les données pouvant être calculées ou déduites des données brutes à enregistrer.

Exemples d'attributs :

- Étudiant : nom, prénom, date de naissance, adresse
- Professeur : nom, prénom, date d'embauche, spécialité
- Cours : titre, description, crédits
- Livre : titre, auteur, édition, ISBN



## Les associations

Les associations décrivent les interactions et contraintes entre les entités. Elles sont utilisées pour préciser les relations dans les systèmes modélisés, ce qui aide à traduire ces relations en bases de données où les entités deviennent des tables et les attributs des champs.

Exemples d'associations :

- Un étudiant peut suivre plusieurs cours
- Un professeur peut enseigner plusieurs cours
- Un cours peut être suivi par plusieurs étudiants
- Un livre peut être écrit par plusieurs auteurs

Exemples de contraintes :

- Un étudiant ne peut pas suivre un cours dans un autre programme que le sien
- Un professeur ne peut pas enseigner un cours sans être assigné
- Un cours doit avoir un professeur assigné
- Un livre doit avoir au moins un auteur


