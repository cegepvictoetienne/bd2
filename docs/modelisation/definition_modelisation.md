# Qu'est-ce qu'est la modélisation de données?

La modélisation est une série d'outils et de processus visant la création d'une base de données pouvant stocker efficacement les données d'un système. On va diviser notre travail en trois niveaux :

## Le niveau conceptuel

À cette étape, on va analyser le système à modéliser en récoltant des données et en définissant les besoins en utilisant le modèle entité-association. Ce travail de réflexion va nous amener à construire le schéma conceptuel, sorte de première ébauche de notre future base de données.

## Le niveau relationnel

La prochaine étape consiste à transformer notre schéma en un diagramme de classes UML. C'est à cette étape qu'on va définir le type de données à utiliser pour chaque champ, les clés primaires ainsi que secondaires et les types de relations entre les tables. Plusieurs règles, qu'on appelle la normalisation, viendront nous aider à créer un diagramme efficace.

## Le niveau SQL

Finalement, on va créer les scripts SQL de création de tables, définir les contraintes, créer les déclencheurs (triggers).