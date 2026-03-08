-- ============================================================================
-- SCRIPT D'INSERTION - PARTIE C (2/2) : PAIEMENTS, RADIOS ET COMMANDES
-- Base de Données Clinique Dentaire DENTISSIMO
-- Oracle Database
-- ============================================================================
--
-- Ce script insère (SUITE DE LA PARTIE C) :
--   3. PAIEMENT (60 paiements correspondant aux actes)
--   4. RADIOGRAPHIE (20 radiographies)
--   5. COMMANDE (10 commandes de produits)
--   6. LIGNE_COMMANDE (30 lignes de commande)
--   7. UTILISATION_PRODUIT (30 utilisations)
--   8. UTILISATION_ÉQUIPEMENT (30 utilisations)
--
-- IMPORTANT : Exécuter 03c_insertions_soins.sql AVANT ce fichier
--
-- Date : Novembre 2024
-- Auteur : Projet BUT SD 2ème année
-- ============================================================================


-- ============================================================================
-- 3. INSERTION DES PAIEMENTS
-- ============================================================================
-- Un paiement par acte médical (60 paiements)

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (1, 60.00, TO_DATE('2020-01-20', 'YYYY-MM-DD'), 'CB', 'Payé', 1);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (2, 90.00, TO_DATE('2020-02-10', 'YYYY-MM-DD'), 'CB', 'Payé', 2);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (3, 30.00, TO_DATE('2020-02-15', 'YYYY-MM-DD'), 'Espèces', 'Payé', 3);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (4, 250.00, TO_DATE('2020-03-05', 'YYYY-MM-DD'), 'CB', 'Payé', 4);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (5, 80.00, TO_DATE('2020-03-25', 'YYYY-MM-DD'), 'CB', 'Payé', 5);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (6, 1200.00, TO_DATE('2020-04-15', 'YYYY-MM-DD'), 'Virement', 'Payé', 6);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (7, 520.00, TO_DATE('2020-06-20', 'YYYY-MM-DD'), 'Virement', 'Payé', 7);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (8, 450.00, TO_DATE('2020-05-15', 'YYYY-MM-DD'), 'CB', 'Payé', 8);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (9, 180.00, TO_DATE('2020-06-10', 'YYYY-MM-DD'), 'CB', 'Payé', 9);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (10, 120.00, TO_DATE('2020-08-20', 'YYYY-MM-DD'), 'Chèque', 'Payé', 10);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (11, 1800.00, TO_DATE('2020-09-15', 'YYYY-MM-DD'), 'Virement', 'Payé', 11);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (12, 80.00, TO_DATE('2020-10-20', 'YYYY-MM-DD'), 'CB', 'Payé', 12);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (13, 350.00, TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'CB', 'Payé', 13);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (14, 350.00, TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'CB', 'Payé', 14);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (15, 80.00, TO_DATE('2021-03-25', 'YYYY-MM-DD'), 'Espèces', 'Payé', 15);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (16, 40.00, TO_DATE('2021-05-20', 'YYYY-MM-DD'), 'CB', 'Payé', 16);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (17, 180.00, TO_DATE('2021-05-20', 'YYYY-MM-DD'), 'CB', 'Payé', 17);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (18, 600.00, TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Virement', 'Payé', 18);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (19, 600.00, TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Virement', 'Payé', 19);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (20, 850.00, TO_DATE('2021-09-15', 'YYYY-MM-DD'), 'Virement', 'Payé', 20);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (21, 60.00, TO_DATE('2022-01-25', 'YYYY-MM-DD'), 'CB', 'Payé', 21);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (22, 60.00, TO_DATE('2022-02-05', 'YYYY-MM-DD'), 'CB', 'Payé', 22);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (23, 120.00, TO_DATE('2020-03-18', 'YYYY-MM-DD'), 'Chèque', 'Payé', 23);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (24, 2100.00, TO_DATE('2020-05-25', 'YYYY-MM-DD'), 'Virement', 'Payé', 24);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (25, 180.00, TO_DATE('2020-08-15', 'YYYY-MM-DD'), 'CB', 'Payé', 25);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (26, 180.00, TO_DATE('2020-08-22', 'YYYY-MM-DD'), 'CB', 'Payé', 26);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (27, 160.00, TO_DATE('2020-09-10', 'YYYY-MM-DD'), 'CB', 'Payé', 27);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (28, 180.00, TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'CB', 'Payé', 28);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (29, 1350.00, TO_DATE('2021-04-28', 'YYYY-MM-DD'), 'Virement', 'Payé', 29);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (30, 60.00, TO_DATE('2021-07-05', 'YYYY-MM-DD'), 'Espèces', 'Payé', 30);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (31, 380.00, TO_DATE('2021-09-18', 'YYYY-MM-DD'), 'CB', 'Payé', 31);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (32, 80.00, TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'CB', 'Payé', 32);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (33, 170.00, TO_DATE('2022-01-12', 'YYYY-MM-DD'), 'CB', 'Payé', 33);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (34, 80.00, TO_DATE('2022-03-18', 'YYYY-MM-DD'), 'Espèces', 'Payé', 34);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (35, 680.00, TO_DATE('2022-05-25', 'YYYY-MM-DD'), 'Virement', 'Payé', 35);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (36, 420.00, TO_DATE('2021-02-12', 'YYYY-MM-DD'), 'CB', 'Payé', 36);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (37, 350.00, TO_DATE('2021-04-20', 'YYYY-MM-DD'), 'CB', 'Payé', 37);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (38, 150.00, TO_DATE('2021-06-28', 'YYYY-MM-DD'), 'CB', 'Payé', 38);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (39, 75.00, TO_DATE('2021-08-15', 'YYYY-MM-DD'), 'Espèces', 'Payé', 39);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (40, 100.00, TO_DATE('2021-10-22', 'YYYY-MM-DD'), 'CB', 'Payé', 40);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (41, 2400.00, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 'Virement', 'Payé', 41);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (42, 80.00, TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'CB', 'Payé', 42);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (43, 320.00, TO_DATE('2022-01-18', 'YYYY-MM-DD'), 'CB', 'Payé', 43);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (44, 360.00, TO_DATE('2022-03-30', 'YYYY-MM-DD'), 'CB', 'Payé', 44);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (45, 360.00, TO_DATE('2022-05-10', 'YYYY-MM-DD'), 'CB', 'Payé', 45);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (46, 120.00, TO_DATE('2022-05-12', 'YYYY-MM-DD'), 'CB', 'Payé', 46);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (47, 70.00, TO_DATE('2020-03-15', 'YYYY-MM-DD'), 'CB', 'Payé', 47);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (48, 70.00, TO_DATE('2020-06-22', 'YYYY-MM-DD'), 'CB', 'Payé', 48);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (49, 100.00, TO_DATE('2021-04-10', 'YYYY-MM-DD'), 'CB', 'Payé', 49);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (50, 35.00, TO_DATE('2021-10-01', 'YYYY-MM-DD'), 'Espèces', 'Payé', 50);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (51, 70.00, TO_DATE('2020-11-20', 'YYYY-MM-DD'), 'CB', 'Payé', 51);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (52, 70.00, TO_DATE('2020-12-20', 'YYYY-MM-DD'), 'CB', 'Payé', 52);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (53, 70.00, TO_DATE('2021-01-20', 'YYYY-MM-DD'), 'CB', 'Payé', 53);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (54, 150.00, TO_DATE('2021-03-20', 'YYYY-MM-DD'), 'CB', 'Payé', 54);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (55, 45.00, TO_DATE('2020-09-05', 'YYYY-MM-DD'), 'Espèces', 'Payé', 55);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (56, 80.00, TO_DATE('2021-06-01', 'YYYY-MM-DD'), 'CB', 'Payé', 56);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (57, 50.00, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'CB', 'Payé', 57);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (58, 40.00, TO_DATE('2021-02-18', 'YYYY-MM-DD'), 'Espèces', 'Payé', 58);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (59, 40.00, TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'Espèces', 'Payé', 59);

