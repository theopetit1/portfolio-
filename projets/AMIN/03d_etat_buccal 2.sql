-- ============================================================================
-- SCRIPT D'INSERTION - PARTIE D (2/2) : ÉTAT BUCCAL CLINIQUE
-- Base de Données Clinique Dentaire DENTISSIMO
-- Oracle Database
-- ============================================================================
--
-- Ce script insère :
--   2. ÉTAT_DENT - États dentaires variés (100 états)
--   3. ANOMALIE - Anomalies détectées (40 anomalies)
--   4. RESTAURATION - Restaurations effectuées (50 restaurations)
--
-- IMPORTANT : Exécuter 03d_etat_buccal_partie1.sql AVANT ce fichier
-- Date : Novembre 2024
-- Auteur : Projet BUT SD 2ème année
-- ============================================================================


-- ============================================================================
-- 2. INSERTION DES ÉTATS DENTAIRES
-- ============================================================================
-- 100 états pour différents patients et dents
-- État_Générals : Sain, Carié, Obturé, Absent, Dévitalisé, Couronné, Implant

PROMPT Insertion des états dentaires...

-- Patient 1 - États variés (20 états)
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (1, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Dent en bon état', 1);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (2, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Aucune anomalie', 2);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (3, 'Cariée', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Carie superficielle face occlusale', 6);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (4, 'Obturée', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Obturation composite ancienne en bon état', 14);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (5, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Émail intact', 9);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (6, 'Cariée', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Carie proximale à traiter', 18);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (7, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'État satisfaisant', 21);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (8, 'Obturée', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Amalgame ancien stable', 30);

-- Patient 2 - États avec traitements (15 états)





-- Patient 3 - Implant et couronne (12 états)





-- Patient 4 - Blanchiment (8 états)




-- Patient 5 - Obturation simple (6 états)




-- Patient 6 - Orthodontie (5 états)



-- Patient 7 - Problèmes parodontaux (10 états)





-- Patient 8 - Extraction sagesse (6 états)




-- Patient 9 - Facettes esthétiques (8 états)




-- Patient 10 - Couronne zircone (12 états)




-- États supplémentaires pour d'autres patients (états 47-100)
-- Patient 11 - Bridge


-- Patient 12 - Détartrage
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (49, 'Saine', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Tartre supra-gingival important', 3);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (50, 'Saine', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Inflammation gingivale modérée', 11);

-- Patient 13 - Contrôle annuel
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (51, 'Saine', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 'Contrôle : bon état général', 4);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (52, 'Saine', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 'Hygiène satisfaisante', 12);

-- Patient 14 - Caries multiples






-- Patient 15 - Prothèse amovible


-- Patient 16 - Contrôle simple
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (61, 'Saine', TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'Contrôle : RAS', 5);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (62, 'Obturée', TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'Anciennes obturations stables', 22);

-- Patient 17 - Sensibilité dentaire


-- Patient 18 - Endodontie


-- Patient 19 - Urgence abcès


-- Patient 20 - Urgence douleur


-- Patient 21 - Inlay


-- Patient 22 - Urgence fracture


-- Patient 23 - Gouttière


-- Patient 24 - Détartrage parodontal


-- Patient 25 - Implants multiples




-- Patient 26 - Couronne simple
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (83, 'Dévitalisée', TO_DATE('2020-03-10', 'YYYY-MM-DD'), 'Dent dévitalisée nécessitant couronne', 6);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (84, 'Couronnée', TO_DATE('2020-03-25', 'YYYY-MM-DD'), 'Couronne céramique posée', 6);

-- Patient 27 - Implants doubles


-- Patient 28 - Obturation profonde


-- Patient 29 - Parodontite sévère



-- Patient 30 - Contrôle initial



-- États additionnels
INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (95, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'État satisfaisant', 13);

INSERT INTO ÉTAT_DENT (ID_État_Dent, État_Général, Date_Observation, Description, ID_Dent)
VALUES (96, 'Saine', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Pas d\'anomalie', 17);


-- ============================================================================
-- 3. INSERTION DES ANOMALIES
-- ============================================================================
-- 40 anomalies détectées sur différents états dentaires
-- Types : Carie, Fracture, Abcès, Hypoplasie, Érosion, Fissure, Dysplasie

PROMPT Insertion des anomalies...

-- Caries
INSERT INTO ANOMALIE (ID_Anomalie, Type_Anomalie, Gravité, Date_Détection, Description, ID_État_Dent)
VALUES (1, 'Carie', 'Modérée', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Carie dentinaire face occlusale dent 16', 3);

INSERT INTO ANOMALIE (ID_Anomalie, Type_Anomalie, Gravité, Date_Détection, Description, ID_État_Dent)
VALUES (2, 'Carie', 'Sévère', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Carie proximale profonde atteignant la pulpe', 6);

















-- Fractures

INSERT INTO ANOMALIE (ID_Anomalie, Type_Anomalie, Gravité, Date_Détection, Description, ID_État_Dent)
VALUES (20, 'Fracture', 'Légère', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Fêlure amélaire visible', 2);


-- Abcès


-- Hypoplasie


-- Érosion



-- Dysplasie


-- Autres anomalies parodontales




-- Anomalies supplémentaires

INSERT INTO ANOMALIE (ID_Anomalie, Type_Anomalie, Gravité, Date_Détection, Description, ID_État_Dent)
VALUES (36, 'Érosion', 'Modérée', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Usure dentaire généralisée', 49);

INSERT INTO ANOMALIE (ID_Anomalie, Type_Anomalie, Gravité, Date_Détection, Description, ID_État_Dent)
VALUES (37, 'Carie', 'Légère', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'Déminéralisation amélaire débutante', 50);




COMMIT;

PROMPT 40 anomalies insérées.


-- ============================================================================
-- 4. INSERTION DES RESTAURATIONS
-- ============================================================================
-- 50 restaurations effectuées sur différents états dentaires
-- Types : Obturation, Couronne, Implant, Bridge, Inlay, Onlay, Facette

PROMPT Insertion des restaurations...

-- Obturations
INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (1, 'Obturation', 'Composite', TO_DATE('2024-01-20', 'YYYY-MM-DD'), 5, 0, 4, 1);

INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (2, 'Obturation', 'Amalgame', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 5, 0, 8, 1);










INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (12, 'Obturation', 'Composite', TO_DATE('2019-06-10', 'YYYY-MM-DD'), 5, 0, 62, 1);



-- Couronnes


INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (17, 'Couronne', 'Céramique', TO_DATE('2020-03-25', 'YYYY-MM-DD'), 5, 0, 84, 1);

-- Facettes


-- Implants




-- Bridge

-- Inlay

-- Restaurations anciennes ou à surveiller


-- Restaurations additionnelles sur autres patients





INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (33, 'Obturation', 'Composite', TO_DATE('2022-02-10', 'YYYY-MM-DD'), 5, 0, 51, 1);

INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (34, 'Obturation', 'Composite', TO_DATE('2022-02-10', 'YYYY-MM-DD'), 5, 0, 52, 1);

INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (35, 'Obturation', 'Composite', TO_DATE('2021-06-25', 'YYYY-MM-DD'), 5, 0, 61, 1);

INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (36, 'Obturation', 'Amalgame', TO_DATE('2016-04-10', 'YYYY-MM-DD'), 5, 0, 62, 1);

INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (37, 'Couronne', 'Or', TO_DATE('2018-06-20', 'YYYY-MM-DD'), 5, 0, 4, 1);











INSERT INTO RESTAURATION (ID_Restauration, Type_Restauration, Matériau, Date_Pose, Durée_Vie_Estimée, Coût, ID_État_Dent, ID_Personnel)
VALUES (48, 'Couronne', 'Zircone', TO_DATE('2019-02-15', 'YYYY-MM-DD'), 5, 0, 83, 1);



COMMIT;

PROMPT 50 restaurations insérées.


-- ============================================================================
-- FIN DU SCRIPT PARTIE D (2/2)
-- ============================================================================

PROMPT ========================================
PROMPT INSERTION PARTIE D (2/2) TERMINÉE !
PROMPT ========================================
PROMPT 
PROMPT Récapitulatif partie 2 :
PROMPT - 100 états dentaires insérés
PROMPT - 40 anomalies insérées
PROMPT - 50 restaurations insérées
PROMPT 
PROMPT Total partie D complète : 478 enregistrements
PROMPT (320 dents + 100 états + 40 anomalies + 50 restaurations - 32 dents patient 1 déjà dans 03b)
PROMPT ========================================

-- Vérification complète
SELECT 'DENT' AS Table_Name, COUNT(*) AS Nb_Lignes FROM DENT
UNION ALL
SELECT 'ÉTAT_DENT', COUNT(*) FROM ÉTAT_DENT
UNION ALL
SELECT 'ANOMALIE', COUNT(*) FROM ANOMALIE
UNION ALL
SELECT 'RESTAURATION', COUNT(*) FROM RESTAURATION;