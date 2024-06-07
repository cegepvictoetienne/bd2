## Schéma conceptuel  

![Schema conceptuel](../images/schema_conceptuel_exemple.svg)

## Voici les étapes clés de la transformation entre le schéma conceptuel et le modèle relationnel :

1. **Identification des entités et relations**:
    - Dans le modèle conceptuel, les entités principales sont identifiées comme `Auteurs`, `Livres`, `Pays`, et `Genres`. Ces entités deviendront des tables dans le schéma de base de données relationnelle.

2. **Définition des attributs**:
    - Chaque entité dans le modèle conceptuel contient des attributs (comme `Nom`, `Prénom` pour `Auteurs`; `Titre`, `ISBN` pour `Livres`). Ces attributs sont transformés en colonnes dans les tables correspondantes de la base de données.
    - Les attributs principaux de chaque entité deviennent souvent les clés primaires (PK) dans les tables relationnelles. Par exemple, `id` pour `Auteurs`, `Livres`, `Pays`, et `Genres`.

3. **Gestion des relations**:
    - Les relations entre les entités dans le modèle conceptuel doivent être représentées de manière explicite dans le schéma de base de données.
    - Pour les relations "plusieurs à plusieurs" comme celle entre `Auteurs` et `Livres` ou `Livres` et `Genres`, des tables d'association sont créées (`auteurs_livres`, `livres_genres`). Ces tables contiennent des clés étrangères (FK) pointant vers les tables qu’elles relient, agissant comme des clés primaires conjointes.
    - Pour la relation "un à plusieurs" entre `Pays` et `Auteurs`, un attribut de clé étrangère (`pays_id`) est ajouté à la table `Auteurs`, référençant la table `Pays`.

4. **Contraintes**:
    - Les clés primaires et étrangères aident à maintenir l'intégrité des données et à établir des relations logiques entre les tables.
   
5. **Normalisation**:
    - Le processus de normalisation est appliqué pour réduire la redondance et éviter les anomalies de base de données. Ceci est réalisé en s'assurant que les tables sont conçues selon certaines formes normales.

Ces étapes montrent comment les concepts abstraits du modèle conceptuel sont traduits en structures concrètes et manipulables dans une base de données relationnelle, permettant ainsi leur gestion efficace et leur exploitation par des systèmes informatiques.

## Diagramme de classes UML  

![Diagramme de classes UML](../images/diagramme_classe_exemple.svg)

# Références
- [Guide UML (dans teams)](https://cegepvicto.sharepoint.com/:b:/s/etudiants.420/ETDOCoCBCUNPv3aNZeUE9ykBFMp-9Zf60k3jThmSb0D9fg?e=1GsCWi)  