INSERT INTO PAIEMENT (ID_Paiement, Montant, Date_Paiement, Mode_Paiement, Statut, ID_Acte)
VALUES (60, 50.00, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 'CB', 'Payé', 60);

COMMIT;

PROMPT 60 paiements insérés.


-- ============================================================================
-- 4. INSERTION DES RADIOGRAPHIES
-- ============================================================================
-- 20 radiographies correspondant aux actes nécessitant des radios

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (1, 'Rétro-alvéolaire', TO_DATE('2020-02-15', 'YYYY-MM-DD'), '/radiographies/2020/patient2_dent46.jpg', 'Carie profonde visible dent 46', 3);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (2, 'Cone Beam', TO_DATE('2020-03-25', 'YYYY-MM-DD'), '/radiographies/2020/patient3_implant36.dcm', 'Planification implant dent 36', 5);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (3, 'Céphalométrique', TO_DATE('2020-08-20', 'YYYY-MM-DD'), '/radiographies/2020/patient6_cephalo.jpg', 'Analyse orthodontique', 10);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (4, 'Rétro-alvéolaire', TO_DATE('2021-01-15', 'YYYY-MM-DD'), '/radiographies/2021/patient7_parodontal.jpg', 'Évaluation perte osseuse', 13);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (5, 'Panoramique', TO_DATE('2021-05-20', 'YYYY-MM-DD'), '/radiographies/2021/patient9_panoramique.jpg', 'Dent de sagesse 38 incluse', 16);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (6, 'Rétro-alvéolaire', TO_DATE('2021-09-15', 'YYYY-MM-DD'), '/radiographies/2021/patient11_dent36.jpg', 'Contrôle avant couronne', 20);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (7, 'Panoramique', TO_DATE('2020-05-25', 'YYYY-MM-DD'), '/radiographies/2020/patient14_bridge.jpg', 'Planification bridge 14-15-16', 24);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (8, 'Rétro-alvéolaire', TO_DATE('2020-08-15', 'YYYY-MM-DD'), '/radiographies/2020/patient15_dent16.jpg', 'Caries multiples visibles', 25);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (9, 'Rétro-alvéolaire', TO_DATE('2021-04-28', 'YYYY-MM-DD'), '/radiographies/2021/patient17_prothese.jpg', 'État osseux pour prothèse', 29);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (10, 'Rétro-alvéolaire', TO_DATE('2021-09-18', 'YYYY-MM-DD'), '/radiographies/2021/patient19_endo46.jpg', 'Traitement canalaire dent 46', 31);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (11, 'Panoramique', TO_DATE('2022-01-10', 'YYYY-MM-DD'), '/radiographies/2022/patient20_abces.jpg', 'Abcès visible apex dent 36', 32);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (12, 'Rétro-alvéolaire', TO_DATE('2021-02-12', 'YYYY-MM-DD'), '/radiographies/2021/patient23_fracture11.jpg', 'Fracture radiculaire dent 11', 36);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (13, 'Cone Beam', TO_DATE('2021-10-22', 'YYYY-MM-DD'), '/radiographies/2021/patient27_cbct.dcm', 'Planification 2 implants 36-37', 40);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (14, 'Rétro-alvéolaire', TO_DATE('2022-01-20', 'YYYY-MM-DD'), '/radiographies/2022/patient27_controle.jpg', 'Contrôle ostéointégration', 42);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (15, 'Rétro-alvéolaire', TO_DATE('2022-01-18', 'YYYY-MM-DD'), '/radiographies/2022/patient28_carie26.jpg', 'Carie profonde dent 26', 43);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (16, 'Panoramique', TO_DATE('2022-03-30', 'YYYY-MM-DD'), '/radiographies/2022/patient29_parodontal.jpg', 'Perte osseuse généralisée', 44);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (17, 'Rétro-alvéolaire', TO_DATE('2021-10-01', 'YYYY-MM-DD'), '/radiographies/2021/patient11_controle.jpg', 'Contrôle post-couronne', 50);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (18, 'Rétro-alvéolaire', TO_DATE('2020-09-05', 'YYYY-MM-DD'), '/radiographies/2020/patient15_controle.jpg', 'Contrôle obturations', 55);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (19, 'Panoramique', TO_DATE('2022-01-15', 'YYYY-MM-DD'), '/radiographies/2022/patient20_panoramique.jpg', 'Vue d''ensemble traitement', 57);

