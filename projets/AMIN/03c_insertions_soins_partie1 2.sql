-- ============================================================================
-- SCRIPT D'INSERTION - PARTIE C (1/2) : TRAITEMENTS ET ACTES MÉDICAUX
-- Base de Données Clinique Dentaire DENTISSIMO
-- Oracle Database
-- ============================================================================
--
-- Ce script insère (MANQUANT DANS LE FICHIER ORIGINAL) :
--   1. TRAITEMENT (30 traitements)
--   2. ACTE_MEDICAL (60 actes médicaux)
--
-- Date : Novembre 2024
-- Auteur : Généré pour compléter le jeu de données
-- ============================================================================

-- ============================================================================
-- 1. INSERTION DES TRAITEMENTS
-- ============================================================================
-- 30 traitements liés aux dossiers patients existants (IDs 1-30)

PROMPT Insertion des traitements...

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (1, TO_DATE('2020-01-15', 'YYYY-MM-DD'), TO_DATE('2020-02-15', 'YYYY-MM-DD'), 'Soins conservateurs', 150.00, 'Terminé', 1);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (2, TO_DATE('2020-02-01', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'Détartrage et soins gencives', 90.00, 'Terminé', 2);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (3, TO_DATE('2020-02-10', 'YYYY-MM-DD'), NULL, 'Planification implant', 2500.00, 'En cours', 3);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (4, TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'Urgence dentaire', 250.00, 'Terminé', 4);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (5, TO_DATE('2020-03-20', 'YYYY-MM-DD'), TO_DATE('2020-04-20', 'YYYY-MM-DD'), 'Traitement carie profonde', 80.00, 'Terminé', 5);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (6, TO_DATE('2020-04-10', 'YYYY-MM-DD'), NULL, 'Pose implant dent 36', 1200.00, 'En cours', 6);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (7, TO_DATE('2020-06-15', 'YYYY-MM-DD'), TO_DATE('2020-07-15', 'YYYY-MM-DD'), 'Couronne céramique', 520.00, 'Terminé', 7);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (8, TO_DATE('2020-05-10', 'YYYY-MM-DD'), TO_DATE('2020-05-10', 'YYYY-MM-DD'), 'Blanchiment dentaire', 450.00, 'Terminé', 8);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (9, TO_DATE('2020-06-05', 'YYYY-MM-DD'), TO_DATE('2020-06-05', 'YYYY-MM-DD'), 'Soins multiples', 180.00, 'Terminé', 9);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (10, TO_DATE('2020-08-15', 'YYYY-MM-DD'), NULL, 'Traitement orthodontique', 3500.00, 'En cours', 10);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (11, TO_DATE('2020-09-10', 'YYYY-MM-DD'), NULL, 'Pose appareil', 1800.00, 'En cours', 11);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (12, TO_DATE('2020-10-15', 'YYYY-MM-DD'), TO_DATE('2020-10-15', 'YYYY-MM-DD'), 'Contrôle annuel', 80.00, 'Terminé', 12);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (13, TO_DATE('2021-01-10', 'YYYY-MM-DD'), TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'Soins parodontaux', 350.00, 'Terminé', 13);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (14, TO_DATE('2021-02-15', 'YYYY-MM-DD'), TO_DATE('2021-03-15', 'YYYY-MM-DD'), 'Surfaçage radiculaire', 350.00, 'Terminé', 14);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (15, TO_DATE('2021-03-20', 'YYYY-MM-DD'), TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'Consultation douleur', 80.00, 'Terminé', 15);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (16, TO_DATE('2021-05-15', 'YYYY-MM-DD'), TO_DATE('2021-05-15', 'YYYY-MM-DD'), 'Radio panoramique', 40.00, 'Terminé', 16);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (17, TO_DATE('2021-05-15', 'YYYY-MM-DD'), TO_DATE('2021-05-15', 'YYYY-MM-DD'), 'Extraction dentaire', 180.00, 'Terminé', 17);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (18, TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Pose facettes', 1200.00, 'Terminé', 18);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (19, TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Pose facettes suite', 600.00, 'Terminé', 19);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (20, TO_DATE('2021-09-10', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), 'Couronne zircone', 850.00, 'Terminé', 20);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (21, TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'Détartrage simple', 60.00, 'Terminé', 21);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (22, TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-01', 'YYYY-MM-DD'), 'Soins carie', 60.00, 'Terminé', 22);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (23, TO_DATE('2020-03-15', 'YYYY-MM-DD'), TO_DATE('2020-03-15', 'YYYY-MM-DD'), 'Urgence fracture', 120.00, 'Terminé', 23);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (24, TO_DATE('2020-05-20', 'YYYY-MM-DD'), TO_DATE('2020-06-20', 'YYYY-MM-DD'), 'Bridge 3 éléments', 2100.00, 'Terminé', 24);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (25, TO_DATE('2020-08-10', 'YYYY-MM-DD'), TO_DATE('2020-08-10', 'YYYY-MM-DD'), 'Soins multiples', 180.00, 'Terminé', 25);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (26, TO_DATE('2020-08-20', 'YYYY-MM-DD'), TO_DATE('2020-08-20', 'YYYY-MM-DD'), 'Soins multiples suite', 180.00, 'Terminé', 26);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (27, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), 'Obturation composite', 160.00, 'Terminé', 27);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (28, TO_DATE('2021-02-15', 'YYYY-MM-DD'), TO_DATE('2021-02-15', 'YYYY-MM-DD'), 'Extraction dent de sagesse', 180.00, 'Terminé', 28);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (29, TO_DATE('2021-04-20', 'YYYY-MM-DD'), NULL, 'Implants multiples', 4500.00, 'En cours', 29);

INSERT INTO TRAITEMENT (ID_Traitement, Date_Début, Date_Fin, Description, Coût_Total, Statut, ID_Dossier)
VALUES (30, TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-07-01', 'YYYY-MM-DD'), 'Contrôle post-op', 60.00, 'Terminé', 30);

COMMIT;

PROMPT 30 traitements insérés.


-- ============================================================================
-- 2. INSERTION DES ACTES MÉDICAUX
-- ============================================================================
-- 60 actes médicaux liés aux traitements (IDs 1-60)
-- ID_Personnel 1 = Dr. Dupont (Dentiste)

PROMPT Insertion des actes médicaux...

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (1, 'Consultation', TO_DATE('2020-01-20', 'YYYY-MM-DD'), 30, 60.00, 'Consultation initiale', 'N', 'N', 1, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (2, 'Détartrage', TO_DATE('2020-02-10', 'YYYY-MM-DD'), 45, 90.00, 'Détartrage haut et bas', 'N', 'N', 2, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (3, 'Radio', TO_DATE('2020-02-15', 'YYYY-MM-DD'), 15, 30.00, 'Radio rétro-alvéolaire', 'O', 'N', 3, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (4, 'Obturation', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 60, 250.00, 'Obturation 3 faces', 'N', 'O', 4, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (5, 'Cone Beam', TO_DATE('2020-03-25', 'YYYY-MM-DD'), 30, 80.00, 'Scanner 3D pré-implant', 'O', 'N', 3, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (6, 'Chirurgie', TO_DATE('2020-04-15', 'YYYY-MM-DD'), 120, 1200.00, 'Pose implant titane', 'N', 'O', 6, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (7, 'Prothèse', TO_DATE('2020-06-20', 'YYYY-MM-DD'), 60, 520.00, 'Pose couronne céramique', 'N', 'N', 7, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (8, 'Blanchiment', TO_DATE('2020-05-15', 'YYYY-MM-DD'), 90, 450.00, 'Séance blanchiment fauteuil', 'N', 'N', 8, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (9, 'Soins', TO_DATE('2020-06-10', 'YYYY-MM-DD'), 60, 180.00, 'Soins caries multiples', 'N', 'N', 9, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (10, 'Consultation Ortho', TO_DATE('2020-08-20', 'YYYY-MM-DD'), 45, 120.00, 'Bilan orthodontique', 'O', 'N', 10, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (11, 'Pose Appareil', TO_DATE('2020-09-15', 'YYYY-MM-DD'), 120, 1800.00, 'Pose bagues haut et bas', 'N', 'O', 11, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (12, 'Contrôle', TO_DATE('2020-10-20', 'YYYY-MM-DD'), 30, 80.00, 'Visite de contrôle', 'N', 'N', 12, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (13, 'Parodontologie', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 60, 350.00, 'Surfaçage quadrant 1', 'O', 'O', 13, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (14, 'Parodontologie', TO_DATE('2021-02-20', 'YYYY-MM-DD'), 60, 350.00, 'Surfaçage quadrant 2', 'N', 'O', 14, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (15, 'Urgence', TO_DATE('2021-03-25', 'YYYY-MM-DD'), 30, 80.00, 'Consultation urgence douleur', 'N', 'O', 15, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (16, 'Radio', TO_DATE('2021-05-20', 'YYYY-MM-DD'), 20, 40.00, 'Panoramique dentaire', 'O', 'N', 16, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (17, 'Extraction', TO_DATE('2021-05-20', 'YYYY-MM-DD'), 45, 180.00, 'Extraction dent 38', 'N', 'O', 17, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (18, 'Esthétique', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 90, 600.00, 'Pose 2 facettes', 'N', 'N', 18, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (19, 'Esthétique', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 90, 600.00, 'Pose 2 facettes suite', 'N', 'N', 19, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (20, 'Prothèse', TO_DATE('2021-09-15', 'YYYY-MM-DD'), 60, 850.00, 'Couronne zircone sur 36', 'O', 'N', 20, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (21, 'Détartrage', TO_DATE('2022-01-25', 'YYYY-MM-DD'), 30, 60.00, 'Détartrage annuel', 'N', 'N', 21, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (22, 'Soins', TO_DATE('2022-02-05', 'YYYY-MM-DD'), 45, 60.00, 'Soin carie simple', 'N', 'N', 22, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (23, 'Urgence', TO_DATE('2020-03-18', 'YYYY-MM-DD'), 45, 120.00, 'Reconstruction fracture', 'O', 'N', 23, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (24, 'Prothèse', TO_DATE('2020-05-25', 'YYYY-MM-DD'), 120, 2100.00, 'Pose bridge 3 éléments', 'O', 'N', 24, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (25, 'Soins', TO_DATE('2020-08-15', 'YYYY-MM-DD'), 60, 180.00, 'Soins multiples Q1', 'O', 'N', 25, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (26, 'Soins', TO_DATE('2020-08-22', 'YYYY-MM-DD'), 60, 180.00, 'Soins multiples Q2', 'N', 'N', 26, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (27, 'Soins', TO_DATE('2020-09-10', 'YYYY-MM-DD'), 45, 160.00, 'Obturation composite', 'N', 'N', 27, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (28, 'Extraction', TO_DATE('2021-02-20', 'YYYY-MM-DD'), 45, 180.00, 'Extraction 48', 'N', 'O', 28, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (29, 'Chirurgie', TO_DATE('2021-04-28', 'YYYY-MM-DD'), 150, 1350.00, 'Pose 2 implants', 'O', 'O', 29, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (30, 'Contrôle', TO_DATE('2021-07-05', 'YYYY-MM-DD'), 30, 60.00, 'Contrôle cicatrisation', 'N', 'N', 30, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (31, 'Endodontie', TO_DATE('2021-09-18', 'YYYY-MM-DD'), 90, 380.00, 'Traitement canalaire 46', 'O', 'N', 1, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (32, 'Urgence', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 30, 80.00, 'Abcès dentaire', 'O', 'O', 2, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (33, 'Soins', TO_DATE('2022-01-12', 'YYYY-MM-DD'), 45, 170.00, 'Drainage abcès', 'N', 'O', 2, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (34, 'Consultation', TO_DATE('2022-03-18', 'YYYY-MM-DD'), 30, 80.00, 'Consultation douleur', 'N', 'N', 3, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (35, 'Prothèse', TO_DATE('2022-05-25', 'YYYY-MM-DD'), 60, 680.00, 'Inlay-core + Couronne', 'N', 'N', 3, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (36, 'Urgence', TO_DATE('2021-02-12', 'YYYY-MM-DD'), 45, 420.00, 'Reconstruction fracture', 'O', 'N', 4, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (37, 'Gouttière', TO_DATE('2021-04-20', 'YYYY-MM-DD'), 45, 350.00, 'Prise empreinte gouttière', 'N', 'N', 5, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (38, 'Détartrage', TO_DATE('2021-06-28', 'YYYY-MM-DD'), 45, 150.00, 'Détartrage surfaçage', 'N', 'N', 6, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (39, 'Consultation', TO_DATE('2021-08-15', 'YYYY-MM-DD'), 30, 75.00, 'Avis implant', 'N', 'N', 7, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (40, 'Cone Beam', TO_DATE('2021-10-22', 'YYYY-MM-DD'), 30, 100.00, 'Scanner pré-implant', 'O', 'N', 7, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (41, 'Chirurgie', TO_DATE('2021-11-15', 'YYYY-MM-DD'), 150, 2400.00, 'Pose 2 implants', 'N', 'O', 7, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (42, 'Contrôle', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 30, 80.00, 'Contrôle ostéointégration', 'O', 'N', 7, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (43, 'Soins', TO_DATE('2022-01-18', 'YYYY-MM-DD'), 60, 320.00, 'Obturation profonde', 'O', 'N', 8, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (44, 'Parodontologie', TO_DATE('2022-03-30', 'YYYY-MM-DD'), 60, 360.00, 'Bilan parodontal complet', 'O', 'N', 9, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (45, 'Parodontologie', TO_DATE('2022-05-10', 'YYYY-MM-DD'), 60, 360.00, 'Surfaçage généralisé', 'N', 'O', 9, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (46, 'Contrôle', TO_DATE('2022-05-12', 'YYYY-MM-DD'), 30, 120.00, 'Contrôle maintenance', 'N', 'N', 9, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (47, 'Consultation', TO_DATE('2020-03-15', 'YYYY-MM-DD'), 30, 70.00, 'Consultation simple', 'N', 'N', 10, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (48, 'Consultation', TO_DATE('2020-06-22', 'YYYY-MM-DD'), 30, 70.00, 'Consultation simple', 'N', 'N', 11, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (49, 'Consultation', TO_DATE('2021-04-10', 'YYYY-MM-DD'), 30, 100.00, 'Consultation urgence', 'N', 'N', 12, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (50, 'Contrôle', TO_DATE('2021-10-01', 'YYYY-MM-DD'), 15, 35.00, 'Contrôle rapide', 'O', 'N', 13, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (51, 'Consultation', TO_DATE('2020-11-20', 'YYYY-MM-DD'), 30, 70.00, 'Consultation', 'N', 'N', 14, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (52, 'Consultation', TO_DATE('2020-12-20', 'YYYY-MM-DD'), 30, 70.00, 'Consultation', 'N', 'N', 15, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (53, 'Consultation', TO_DATE('2021-01-20', 'YYYY-MM-DD'), 30, 70.00, 'Consultation', 'N', 'N', 16, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (54, 'Détartrage', TO_DATE('2021-03-20', 'YYYY-MM-DD'), 45, 150.00, 'Détartrage', 'N', 'N', 17, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (55, 'Contrôle', TO_DATE('2020-09-05', 'YYYY-MM-DD'), 20, 45.00, 'Contrôle radio', 'O', 'N', 18, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (56, 'Soins', TO_DATE('2021-06-01', 'YYYY-MM-DD'), 45, 80.00, 'Petit soin', 'N', 'N', 19, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (57, 'Radio', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 20, 50.00, 'Panoramique', 'O', 'N', 20, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (58, 'Consultation', TO_DATE('2021-02-18', 'YYYY-MM-DD'), 15, 40.00, 'Avis', 'N', 'N', 21, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (59, 'Consultation', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 15, 40.00, 'Avis', 'N', 'N', 22, 1);

INSERT INTO ACTE_MEDICAL (ID_Acte, Type_Acte, Date_Acte, Durée, Montant, Description, Nécessite_Radio, Nécessite_Prescription, ID_Traitement, ID_Personnel)
VALUES (60, 'Radio', TO_DATE('2022-05-15', 'YYYY-MM-DD'), 20, 50.00, 'Panoramique', 'O', 'N', 30, 1);

COMMIT;

PROMPT 60 actes médicaux insérés.
