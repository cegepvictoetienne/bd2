# Révision - Brèches de sécurité au Québec

## Mise en situation

Mathieu Gagnon est journaliste spécialisé en cybersécurité. Depuis plusieurs années, il documente toutes les brèches de sécurité touchant des organisations québécoises. Ses notes sont actuellement dispersées dans des fichiers Excel, des courriels et des carnets, ce qui rend difficile la production de ses articles et de ses statistiques annuelles. Il vous demande de concevoir une base de données relationnelle pour centraliser ses informations.

### Les organisations

Chaque brèche touche **une seule organisation**. Pour chaque organisation, Mathieu conserve son nom, son numéro d'entreprise du Québec (NEQ, unique, 10 chiffres), l'adresse de son site web ainsi que le nombre approximatif d'employés. Une organisation appartient à **un seul secteur d'activité** (finances, santé, éducation, commerce de détail, municipal, gouvernemental, etc.). Mathieu veut aussi savoir dans quelle **ville** se trouve le siège social de l'organisation, et chaque ville fait partie d'**une région administrative** du Québec (Montérégie, Centre-du-Québec, Capitale-Nationale, etc.). Une organisation peut avoir subi plusieurs brèches au fil des années.

### Les brèches

Pour chaque brèche, Mathieu conserve :

- un titre court (ex. : « Fuite des dossiers clients de 2024 »);
- une description détaillée;
- la **date à laquelle la brèche a eu lieu**, la **date à laquelle elle a été découverte** par l'organisation et la **date de divulgation publique** (cette dernière peut être inconnue si la brèche n'a jamais été rendue publique officiellement);
- le **nombre de victimes** impactées (personnes dont les données ont été compromises);
- un **niveau de gravité** évalué par Mathieu : faible, moyen, élevé ou critique;
- si l'organisation a envoyé l'avis obligatoire à la **Commission d'accès à l'information (CAI)** (Loi 25) et, le cas échéant, la date de cet avis.

Chaque brèche est classée selon **un seul type de brèche** (rançongiciel, hameçonnage, mauvaise configuration, employé malveillant, vol d'appareil, attaque par la chaîne d'approvisionnement, etc.). Chaque type possède un nom et une courte description.

### Les informations volées

Une brèche peut compromettre **plusieurs types d'informations** : nom, adresse, date de naissance, numéro d'assurance sociale (NAS), numéro de carte de crédit, numéro d'assurance maladie, dossier médical, mot de passe, etc. Chaque type d'information possède un nom et un **niveau de sensibilité** de 1 à 5 (5 étant le plus sensible). Un même type d'information peut évidemment avoir été volé lors de plusieurs brèches.

Pour chaque type d'information volé lors d'une brèche, Mathieu veut noter le **nombre d'enregistrements** touchés. Par exemple, une brèche peut avoir exposé 2 000 000 de noms, mais seulement 350 000 NAS.

### Les logiciels impactés

Une brèche peut exploiter **un ou plusieurs logiciels** (ex. : un serveur de transfert de fichiers et un pare-feu). Un logiciel a un nom et est développé par **un seul éditeur** (Microsoft, Fortinet, Progress Software, etc.). Pour chaque éditeur, Mathieu conserve le nom et le pays d'origine.

Lorsqu'un logiciel est impliqué dans une brèche, Mathieu note la **version** du logiciel qui était utilisée par l'organisation ainsi que, si elle est connue, l'**identifiant de vulnérabilité CVE** exploitée (ex. : `CVE-2023-34362`) et son **score CVSS** (nombre décimal entre 0,0 et 10,0).

### Les groupes criminels

Lorsqu'elle est connue, Mathieu note le **groupe criminel** qui a revendiqué la brèche. Une brèche est revendiquée par au plus un groupe. Pour chaque groupe, il conserve le nom, le pays présumé d'opération et la date à laquelle il a été observé pour la première fois.

Dans le cas d'un rançongiciel, Mathieu note aussi le **montant de la rançon demandée** et si la rançon **a été payée** ou non.

### Les articles

Mathieu publie des articles sur les brèches. Chaque article a un titre, une date de publication, un nom de média (La Presse, Le Devoir, Radio-Canada, etc.) et une adresse URL unique. Un article peut traiter de plusieurs brèches (ex. : un bilan annuel) et une brèche peut faire l'objet de plusieurs articles. Un média peut publier plusieurs articles.

## Exemple de notes de Mathieu

Voici un extrait des notes actuelles de Mathieu. Les données sont **fictives**.