INSERT INTO RADIOGRAPHIE (ID_Radiographie, Type_Radio, Date_Prise, Fichier_Image, Commentaires, ID_Acte)
VALUES (20, 'Panoramique', TO_DATE('2022-05-15', 'YYYY-MM-DD'), '/radiographies/2022/patient30_initial.jpg', 'Radiographie initiale complète', 60);

COMMIT;

PROMPT 20 radiographies insérées.


-- ============================================================================
-- 5. INSERTION DES COMMANDES
-- ============================================================================
-- 10 commandes aux fournisseurs

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 2150.00, 'Livrée', 1, 1);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (2, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-17', 'YYYY-MM-DD'), TO_DATE('2024-02-16', 'YYYY-MM-DD'), 1890.00, 'Livrée', 2, 1);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (3, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), 3250.00, 'Livrée', 3, 2);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (4, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 1560.00, 'Livrée', 1, 2);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (5, TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), TO_DATE('2024-05-21', 'YYYY-MM-DD'), 2780.00, 'Livrée', 4, 3);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (6, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), NULL, 1920.00, 'En_Cours', 2, 3);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (7, TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-14', 'YYYY-MM-DD'), 4200.00, 'Livrée', 5, 1);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (8, TO_DATE('2024-08-20', 'YYYY-MM-DD'), TO_DATE('2024-08-27', 'YYYY-MM-DD'), TO_DATE('2024-08-26', 'YYYY-MM-DD'), 1680.00, 'Livrée', 3, 2);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (9, TO_DATE('2024-09-12', 'YYYY-MM-DD'), TO_DATE('2024-09-19', 'YYYY-MM-DD'), NULL, 2450.00, 'En_Cours', 1, 1);

