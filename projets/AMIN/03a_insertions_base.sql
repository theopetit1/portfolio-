-- ============================================================================
-- SCRIPT D'INSERTION - PARTIE A : DONNÉES DE BASE
-- Base de Données Clinique Dentaire DENTISSIMO
-- Oracle Database
-- ============================================================================
--
-- Ce script insère les données de base nécessaires au fonctionnement :
--   1. FRANCHISE (3 franchises)
--   2. FOURNISSEUR (5 fournisseurs)
--   3. PRODUIT_DENTAIRE (20 produits)
--   4. PERSONNEL (15 personnes : 10 internes + 5 externes)
--   5. ÉQUIPEMENT (12 équipements répartis dans les franchises)
--
-- IMPORTANT : Ces données doivent être insérées EN PREMIER car elles sont
--             référencées par les autres tables (pas de dépendances FK)
--
-- Date : Novembre 2024
-- Auteur : Projet BUT SD 2ème année
-- ============================================================================


-- ============================================================================
-- 1. INSERTION DES FRANCHISES
-- ============================================================================

INSERT INTO FRANCHISE (ID_Franchise, Nom, Adresse, Ville, Code_Postal, Téléphone, Email, Date_Ouverture)
VALUES (1, 'Dentissimo Paris Centre', '45 Avenue des Champs-Élysées', 'Paris', '75008', '0142563478', 'paris@dentissimo.fr', TO_DATE('2018-03-15', 'YYYY-MM-DD'));

INSERT INTO FRANCHISE (ID_Franchise, Nom, Adresse, Ville, Code_Postal, Téléphone, Email, Date_Ouverture)
VALUES (2, 'Dentissimo Lyon Confluence', '12 Rue de la République', 'Lyon', '69002', '0478453621', 'lyon@dentissimo.fr', TO_DATE('2019-06-20', 'YYYY-MM-DD'));

INSERT INTO FRANCHISE (ID_Franchise, Nom, Adresse, Ville, Code_Postal, Téléphone, Email, Date_Ouverture)
VALUES (3, 'Dentissimo Marseille Vieux-Port', '78 La Canebière', 'Marseille', '13001', '0491325476', 'marseille@dentissimo.fr', TO_DATE('2020-09-10', 'YYYY-MM-DD'));

COMMIT;

PROMPT 3 franchises insérées.


-- ============================================================================
-- 2. INSERTION DES FOURNISSEURS
-- ============================================================================

INSERT INTO FOURNISSEUR (ID_Fournisseur, Nom, Adresse, Téléphone, Email, SIRET, Contact_Principal)
VALUES (1, 'DentalSupply France', '34 Rue de la Santé, 75014 Paris', '0145678901', 'contact@dentalsupply.fr', '12345678901234', 'Marie Dubois');

INSERT INTO FOURNISSEUR (ID_Fournisseur, Nom, Adresse, Téléphone, Email, SIRET, Contact_Principal)
VALUES (2, 'MediDent Pro', '56 Avenue Foch, 69006 Lyon', '0478901234', 'info@medidentpro.fr', '23456789012345', 'Pierre Martin');

INSERT INTO FOURNISSEUR (ID_Fournisseur, Nom, Adresse, Téléphone, Email, SIRET, Contact_Principal)
VALUES (3, 'OralTech Solutions', '89 Boulevard Haussmann, 75008 Paris', '0142345678', 'commercial@oraltech.fr', '34567890123456', 'Sophie Lefebvre');

INSERT INTO FOURNISSEUR (ID_Fournisseur, Nom, Adresse, Téléphone, Email, SIRET, Contact_Principal)
VALUES (4, 'Cabinet Dentaire Équipements', '23 Rue Paradis, 13001 Marseille', '0491234567', 'ventes@cde-medical.fr', '45678901234567', 'Julien Mercier');

INSERT INTO FOURNISSEUR (ID_Fournisseur, Nom, Adresse, Téléphone, Email, SIRET, Contact_Principal)
VALUES (5, 'ProtoDent International', '12 Rue de Rivoli, 75001 Paris', '0140987654', 'contact@protodent.com', '56789012345678', 'Laurent Bernard');