| Organisation | Ville | Date | Victimes | Type | Logiciel (version) | Infos volées | Groupe |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Caisse populaire Bois-Francs | Victoriaville | 2024-03-12 | 125 000 | Employé malveillant | — | Nom, adresse, NAS | — |
| Clinique Santé Plus | Drummondville | 2024-09-02 | 48 200 | Rançongiciel | Windows Server (2016), FortiOS (7.0.12) | Nom, no d'assurance maladie, dossier médical | LockBit |
| Boutique Évasion inc. | Québec | 2025-01-20 | 310 000 | Chaîne d'approvisionnement | MOVEit Transfer (2023.0.1) | Nom, courriel, carte de crédit | Cl0p |
| Ville de Saint-Hyacinthe | Saint-Hyacinthe | 2025-06-08 | 0 | Rançongiciel | Citrix NetScaler (13.1) | — | Akira |

## Travail à réaliser

1. Faites le **dépouillement** du scénario : identifiez les entités, leurs attributs et les associations (avec leur verbe).
2. Produisez le **schéma conceptuel** (modèle entité-association) avec les multiplicités sur chaque association.
3. Produisez le **diagramme de classes** en respectant :
    - la troisième forme normale (3FN);
    - les [conventions de nommage](../mysql/convention.md) du cours;
    - les clés primaires, les clés étrangères et les contraintes (`NOT NULL`, `UNIQUE`, `CHECK`);
    - des types de données MySQL appropriés pour chaque colonne.
4. Répondez aux questions suivantes à partir de votre modèle :
    1. Où doit être placé l'attribut *nombre d'enregistrements*? Pourquoi ne peut-il pas être dans la table des brèches ni dans celle des types d'informations?
    2. Où placez-vous la version du logiciel? Pourquoi ne peut-elle pas être un attribut du logiciel?
    3. La rançon demandée ne s'applique qu'aux rançongiciels. Quelles sont les options pour la modéliser? Quels sont les avantages et les inconvénients de chacune?
    4. Pourquoi la région administrative ne doit-elle pas être un attribut de l'organisation?
    5. Identifiez un attribut qui pourrait être calculé et qui ne devrait donc pas être stocké.

!!! tip "Astuce"
    Lisez attentivement les mots « un seul », « plusieurs », « au plus » et « peut » dans le texte : ils vous donnent directement les multiplicités.

## Pour aller plus loin

Une fois votre diagramme de classes terminé :

1. Écrivez le script de création des tables (`CREATE TABLE`) et insérez les données de l'exemple ci-dessus.
2. Écrivez les requêtes suivantes :
    1. Le nombre total de victimes par région administrative, en ordre décroissant.
    2. La liste des brèches où un NAS a été volé, avec le nom de l'organisation et la date.
    3. Les logiciels impliqués dans plus d'une brèche, avec le nom de leur éditeur.
    4. Pour chaque groupe criminel, le nombre de brèches revendiquées et le montant total des rançons payées.
    5. Les brèches dont l'avis à la CAI a été envoyé plus de 30 jours après la découverte.
3. Créez une vue `breches_detaillees` qui affiche pour chaque brèche : le titre, l'organisation, le secteur, la ville, le type de brèche, le nombre de victimes et le nombre de jours entre la date de la brèche et sa découverte.

## Solution proposée

??? success "Dépouillement"

    | Entité | Attributs |
    | --- | --- |
    | Organisation | nom, neq, site web, nombre d'employés |
    | Secteur | nom |
    | Ville | nom |
    | Région | nom |
    | Brèche | titre, description, date de la brèche, date de découverte, date de divulgation, nombre de victimes, gravité, avis CAI envoyé, date avis CAI, rançon demandée, rançon payée |
    | Type de brèche | nom, description |
    | Type d'information | nom, sensibilité |
    | Logiciel | nom |
    | Éditeur | nom |
    | Pays | nom |
    | Groupe criminel | nom, date première observation |
    | Article | titre, date de publication, url |
    | Média | nom |

    | Association | Entités | Multiplicités | Attributs de l'association |
    | --- | --- | --- | --- |
    | appartient à | Organisation - Secteur | 0..\* - 1..1 | |
    | est située à | Organisation - Ville | 0..\* - 1..1 | |
    | fait partie de | Ville - Région | 0..\* - 1..1 | |
    | subit | Organisation - Brèche | 1..1 - 0..\* | |
    | est de type | Brèche - Type de brèche | 0..\* - 1..1 | |
    | compromet | Brèche - Type d'information | 0..\* - 0..\* | nombre d'enregistrements |
    | exploite | Brèche - Logiciel | 0..\* - 0..\* | version, cve, score cvss |
    | développe | Éditeur - Logiciel | 1..1 - 1..\* | |
    | provient de | Éditeur - Pays | 0..\* - 1..1 | |
    | opère depuis | Groupe criminel - Pays | 0..\* - 0..1 | |
    | revendique | Groupe criminel - Brèche | 0..1 - 0..\* | |
    | traite de | Article - Brèche | 1..\* - 0..\* | |
    | publie | Média - Article | 1..1 - 0..\* | |

