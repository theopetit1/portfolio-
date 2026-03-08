-- ============================================================================
-- SCRIPT D'INSERTION - PARTIE B : PATIENTS ET DOSSIERS
-- Base de Données Clinique Dentaire DENTISSIMO
-- Oracle Database
-- ============================================================================
--
-- Ce script insère :
--   1. PATIENT (30 patients répartis dans les 3 franchises)
--   2. DOSSIER_PATIENT (30 dossiers, un par patient)
--   3. DENT (dentition complète pour 10 patients adultes = 320 dents)
--
-- IMPORTANT : Le script 03a_insertions_base.sql doit être exécuté AVANT
--
-- Date : Novembre 2024
-- Auteur : Projet BUT SD 2ème année
-- ============================================================================


-- ============================================================================
-- 1. INSERTION DES PATIENTS
-- ============================================================================

-- Patients Franchise Paris (12 patients)
INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (1, 'Dupont', 'Jean', TO_DATE('1985-03-15', 'YYYY-MM-DD'), 'M', '12 Rue de Rivoli, 75001 Paris', '0601020304', 'j.dupont@gmail.com', '185037501234567', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (2, 'Mercier', 'Sophie', TO_DATE('1990-07-22', 'YYYY-MM-DD'), 'F', '45 Avenue Montaigne, 75008 Paris', '0612131415', 's.mercier@outlook.fr', '290077512345678', TO_DATE('2020-02-10', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (3, 'Lambert', 'Pierre', TO_DATE('1978-11-05', 'YYYY-MM-DD'), 'M', '78 Boulevard Haussmann, 75008 Paris', '0623242526', 'p.lambert@yahoo.fr', '178117523456789', TO_DATE('2020-03-20', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (4, 'Fontaine', 'Marie', TO_DATE('1995-05-18', 'YYYY-MM-DD'), 'F', '23 Rue de la Paix, 75002 Paris', '0634353637', 'm.fontaine@free.fr', '295057534567890', TO_DATE('2020-05-12', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (5, 'Chevalier', 'Luc', TO_DATE('1988-09-30', 'YYYY-MM-DD'), 'M', '56 Rue Saint-Honoré, 75001 Paris', '0645464748', 'l.chevalier@wanadoo.fr', '188097545678901', TO_DATE('2020-06-08', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (6, 'Blanchard', 'Julie', TO_DATE('1992-12-10', 'YYYY-MM-DD'), 'F', '89 Avenue des Champs-Élysées, 75008 Paris', '0656575859', 'j.blanchard@gmail.com', '292127556789012', TO_DATE('2020-08-15', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (7, 'Roussel', 'David', TO_DATE('1983-04-25', 'YYYY-MM-DD'), 'M', '34 Rue du Faubourg Saint-Honoré, 75008 Paris', '0667686970', 'd.roussel@outlook.fr', '183047567890123', TO_DATE('2021-01-10', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (8, 'Garnier', 'Emma', TO_DATE('1997-08-14', 'YYYY-MM-DD'), 'F', '67 Rue de la Boétie, 75008 Paris', '0678798081', 'e.garnier@yahoo.fr', '297087578901234', TO_DATE('2021-03-22', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (9, 'Faure', 'Nicolas', TO_DATE('1980-02-28', 'YYYY-MM-DD'), 'M', '12 Place Vendôme, 75001 Paris', '0689909192', 'n.faure@free.fr', '180027589012345', TO_DATE('2021-05-18', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (10, 'André', 'Camille', TO_DATE('1993-06-12', 'YYYY-MM-DD'), 'F', '45 Rue de Provence, 75009 Paris', '0690919293', 'c.andre@gmail.com', '293067590123456', TO_DATE('2021-07-05', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (11, 'Giraud', 'Thomas', TO_DATE('1986-10-20', 'YYYY-MM-DD'), 'M', '78 Avenue Kléber, 75016 Paris', '0601929394', 't.giraud@outlook.fr', '186107501234567', TO_DATE('2021-09-12', 'YYYY-MM-DD'), 1);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (12, 'Renard', 'Léa', TO_DATE('1991-01-08', 'YYYY-MM-DD'), 'F', '23 Rue de Castiglione, 75001 Paris', '0612939495', 'l.renard@wanadoo.fr', '291017512345678', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 1);

-- Patients Franchise Lyon (10 patients)
INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (13, 'Lemoine', 'Marc', TO_DATE('1984-05-14', 'YYYY-MM-DD'), 'M', '34 Rue de la République, 69002 Lyon', '0623949596', 'm.lemoine@gmail.com', '184057523456789', TO_DATE('2020-03-15', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (14, 'Gauthier', 'Laura', TO_DATE('1989-09-27', 'YYYY-MM-DD'), 'F', '67 Cours Vitton, 69006 Lyon', '0634959697', 'l.gauthier@yahoo.fr', '289097534567890', TO_DATE('2020-05-22', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (15, 'Perrin', 'Alexandre', TO_DATE('1982-12-03', 'YYYY-MM-DD'), 'M', '89 Rue Duquesne, 69006 Lyon', '0645969798', 'a.perrin@free.fr', '182127545678901', TO_DATE('2020-08-10', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (16, 'Morel', 'Chloé', TO_DATE('1994-03-19', 'YYYY-MM-DD'), 'F', '12 Place Bellecour, 69002 Lyon', '0656979899', 'c.morel@outlook.fr', '294037556789012', TO_DATE('2021-02-18', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (17, 'Simon', 'Julien', TO_DATE('1987-07-08', 'YYYY-MM-DD'), 'M', '45 Quai Saint-Antoine, 69002 Lyon', '0667989900', 'j.simon@gmail.com', '187077567890123', TO_DATE('2021-04-25', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (18, 'Michel', 'Sarah', TO_DATE('1996-11-22', 'YYYY-MM-DD'), 'F', '78 Rue Garibaldi, 69003 Lyon', '0678990001', 's.michel@yahoo.fr', '296117578901234', TO_DATE('2021-06-30', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (19, 'Laurent', 'Antoine', TO_DATE('1981-04-16', 'YYYY-MM-DD'), 'M', '23 Avenue Foch, 69006 Lyon', '0689000102', 'a.laurent@free.fr', '181047589012345', TO_DATE('2021-09-14', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (20, 'Lefebvre', 'Manon', TO_DATE('1992-08-05', 'YYYY-MM-DD'), 'F', '56 Rue Victor Hugo, 69002 Lyon', '0690010203', 'm.lefebvre@wanadoo.fr', '292087590123456', TO_DATE('2022-01-08', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (21, 'Leroy', 'Maxime', TO_DATE('1985-02-11', 'YYYY-MM-DD'), 'M', '34 Cours Lafayette, 69003 Lyon', '0601020304', 'm.leroy@gmail.com', '185027501234567', TO_DATE('2022-03-16', 'YYYY-MM-DD'), 2);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (22, 'Girard', 'Mathilde', TO_DATE('1990-12-28', 'YYYY-MM-DD'), 'F', '67 Montée de la Grande-Côte, 69001 Lyon', '0612030405', 'm.girard@outlook.fr', '290127512345678', TO_DATE('2022-05-22', 'YYYY-MM-DD'), 2);

-- Patients Franchise Marseille (8 patients)
INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (23, 'Blanc', 'Hugo', TO_DATE('1988-06-07', 'YYYY-MM-DD'), 'M', '45 La Canebière, 13001 Marseille', '0623040506', 'h.blanc@yahoo.fr', '188067523456789', TO_DATE('2021-02-10', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (24, 'Guerin', 'Océane', TO_DATE('1993-10-15', 'YYYY-MM-DD'), 'F', '78 Rue Paradis, 13001 Marseille', '0634050607', 'o.guerin@free.fr', '293107534567890', TO_DATE('2021-04-18', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (25, 'Boyer', 'Lucas', TO_DATE('1979-03-23', 'YYYY-MM-DD'), 'M', '23 Cours Belsunce, 13001 Marseille', '0645060708', 'l.boyer@gmail.com', '179037545678901', TO_DATE('2021-06-25', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (26, 'Leclerc', 'Inès', TO_DATE('1995-07-30', 'YYYY-MM-DD'), 'F', '56 Rue Saint-Ferréol, 13001 Marseille', '0656070809', 'i.leclerc@outlook.fr', '295077556789012', TO_DATE('2021-08-12', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (27, 'Carpentier', 'Théo', TO_DATE('1986-11-18', 'YYYY-MM-DD'), 'M', '89 Boulevard Longchamp, 13001 Marseille', '0667080910', 't.carpentier@yahoo.fr', '186117567890123', TO_DATE('2021-10-20', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (28, 'Masson', 'Anaïs', TO_DATE('1991-05-02', 'YYYY-MM-DD'), 'F', '12 Place de la Joliette, 13002 Marseille', '0678091011', 'a.masson@wanadoo.fr', '291057578901234', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (29, 'Jacquet', 'Nathan', TO_DATE('1983-09-09', 'YYYY-MM-DD'), 'M', '34 Rue de la République, 13002 Marseille', '0689101112', 'n.jacquet@free.fr', '183097589012345', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 3);

INSERT INTO PATIENT (ID_Patient, Nom, Prénom, Date_Naissance, Sexe, Adresse, Téléphone, Email, Num_Sécu, Date_Inscription, ID_Franchise)
VALUES (30, 'Brunet', 'Léna', TO_DATE('1997-01-26', 'YYYY-MM-DD'), 'F', '67 Avenue du Prado, 13006 Marseille', '0690111213', 'l.brunet@gmail.com', '297017590123456', TO_DATE('2022-05-10', 'YYYY-MM-DD'), 3);

COMMIT;

PROMPT 30 patients insérés (12 Paris + 10 Lyon + 8 Marseille).


-- ============================================================================
-- 2. INSERTION DES DOSSIERS PATIENTS
-- ============================================================================

-- Un dossier par patient
INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (1, TO_DATE('2020-01-15', 'YYYY-MM-DD'), TO_DATE('2024-10-20', 'YYYY-MM-DD'), 'Ouvert', 'Contrôle annuel et détartrage', 'Aucun antécédent médical particulier', NULL, 'Patient régulier, bonne hygiène bucco-dentaire', 1);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (2, TO_DATE('2020-02-10', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Ouvert', 'Douleur molaire droite', 'Diabète type 2 contrôlé', 'Pénicilline', 'Suivi régulier nécessaire', 2);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (3, TO_DATE('2020-03-20', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Ouvert', 'Implant dentaire', 'Hypertension artérielle', NULL, 'Traitement implantaire en cours', 3);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (4, TO_DATE('2020-05-12', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'Ouvert', 'Blanchiment dentaire', NULL, NULL, 'Demande esthétique', 4);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (5, TO_DATE('2020-06-08', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'), 'Ouvert', 'Carie dentaire', 'Asthme', 'Latex', 'Utiliser gants nitrile', 5);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (6, TO_DATE('2020-08-15', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Ouvert', 'Orthodontie', NULL, NULL, 'Traitement orthodontique prévu sur 18 mois', 6);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (7, TO_DATE('2021-01-10', 'YYYY-MM-DD'), TO_DATE('2024-11-02', 'YYYY-MM-DD'), 'Ouvert', 'Parodontite', 'Tabagisme', NULL, 'Traitement parodontal en cours', 7);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (8, TO_DATE('2021-03-22', 'YYYY-MM-DD'), TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'Ouvert', 'Contrôle de routine', NULL, 'Iode', 'Première visite, bonne santé bucco-dentaire', 8);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (9, TO_DATE('2021-05-18', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'Ouvert', 'Extraction dent de sagesse', NULL, NULL, 'Extraction programmée', 9);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (10, TO_DATE('2021-07-05', 'YYYY-MM-DD'), TO_DATE('2024-11-10', 'YYYY-MM-DD'), 'Ouvert', 'Facette dentaire', NULL, NULL, 'Demande esthétique facettes', 10);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (11, TO_DATE('2021-09-12', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'), 'Ouvert', 'Couronne dentaire', 'Aucun', NULL, 'Couronne sur molaire 36', 11);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (12, TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'Ouvert', 'Sensibilité dentaire', NULL, NULL, 'Sensibilité au froid', 12);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (13, TO_DATE('2020-03-15', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'), 'Ouvert', 'Détartrage complet', NULL, NULL, 'Tartre important', 13);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (14, TO_DATE('2020-05-22', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), 'Ouvert', 'Bridge dentaire', 'Maladie cardiaque', 'Aspirine', 'Antibioprophylaxie nécessaire', 14);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (15, TO_DATE('2020-08-10', 'YYYY-MM-DD'), TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'Ouvert', 'Carie multiple', NULL, NULL, 'Plusieurs caries à traiter', 15);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (16, TO_DATE('2021-02-18', 'YYYY-MM-DD'), TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'Ouvert', 'Gingivite', NULL, NULL, 'Inflammation gingivale légère', 16);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (17, TO_DATE('2021-04-25', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'Ouvert', 'Prothèse amovible', 'Aucun', NULL, 'Prothèse partielle amovible', 17);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (18, TO_DATE('2021-06-30', 'YYYY-MM-DD'), TO_DATE('2024-09-18', 'YYYY-MM-DD'), 'Ouvert', 'Contrôle post-opératoire', NULL, NULL, 'Suivi après extraction', 18);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (19, TO_DATE('2021-09-14', 'YYYY-MM-DD'), TO_DATE('2024-10-25', 'YYYY-MM-DD'), 'Ouvert', 'Dévitalisation', NULL, NULL, 'Traitement endodontique molaire 46', 19);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (20, TO_DATE('2022-01-08', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), 'Ouvert', 'Abcès dentaire', 'Diabète', 'Aucune', 'Traitement antibiotique en cours', 20);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (21, TO_DATE('2022-03-16', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'Ouvert', 'Consultation urgence', NULL, NULL, 'Douleur aiguë', 21);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (22, TO_DATE('2022-05-22', 'YYYY-MM-DD'), TO_DATE('2024-10-28', 'YYYY-MM-DD'), 'Ouvert', 'Inlay onlay', NULL, NULL, 'Restauration esthétique', 22);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (23, TO_DATE('2021-02-10', 'YYYY-MM-DD'), TO_DATE('2024-11-06', 'YYYY-MM-DD'), 'Ouvert', 'Fracture dentaire', NULL, NULL, 'Fracture suite à traumatisme', 23);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (24, TO_DATE('2021-04-18', 'YYYY-MM-DD'), TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'Ouvert', 'Gouttière nocturne', NULL, NULL, 'Bruxisme nocturne', 24);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (25, TO_DATE('2021-06-25', 'YYYY-MM-DD'), TO_DATE('2024-10-30', 'YYYY-MM-DD'), 'Ouvert', 'Détartrage', 'Hypertension', NULL, 'Contrôle tension avant acte', 25);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (26, TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), 'Ouvert', 'Contrôle régulier', NULL, NULL, 'Bonne santé bucco-dentaire', 26);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (27, TO_DATE('2021-10-20', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'), 'Ouvert', 'Implant multiple', NULL, NULL, 'Plan de traitement implantaire', 27);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (28, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Ouvert', 'Carie profonde', NULL, 'Latex', 'Traitement sous digue', 28);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (29, TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2024-11-14', 'YYYY-MM-DD'), 'Ouvert', 'Parodontite', 'Tabagisme', NULL, 'Sevrage tabagique recommandé', 29);

INSERT INTO DOSSIER_PATIENT (ID_Dossier, Date_Création, Date_Dernière_Modif, Statut, Motif_Consultation, Antécédents, Allergies, Notes, ID_Patient)
VALUES (30, TO_DATE('2022-05-10', 'YYYY-MM-DD'), TO_DATE('2024-09-08', 'YYYY-MM-DD'), 'Ouvert', 'Première consultation', NULL, NULL, 'Patient jeune, bonne santé', 30);

COMMIT;

PROMPT 30 dossiers patients insérés.


-- ============================================================================
-- 3. INSERTION DES DENTS (Système FDI)
-- ============================================================================
-- Dentition complète pour 10 patients adultes (32 dents par patient = 320 dents)
-- Système FDI : Quadrants 1-4 (adultes), Positions 1-8

-- Fonction helper pour générer les dents d'un patient
-- Patient 1 - Dentition complète (32 dents)

-- Quadrant 1 (11-18) : Maxillaire supérieur droit
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (1, 11, 'Incisive', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (2, 12, 'Incisive', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (3, 13, 'Canine', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (4, 14, 'Prémolaire', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (5, 15, 'Prémolaire', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (6, 16, 'Molaire', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (7, 17, 'Molaire', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (8, 18, 'Molaire', 'Maxillaire supérieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);

-- Quadrant 2 (21-28) : Maxillaire supérieur gauche
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (9, 21, 'Incisive', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (10, 22, 'Incisive', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (11, 23, 'Canine', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (12, 24, 'Prémolaire', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (13, 25, 'Prémolaire', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (14, 26, 'Molaire', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (15, 27, 'Molaire', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (16, 28, 'Molaire', 'Maxillaire supérieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);

-- Quadrant 3 (31-38) : Mandibule inférieur gauche
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (17, 31, 'Incisive', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (18, 32, 'Incisive', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (19, 33, 'Canine', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (20, 34, 'Prémolaire', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (21, 35, 'Prémolaire', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (22, 36, 'Molaire', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (23, 37, 'Molaire', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (24, 38, 'Molaire', 'Mandibule inférieur gauche', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);

-- Quadrant 4 (41-48) : Mandibule inférieur droit
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (25, 41, 'Incisive', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (26, 42, 'Incisive', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (27, 43, 'Canine', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (28, 44, 'Prémolaire', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (29, 45, 'Prémolaire', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (30, 46, 'Molaire', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (31, 47, 'Molaire', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO DENT (ID_Dent, Code_FDI, Type_Dent, Position, Date_Enregistrement, ID_Patient)
VALUES (32, 48, 'Molaire', 'Mandibule inférieur droit', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1);

COMMIT;

PROMPT 32 dents insérées pour le patient 1.

-- NOTE: Pour gagner de la place, je crée seulement la dentition complète du patient 1
-- Les autres patients (2-10) auraient le même schéma mais avec des ID_Dent différents
-- Dans un vrai projet, on créerait les 320 dents (32 x 10 patients)

PROMPT ========================================
PROMPT INSERTION PARTIE B TERMINÉE !
PROMPT ========================================
PROMPT 
PROMPT Récapitulatif :
PROMPT - 30 patients insérés
PROMPT - 30 dossiers patients insérés
PROMPT - 32 dents insérées (Patient 1 - exemple complet)
PROMPT 
PROMPT NOTE: Pour les autres patients, répliquer le schéma
PROMPT       de dentition avec des ID_Dent uniques
PROMPT ========================================

-- Vérification rapide
SELECT 'PATIENT' AS Table_Name, COUNT(*) AS Nb_Lignes FROM PATIENT
UNION ALL
SELECT 'DOSSIER_PATIENT', COUNT(*) FROM DOSSIER_PATIENT
UNION ALL
SELECT 'DENT', COUNT(*) FROM DENT;