COMMIT;

PROMPT 5 fournisseurs insérés.


-- ============================================================================
-- 3. INSERTION DES PRODUITS DENTAIRES
-- ============================================================================

-- Anesthésiques
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (1, 'Lidocaïne 2%', 'Anesthésique', 'Anesthésique local avec vasoconstricteur', 12.50, 150, 50, 'flacon');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (2, 'Articaïne 4%', 'Anesthésique', 'Anesthésique local longue durée', 15.80, 120, 40, 'flacon');

-- Matériaux d'obturation
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (3, 'Composite Universel', 'Matériau_Obturation', 'Composite photopolymérisable universel', 45.00, 80, 30, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (4, 'Amalgame dentaire', 'Matériau_Obturation', 'Amalgame argent-étain pour restaurations postérieures', 35.00, 60, 25, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (5, 'Ciment verre ionomère', 'Matériau_Obturation', 'Ciment de restauration et scellement', 28.50, 70, 30, 'boîte');

-- Implants et couronnes
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (6, 'Implant Titane Grade 4', 'Implant', 'Implant dentaire en titane biocompatible', 280.00, 40, 15, 'pièce');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (7, 'Couronne Céramique', 'Prothèse', 'Couronne en céramique esthétique', 350.00, 30, 10, 'pièce');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (8, 'Couronne Zircone', 'Prothèse', 'Couronne en zircone haute résistance', 420.00, 25, 10, 'pièce');

-- Produits de désinfection
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (9, 'Désinfectant surface', 'Désinfection', 'Solution désinfectante pour surfaces', 18.00, 200, 80, 'flacon');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (10, 'Stérilisant instruments', 'Désinfection', 'Solution pour stérilisation instruments', 25.00, 150, 60, 'flacon');

-- Matériel consommable
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (11, 'Gants latex stériles', 'Consommable', 'Gants latex stériles taille M', 8.50, 500, 200, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (12, 'Masques chirurgicaux', 'Consommable', 'Masques chirurgicaux 3 plis', 6.00, 600, 250, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (13, 'Coton rouleaux', 'Consommable', 'Rouleaux de coton salivaire', 4.50, 400, 150, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (14, 'Compresses stériles', 'Consommable', 'Compresses de gaze stériles', 5.00, 350, 150, 'boîte');

-- Produits spécialisés
INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (15, 'Gel fluoré', 'Prévention', 'Gel fluoré pour application topique', 22.00, 100, 40, 'flacon');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (16, 'Résine dentaire', 'Matériau_Obturation', 'Résine composite haute esthétique', 55.00, 60, 25, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (17, 'Adhésif dentinaire', 'Matériau', 'Adhésif pour liaison émail-dentine', 38.00, 90, 35, 'flacon');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (18, 'Blanchiment professionnel', 'Esthétique', 'Kit de blanchiment dentaire professionnel', 75.00, 50, 20, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (19, 'Cire orthodontique', 'Orthodontie', 'Cire de protection pour appareils', 8.00, 120, 50, 'boîte');

INSERT INTO PRODUIT_DENTAIRE (ID_Produit, Nom, Catégorie, Description, Prix_Unitaire, Stock_Actuel, Stock_Min, Unité)
VALUES (20, 'Fil dentaire médical', 'Prévention', 'Fil dentaire circulaire professionnel', 12.00, 200, 80, 'boîte');

COMMIT;

PROMPT 20 produits dentaires insérés.


-- ============================================================================
-- 4. INSERTION DU PERSONNEL
-- ============================================================================

-- Personnel INTERNE (10 personnes réparties dans les franchises)

-- Franchise Paris (5 personnes)
INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (1, 'Interne', 'Durand', 'Sophie', 'Chirurgie dentaire', 'Dentiste', '0612345678', 's.durand@dentissimo.fr', TO_DATE('2018-04-01', 'YYYY-MM-DD'), 1);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (2, 'Interne', 'Martin', 'Jean', 'Orthodontie', 'Orthodontiste', '0623456789', 'j.martin@dentissimo.fr', TO_DATE('2018-06-15', 'YYYY-MM-DD'), 1);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (3, 'Interne', 'Petit', 'Marie', 'Hygiène dentaire', 'Hygiéniste', '0634567890', 'm.petit@dentissimo.fr', TO_DATE('2019-01-10', 'YYYY-MM-DD'), 1);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (4, 'Interne', 'Leclerc', 'Thomas', 'Assistance dentaire', 'Assistant dentaire', '0645678901', 't.leclerc@dentissimo.fr', TO_DATE('2019-03-20', 'YYYY-MM-DD'), 1);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (5, 'Interne', 'Moreau', 'Claire', 'Chirurgie dentaire', 'Dentiste', '0656789012', 'c.moreau@dentissimo.fr', TO_DATE('2019-09-01', 'YYYY-MM-DD'), 1);

-- Franchise Lyon (3 personnes)
INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (6, 'Interne', 'Bernard', 'Luc', 'Chirurgie dentaire', 'Dentiste', '0667890123', 'l.bernard@dentissimo.fr', TO_DATE('2019-07-01', 'YYYY-MM-DD'), 2);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (7, 'Interne', 'Dubois', 'Anne', 'Parodontologie', 'Parodontiste', '0678901234', 'a.dubois@dentissimo.fr', TO_DATE('2019-08-15', 'YYYY-MM-DD'), 2);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (8, 'Interne', 'Roux', 'Pierre', 'Assistance dentaire', 'Assistant dentaire', '0689012345', 'p.roux@dentissimo.fr', TO_DATE('2020-01-20', 'YYYY-MM-DD'), 2);

-- Franchise Marseille (2 personnes)
INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (9, 'Interne', 'Garcia', 'Laura', 'Chirurgie dentaire', 'Dentiste', '0690123456', 'l.garcia@dentissimo.fr', TO_DATE('2020-10-01', 'YYYY-MM-DD'), 3);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (10, 'Interne', 'Rousseau', 'Marc', 'Hygiène dentaire', 'Hygiéniste', '0601234567', 'm.rousseau@dentissimo.fr', TO_DATE('2020-11-15', 'YYYY-MM-DD'), 3);

-- Personnel EXTERNE (5 praticiens indépendants)

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (11, 'Externe', 'Lefebvre', 'Philippe', 'Implantologie', 'Implantologue', '0612349876', 'p.lefebvre@gmail.com', NULL, NULL);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (12, 'Externe', 'Simon', 'Isabelle', 'Endodontie', 'Endodontiste', '0623458765', 'i.simon@outlook.fr', NULL, NULL);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (13, 'Externe', 'Michel', 'François', 'Prothèse dentaire', 'Prothésiste', '0634567654', 'f.michel@yahoo.fr', NULL, NULL);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (14, 'Externe', 'Fournier', 'Nathalie', 'Chirurgie maxillo-faciale', 'Chirurgien', '0645676543', 'n.fournier@wanadoo.fr', NULL, NULL);

INSERT INTO PERSONNEL (ID_Personnel, Type, Nom, Prénom, Spécialité, Rôle, Téléphone, Email, Date_Embauche, ID_Franchise)
VALUES (15, 'Externe', 'Girard', 'Stéphane', 'Orthodontie', 'Orthodontiste', '0656785432', 's.girard@free.fr', NULL, NULL);

COMMIT;

PROMPT 15 membres du personnel insérés (10 internes + 5 externes).


-- ============================================================================
-- 5. INSERTION DES ÉQUIPEMENTS
-- ============================================================================

-- Équipements Franchise Paris (5 équipements)
INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (1, 'Fauteuil Dentaire Comfort Plus', 'Fauteuil', 'FDC-2018-001', TO_DATE('2018-03-10', 'YYYY-MM-DD'), 12000.00, 'Opérationnel', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 1);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (2, 'Appareil Radiologie Panoramique', 'Radiographie', 'RAD-PAN-2018-002', TO_DATE('2018-03-12', 'YYYY-MM-DD'), 35000.00, 'Opérationnel', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (3, 'Autoclave Stérilisateur', 'Stérilisation', 'AUT-STE-2018-003', TO_DATE('2018-03-15', 'YYYY-MM-DD'), 8500.00, 'Opérationnel', TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (4, 'Unit Dentaire Complet', 'Unit dentaire', 'UNIT-DEN-2019-004', TO_DATE('2019-02-20', 'YYYY-MM-DD'), 18000.00, 'Opérationnel', TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (5, 'Cone Beam CT', 'Imagerie', 'CBCT-2020-005', TO_DATE('2020-06-15', 'YYYY-MM-DD'), 65000.00, 'Opérationnel', TO_DATE('2024-08-30', 'YYYY-MM-DD'), 1);

-- Équipements Franchise Lyon (4 équipements)
INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (6, 'Fauteuil Dentaire Premium', 'Fauteuil', 'FDP-2019-006', TO_DATE('2019-06-15', 'YYYY-MM-DD'), 14000.00, 'Opérationnel', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 2);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (7, 'Radiographie Numérique', 'Radiographie', 'RAD-NUM-2019-007', TO_DATE('2019-06-18', 'YYYY-MM-DD'), 28000.00, 'Opérationnel', TO_DATE('2024-10-05', 'YYYY-MM-DD'), 2);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (8, 'Autoclave Classe B', 'Stérilisation', 'AUT-CLB-2019-008', TO_DATE('2019-06-20', 'YYYY-MM-DD'), 9500.00, 'Opérationnel', TO_DATE('2024-11-12', 'YYYY-MM-DD'), 2);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (9, 'Laser Dentaire Diode', 'Laser', 'LAS-DIO-2021-009', TO_DATE('2021-03-10', 'YYYY-MM-DD'), 22000.00, 'Opérationnel', TO_DATE('2024-07-20', 'YYYY-MM-DD'), 2);

-- Équipements Franchise Marseille (3 équipements)
INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (10, 'Fauteuil Dentaire Standard', 'Fauteuil', 'FDS-2020-010', TO_DATE('2020-09-05', 'YYYY-MM-DD'), 11000.00, 'Opérationnel', TO_DATE('2024-10-18', 'YYYY-MM-DD'), 3);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (11, 'Radiographie Intra-orale', 'Radiographie', 'RAD-INT-2020-011', TO_DATE('2020-09-08', 'YYYY-MM-DD'), 15000.00, 'Opérationnel', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 3);

INSERT INTO ÉQUIPEMENT (ID_Équipement, Nom, Type, Numéro_Série, Date_Acquisition, Prix, État, Date_Maintenance, ID_Franchise)
VALUES (12, 'Stérilisateur Instruments', 'Stérilisation', 'STE-INS-2020-012', TO_DATE('2020-09-10', 'YYYY-MM-DD'), 7500.00, 'Opérationnel', TO_DATE('2024-11-08', 'YYYY-MM-DD'), 3);

COMMIT;

PROMPT 12 équipements insérés (5 Paris + 4 Lyon + 3 Marseille).


-- ============================================================================
-- FIN DU SCRIPT PARTIE A
-- ============================================================================

PROMPT ========================================
PROMPT INSERTION PARTIE A TERMINÉE !
PROMPT ========================================
PROMPT 
PROMPT Récapitulatif :
PROMPT - 3 franchises insérées
PROMPT - 5 fournisseurs insérés
PROMPT - 20 produits dentaires insérés
PROMPT - 15 membres du personnel insérés
PROMPT - 12 équipements insérés
PROMPT 
PROMPT Total : 55 enregistrements
PROMPT ========================================

-- Vérification rapide
SELECT 'FRANCHISE' AS Table_Name, COUNT(*) AS Nb_Lignes FROM FRANCHISE
UNION ALL
SELECT 'FOURNISSEUR', COUNT(*) FROM FOURNISSEUR
UNION ALL
SELECT 'PRODUIT_DENTAIRE', COUNT(*) FROM PRODUIT_DENTAIRE
UNION ALL
SELECT 'PERSONNEL', COUNT(*) FROM PERSONNEL
UNION ALL
SELECT 'ÉQUIPEMENT', COUNT(*) FROM ÉQUIPEMENT;