??? success "Diagramme de classes"

    ```mermaid
    classDiagram
        direction LR
        class regions {
            id : INT PK
            nom : VARCHAR UNIQUE
        }
        class villes {
            id : INT PK
            nom : VARCHAR
            region_id : INT FK
        }
        class secteurs {
            id : INT PK
            nom : VARCHAR UNIQUE
        }
        class organisations {
            id : INT PK
            nom : VARCHAR
            neq : CHAR UNIQUE
            site : VARCHAR
            employes : INT
            secteur_id : INT FK
            ville_id : INT FK
        }
        class types_breches {
            id : INT PK
            nom : VARCHAR UNIQUE
            description : TEXT
        }
        class pays {
            id : INT PK
            nom : VARCHAR UNIQUE
        }
        class groupes {
            id : INT PK
            nom : VARCHAR UNIQUE
            observation : DATE
            pays_id : INT FK NULL
        }
        class breches {
            id : INT PK
            titre : VARCHAR
            description : TEXT
            survenue : DATE
            decouverte : DATE
            divulgation : DATE NULL
            victimes : INT
            gravite : ENUM
            avis_cai : DATE NULL
            rancon_demandee : DECIMAL NULL
            rancon_payee : BOOLEAN NULL
            organisation_id : INT FK
            type_breche_id : INT FK
            groupe_id : INT FK NULL
        }
        class types_informations {
            id : INT PK
            nom : VARCHAR UNIQUE
            sensibilite : TINYINT CHECK 1-5
        }
        class breches_types_informations {
            breche_id : INT PK FK
            type_information_id : INT PK FK
            enregistrements : INT
        }
        class editeurs {
            id : INT PK
            nom : VARCHAR UNIQUE
            pays_id : INT FK
        }
        class logiciels {
            id : INT PK
            nom : VARCHAR
            editeur_id : INT FK
        }
        class breches_logiciels {
            breche_id : INT PK FK
            logiciel_id : INT PK FK
            version : VARCHAR
            cve : VARCHAR NULL
            cvss : DECIMAL NULL
        }
        class medias {
            id : INT PK
            nom : VARCHAR UNIQUE
        }
        class articles {
            id : INT PK
            titre : VARCHAR
            publication : DATE
            url : VARCHAR UNIQUE
            media_id : INT FK
        }
        class articles_breches {
            article_id : INT PK FK
            breche_id : INT PK FK
        }

        regions "1" -- "0..*" villes
        villes "1" -- "0..*" organisations
        secteurs "1" -- "0..*" organisations
        organisations "1" -- "0..*" breches
        types_breches "1" -- "0..*" breches
        groupes "0..1" -- "0..*" breches
        pays "0..1" -- "0..*" groupes
        pays "1" -- "0..*" editeurs
        breches "1" -- "0..*" breches_types_informations
        types_informations "1" -- "0..*" breches_types_informations
        breches "1" -- "0..*" breches_logiciels
        logiciels "1" -- "0..*" breches_logiciels
        editeurs "1" -- "1..*" logiciels
        medias "1" -- "0..*" articles
        articles "1" -- "1..*" articles_breches
        breches "1" -- "0..*" articles_breches
    ```

??? success "Réponses aux questions"

    1. Le nombre d'enregistrements dépend **à la fois** de la brèche et du type d'information. C'est donc un attribut de l'association plusieurs à plusieurs, placé dans la table `breches_types_informations`. Dans `breches`, il faudrait une colonne par type d'information; dans `types_informations`, la valeur serait la même pour toutes les brèches.
    2. Une même organisation peut avoir une version différente d'un logiciel d'une brèche à l'autre, et deux organisations n'utilisent pas nécessairement la même version. La version dépend donc du couple brèche-logiciel et va dans `breches_logiciels`.
    3. Option A : des colonnes `rancon_demandee` et `rancon_payee` **nullables** dans `breches` (simple, mais plusieurs `NULL` et la cohérence avec le type doit être validée par un `CHECK` ou un déclencheur). Option B : une table `rancons` en relation 1..1 - 0..1 avec `breches` (`breche_id` comme PK et FK) : aucune valeur `NULL` inutile, mais une jointure de plus.
    4. La région dépend de la ville et non de l'organisation (dépendance transitive : organisation → ville → région). La garder dans `organisations` violerait la 3FN.
    5. Le délai entre la brèche et sa découverte (ou entre la découverte et l'avis à la CAI) se calcule avec `DATEDIFF()`. Le nombre de brèches d'une organisation se calcule aussi avec un `COUNT()`.