INSERT INTO COMMANDE (ID_Commande, Date_Commande, Date_Livraison_Prévue, Date_Livraison_Réelle, Montant_Total, Statut, ID_Fournisseur, ID_Franchise)
VALUES (10, TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), 3150.00, 'Livrée', 4, 3);

COMMIT;

PROMPT 10 commandes insérées.


-- ============================================================================
-- 6. INSERTION DES LIGNES DE COMMANDE
-- ============================================================================
-- 30 lignes de commande (3 par commande en moyenne)

-- Commande 1
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (1, 1, 20, 12.50);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (1, 3, 15, 45.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (1, 11, 50, 8.50);

-- Commande 2
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (2, 6, 5, 280.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (2, 9, 10, 18.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (2, 13, 30, 4.50);

-- Commande 3
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (3, 7, 5, 350.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (3, 8, 3, 420.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (3, 16, 10, 55.00);

-- Commande 4
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (4, 2, 15, 15.80);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (4, 4, 10, 35.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (4, 12, 80, 6.00);

-- Commande 5
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (5, 6, 4, 280.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (5, 10, 12, 25.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (5, 15, 20, 22.00);

-- Commande 6
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (6, 3, 20, 45.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (6, 5, 15, 28.50);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (6, 14, 40, 5.00);

-- Commande 7
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (7, 6, 10, 280.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (7, 7, 3, 350.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (7, 17, 15, 38.00);

-- Commande 8
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (8, 18, 10, 75.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (8, 19, 25, 8.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (8, 20, 30, 12.00);

-- Commande 9
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (9, 1, 25, 12.50);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (9, 3, 20, 45.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (9, 16, 15, 55.00);

-- Commande 10
INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (10, 6, 6, 280.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (10, 8, 3, 420.00);

INSERT INTO LIGNE_COMMANDE (ID_Commande, ID_Produit, Quantité, Prix_Unitaire)
VALUES (10, 10, 10, 25.00);

COMMIT;

PROMPT 30 lignes de commande insérées.


-- ============================================================================
-- 7. INSERTION DES UTILISATIONS DE PRODUITS
-- ============================================================================
-- 30 utilisations de produits lors des actes (échantillon)

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (2, 9, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (4, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (4, 3, 1.5);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (6, 1, 4.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (6, 6, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (7, 7, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (8, 18, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (9, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (9, 3, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (13, 1, 3.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (14, 1, 3.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (17, 1, 3.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (18, 16, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (19, 16, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (20, 8, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (22, 15, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (23, 9, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (25, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (25, 3, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (26, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (26, 3, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (27, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (27, 4, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (31, 1, 3.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (31, 5, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (33, 1, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (38, 9, 1.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (41, 6, 2.0);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (43, 1, 2.5);

INSERT INTO UTILISATION_PRODUIT (ID_Acte, ID_Produit, Quantité_Utilisée)
VALUES (43, 3, 2.0);

COMMIT;

PROMPT 30 utilisations de produits insérées.


-- ============================================================================
-- 8. INSERTION DES UTILISATIONS D'ÉQUIPEMENTS
-- ============================================================================
-- 30 utilisations d'équipements lors des actes (échantillon)

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (1, 1, 30);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (2, 1, 45);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (3, 2, 15);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (4, 1, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (5, 5, 20);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (6, 1, 120);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (7, 1, 45);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (8, 1, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (9, 1, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (10, 1, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (11, 1, 120);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (13, 6, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (14, 6, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (15, 1, 30);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (16, 2, 15);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (17, 1, 45);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (18, 1, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (19, 1, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (20, 1, 120);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (23, 6, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (24, 6, 150);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (31, 6, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (36, 10, 90);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (37, 10, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (38, 10, 60);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (40, 5, 30);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (41, 1, 150);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (43, 10, 75);

INSERT INTO UTILISATION_ÉQUIPEMENT (ID_Acte, ID_Équipement, Durée_Utilisation)
VALUES (44, 6, 90);

COMMIT;

PROMPT 30 utilisations d'équipements insérées.


-- ============================================================================
-- FIN DU SCRIPT PARTIE C (2/2)
-- ============================================================================

PROMPT ========================================
PROMPT INSERTION PARTIE C (2/2) TERMINÉE !
PROMPT ========================================
PROMPT 
PROMPT Récapitulatif partie 2 :
PROMPT - 60 paiements insérés
PROMPT - 20 radiographies insérées
PROMPT - 10 commandes insérées
PROMPT - 30 lignes de commande insérées
PROMPT - 30 utilisations de produits insérées
PROMPT - 30 utilisations d'équipements insérées
PROMPT 
PROMPT Total partie 2 : 180 enregistrements
PROMPT Total partie C complète : 270 enregistrements
PROMPT ========================================

-- Vérification complète
SELECT 'TRAITEMENT' AS Table_Name, COUNT(*) AS Nb_Lignes FROM TRAITEMENT
UNION ALL
SELECT 'ACTE_MEDICAL', COUNT(*) FROM ACTE_MEDICAL
UNION ALL
SELECT 'PAIEMENT', COUNT(*) FROM PAIEMENT
UNION ALL
SELECT 'RADIOGRAPHIE', COUNT(*) FROM RADIOGRAPHIE
UNION ALL
SELECT 'COMMANDE', COUNT(*) FROM COMMANDE
UNION ALL
SELECT 'LIGNE_COMMANDE', COUNT(*) FROM LIGNE_COMMANDE
UNION ALL
SELECT 'UTILISATION_PRODUIT', COUNT(*) FROM UTILISATION_PRODUIT
UNION ALL
SELECT 'UTILISATION_ÉQUIPEMENT', COUNT(*) FROM UTILISATION_ÉQUIPEMENT;