DROP DATABASE IF EXISTS bd2_garage;
CREATE DATABASE bd2_garage
COLLATE = 'utf8mb4_unicode_ci';

USE bd2_garage;

/**
 * Création des tables
 */
CREATE TABLE IF NOT EXISTS `clients` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(20) NOT NULL,
    `prenom` VARCHAR(30) NOT NULL,
    `nom` VARCHAR(30) NOT NULL,
    `adresse` VARCHAR(100) NULL,
    `ville` VARCHAR(50) NULL,
    `province` VARCHAR(50) NULL,
    `code_postal` VARCHAR(10) NULL,
    `tel_cellulaire` VARCHAR(20) NULL,
    `tel_travail` VARCHAR(20) NULL,
    `tel_maison` VARCHAR(20) NULL,
    `telecopieur` VARCHAR(20) NULL,
    `courriel` VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS `voitures` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `client_id` INT NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `plaque` VARCHAR(20) NULL
);

CREATE TABLE IF NOT EXISTS `factures` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`no_facture` INT NOT NULL,
    `client_id` INT NOT NULL,
    `voiture_id` INT NOT NULL,
    `date_facture` DATE NOT NULL,
    `terme_paiement_id` INT NOT NULL,
    `temps_arrive` DATETIME NOT NULL,
    `odo_entree` INT NOT NULL,
    `odo_auto` INT NOT NULL,
    `odo_sortie` INT NOT NULL,
    `tps_tvh` DECIMAL(8,2) NOT NULL,
    `tvq` DECIMAL(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `termes_paiement` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `description` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `factures_paiements` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `facture_id` INT NOT NULL,
    `mode_paiement_id` INT NOT NULL,
    `montant` DECIMAL(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `modes_paiement` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `description` VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `factures_details` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `facture_id` INT NOT NULL,
    `ordre` INT NOT NULL,
    `produit_id` INT NULL,
    `quantite` DECIMAL(8,2) NULL,
    `prix_unitaire` DECIMAL(8,2) NULL,
    `message_ligne` VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS `produits` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `categorie_produit_id` INT NOT NULL,
    `code_produit` VARCHAR(20) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `prix_unitaire` DECIMAL(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `categories_produit` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `description` VARCHAR(50) NOT NULL
);

/**
 * Ajout des clés étrangères
 */

ALTER TABLE `factures`
	ADD CONSTRAINT `client_id_fk` FOREIGN KEY (`client_id`) REFERENCES clients (`id`) ON UPDATE RESTRICT ON DELETE CASCADE,
   	ADD CONSTRAINT `voiture_id_fk` FOREIGN KEY (`voiture_id`) REFERENCES voitures (`id`) ON UPDATE RESTRICT ON DELETE CASCADE,
   	ADD CONSTRAINT `terme_paiement_id_fk` FOREIGN KEY (`terme_paiement_id`) REFERENCES termes_paiement (`id`) ON UPDATE RESTRICT ON DELETE CASCADE;

ALTER TABLE `factures_paiements`
	ADD CONSTRAINT `facture_id_fk` FOREIGN KEY (`facture_id`) REFERENCES factures (`id`) ON UPDATE RESTRICT ON DELETE CASCADE,
	ADD CONSTRAINT `modes_paiement_id_fk` FOREIGN KEY (`mode_paiement_id`) REFERENCES modes_paiement (`id`) ON UPDATE RESTRICT ON DELETE CASCADE;

ALTER TABLE `factures_details`
	ADD CONSTRAINT `factures_id_fk` FOREIGN KEY (`facture_id`) REFERENCES factures (`id`) ON UPDATE RESTRICT ON DELETE CASCADE,
	ADD CONSTRAINT `produits_id_fk` FOREIGN KEY (`produit_id`) REFERENCES produits (`id`) ON UPDATE RESTRICT ON DELETE CASCADE;
	
ALTER TABLE `produits`
	ADD CONSTRAINT `categories_produit_id_fk` FOREIGN KEY (`categorie_produit_id`) REFERENCES categories_produit (`id`) ON UPDATE RESTRICT ON DELETE CASCADE;

ALTER TABLE `voitures`
	ADD CONSTRAINT `vclient_id_fk` FOREIGN KEY (`client_id`) REFERENCES clients (`id`) ON UPDATE RESTRICT ON DELETE CASCADE;

/**
 * Insertion des données
 */
INSERT INTO clients (id, code, nom, prenom, adresse, ville, province, code_postal, tel_cellulaire, courriel)
VALUES (1, '2134521', 'Scott', 'Michael', '123 rue du cégep', 'Victoriaville', 'Québec', 'G0P1B0', '819-740-1111', 'scott.michael@dundermifflin.com');

INSERT INTO voitures (id, client_id, description)
VALUES (1, 1, '2011 Mazda 2 i.5 L 1498 CC L4 DOHC 16 Valve');

INSERT INTO termes_paiement(id, description)
VALUES (1, 'Net 30 JOURS'), (2, 'Net 60 JOURS');

INSERT INTO factures (id, no_facture, client_id, voiture_id, date_facture, terme_paiement_id, temps_arrive, odo_entree, odo_auto, odo_sortie, tps_tvh, tvq)
VALUES (1, 105036, 1, 1, '2020-10-21', 1, '2020-10-21 15:00', 238832, 238832, 238832, 31.79, 63.41);

INSERT INTO modes_paiement  (id, description)
VALUES (1, 'Visa'), (2, 'Debit'), (3, 'Comptant');

INSERT INTO factures_paiements (facture_id, mode_paiement_id, montant)
VALUES (1, 1, 730.92);

INSERT INTO categories_produit (id, description)
VALUES (1, 'Pièces'), (2, 'M.O.'), (3, 'Autre');

INSERT INTO produits(id, categorie_produit_id, code_produit, description, prix_unitaire)
VALUES (1, 1, 'YOK 110115322', 'YOKO ICEGUARD IG53 82H 185/55R15', 139.93), 
	   (2, 2, '1PBN1', 'POSE + BALANCE PNEUS NEUF 29', 16.00),
	   (3, 3, 'TP', 'Taxe d\'environnement Pneus', 3.00);

INSERT INTO factures_details (facture_id, ordre, produit_id, quantite, prix_unitaire, message_ligne)
VALUES (1, 1, NULL, NULL, NULL, 'REMETTRE PNEUS DANS L\'AUTO'),
	   (1, 2, 1, 4, 139.93, NULL),
	   (1, 3, 2, 4, 16.00, NULL),
	   (1, 4, 3, 4, 3.00, NULL),
	   (1, 5, NULL, NULL, NULL, 'N\'OUBLIEZ PAS LA ROTATION'),
	   (1, 6, NULL, NULL, NULL, 'L\'ALIGNEMENT EST RECOMMENDÉ');
