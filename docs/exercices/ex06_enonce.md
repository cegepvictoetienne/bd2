# Exercice 6 - VUES

À partir de la base de données athlète de l'exercice précédente, (le script sql de génération est disponible [**ici**](../ressources/ex05_create_tables.sql)), creez les vues suivantes : 

1. Créez une vue nommée **resultat_hhmmss** qui affiche le résultat formaté en heures, minutes, secondes (hh\:mm\:ss). Les colonnes de la vue doivent être les mêmes que la table resultat mais en ajoutant une colonne nommée **resultat_hhmmss** dans laquelle le calcul sera fait (id, athlete_id, epreuve_id, date_resultat, resultat_ms, resultat_hhmmss).
2. Créez une vue nommée **athlete_complet** qui, en combinant les tables nécessaires, affiche les athlètes avec les colonnes suivantes, (id, nom prénom concat, date_epreuve, nom_epreuve, resultat). Attention, les noms de colonnes de la vue doivent être identiques à ce qui est demandé entre parenthèse)
3. À partir de la vue précédente, athlete_complet, sélectionnez les informations des athlètes qui ont participé à un marathon. 
4. Créez une vue nommée **resultat_21juillet2020** qui va contenir toutes les informations de la table résultat mais uniquement pour la date du 21 juillet 2020.
5. Modifiez la vue **resultat_21juillet2020** pour qu'elle affiche les résultats du 14 juillet 2019. Modifiez aussi son nom pour **resultat_14juillet2019**
6. Supprimez la vue **resultat_14juillet2019**

Remettez les requêtes dans un script SQL.