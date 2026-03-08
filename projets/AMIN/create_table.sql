/*
DROP TABLE RESTAURATION CASCADE CONSTRAINTS;
DROP TABLE ANOMALIE CASCADE CONSTRAINTS;
DROP TABLE UTILISATION_ÉQUIPEMENT CASCADE CONSTRAINTS;
DROP TABLE UTILISATION_PRODUIT CASCADE CONSTRAINTS;
DROP TABLE ÉTAT_DENT CASCADE CONSTRAINTS;
DROP TABLE RADIOGRAPHIE CASCADE CONSTRAINTS;
DROP TABLE PAIEMENT CASCADE CONSTRAINTS;
DROP TABLE ACTE_MEDICAL CASCADE CONSTRAINTS;
DROP TABLE TRAITEMENT CASCADE CONSTRAINTS;
DROP TABLE LIGNE_COMMANDE CASCADE CONSTRAINTS;
DROP TABLE DENT CASCADE CONSTRAINTS;
DROP TABLE DOSSIER_PATIENT CASCADE CONSTRAINTS;
DROP TABLE COMMANDE CASCADE CONSTRAINTS;
DROP TABLE ÉQUIPEMENT CASCADE CONSTRAINTS;
DROP TABLE PERSONNEL CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE PRODUIT_DENTAIRE CASCADE CONSTRAINTS;
DROP TABLE FOURNISSEUR CASCADE CONSTRAINTS;
DROP TABLE FRANCHISE CASCADE CONSTRAINTS;
*/
CREATE TABLE FRANCHISE (
    ID_Franchise        NUMBER(10)      NOT NULL,
    Nom                 VARCHAR2(100)   NOT NULL,
    Adresse             VARCHAR2(200)   NOT NULL,
    Ville               VARCHAR2(100)   NOT NULL,
    Code_Postal         VARCHAR2(10)    NOT NULL,
    Téléphone           VARCHAR2(20)    NOT NULL,
    Email               VARCHAR2(100),
    Date_Ouverture      DATE            NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_franchise PRIMARY KEY (ID_Franchise),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_franchise_nom UNIQUE (Nom),
    CONSTRAINT uq_franchise_email UNIQUE (Email),
    
    -- Contraintes de validation
    CONSTRAINT chk_franchise_cp CHECK (LENGTH(Code_Postal) >= 4),
    CONSTRAINT chk_franchise_date CHECK (1=1)
);
COMMENT ON TABLE FRANCHISE IS 'Franchises de la clinique Dentissimo';
COMMENT ON COLUMN FRANCHISE.ID_Franchise IS 'Identifiant unique de la franchise';
CREATE TABLE FOURNISSEUR (
    ID_Fournisseur      NUMBER(10)      NOT NULL,
    Nom                 VARCHAR2(100)   NOT NULL,
    Adresse             VARCHAR2(200)   NOT NULL,
    Téléphone           VARCHAR2(20)    NOT NULL,
    Email               VARCHAR2(100),
    SIRET               VARCHAR2(14)    NOT NULL,
    Contact_Principal   VARCHAR2(100),
    
    -- Clé primaire
    CONSTRAINT pk_fournisseur PRIMARY KEY (ID_Fournisseur),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_fournisseur_nom UNIQUE (Nom),
    CONSTRAINT uq_fournisseur_email UNIQUE (Email),
    CONSTRAINT uq_fournisseur_siret UNIQUE (SIRET),
    
    -- Contraintes de validation
    CONSTRAINT chk_fournisseur_siret CHECK (LENGTH(SIRET) = 14)
);
COMMENT ON TABLE FOURNISSEUR IS 'Fournisseurs de produits dentaires';
COMMENT ON COLUMN FOURNISSEUR.SIRET IS 'Numéro SIRET (14 caractères)';
CREATE TABLE PRODUIT_DENTAIRE (
    ID_Produit          NUMBER(10)      NOT NULL,
    Nom                 VARCHAR2(100)   NOT NULL,
    Catégorie           VARCHAR2(50)    NOT NULL,
    Description         VARCHAR2(500),
    Prix_Unitaire       NUMBER(10,2)    NOT NULL,
    Stock_Actuel        NUMBER(10)      DEFAULT 0 NOT NULL,
    Stock_Min           NUMBER(10)      DEFAULT 0 NOT NULL,
    Unité               VARCHAR2(20)    NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_produit PRIMARY KEY (ID_Produit),
    
    -- Contraintes de validation
    CONSTRAINT chk_produit_prix CHECK (Prix_Unitaire > 0),
    CONSTRAINT chk_produit_stock_actuel CHECK (Stock_Actuel >= 0),
    CONSTRAINT chk_produit_stock_min CHECK (Stock_Min >= 0),
    CONSTRAINT chk_produit_unite 
        CHECK (Unité IN ('ml', 'g', 'kg', 'pièce', 'boîte', 'flacon'))
);
COMMENT ON TABLE PRODUIT_DENTAIRE IS 'Catalogue des produits dentaires';
COMMENT ON COLUMN PRODUIT_DENTAIRE.Stock_Min IS 'Seuil minimum de stock';
CREATE TABLE PATIENT (
    ID_Patient          NUMBER(10)      NOT NULL,
    Nom                 VARCHAR2(50)    NOT NULL,
    Prénom              VARCHAR2(50)    NOT NULL,
    Date_Naissance      DATE            NOT NULL,
    Sexe                CHAR(1)         NOT NULL,
    Adresse             VARCHAR2(200),
    Téléphone           VARCHAR2(20),
    Email               VARCHAR2(100),
    Num_Sécu            VARCHAR2(15)    NOT NULL,
    Date_Inscription    DATE            DEFAULT SYSDATE NOT NULL,
    ID_Franchise        NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_patient PRIMARY KEY (ID_Patient),
    
    -- Clés étrangères
    CONSTRAINT fk_patient_franchise 
        FOREIGN KEY (ID_Franchise) REFERENCES FRANCHISE(ID_Franchise),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_patient_email UNIQUE (Email),
    CONSTRAINT uq_patient_secu UNIQUE (Num_Sécu),
    
    -- Contraintes de validation
    CONSTRAINT chk_patient_sexe CHECK (Sexe IN ('M', 'F')),
    CONSTRAINT chk_patient_ddn CHECK (1=1),
    CONSTRAINT chk_patient_date_insc CHECK (1=1)
);
COMMENT ON TABLE PATIENT IS 'Patients de la clinique';
COMMENT ON COLUMN PATIENT.Num_Sécu IS 'Numéro de Sécurité Sociale (unique)';
CREATE TABLE PERSONNEL (
    ID_Personnel        NUMBER(10)      NOT NULL,
    Type                VARCHAR2(20)    NOT NULL,
    Nom                 VARCHAR2(50)    NOT NULL,
    Prénom              VARCHAR2(50)    NOT NULL,
    Spécialité          VARCHAR2(100),
    Rôle                VARCHAR2(100),
    Téléphone           VARCHAR2(20),
    Email               VARCHAR2(100),
    Date_Embauche       DATE,
    ID_Franchise        NUMBER(10),
    
    -- Clé primaire
    CONSTRAINT pk_personnel PRIMARY KEY (ID_Personnel),
    
    -- Clés étrangères
    CONSTRAINT fk_personnel_franchise 
        FOREIGN KEY (ID_Franchise) REFERENCES FRANCHISE(ID_Franchise),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_personnel_email UNIQUE (Email),
    
    -- Contraintes de validation
    CONSTRAINT chk_personnel_type CHECK (Type IN ('Interne', 'Externe')),
    CONSTRAINT chk_personnel_date_emb 
        CHECK (1=1),
    CONSTRAINT chk_personnel_franchise
        CHECK ((Type = 'Interne' AND ID_Franchise IS NOT NULL) OR 
               (Type = 'Externe' AND ID_Franchise IS NULL))
);
COMMENT ON TABLE PERSONNEL IS 'Personnel interne et praticiens externes';
COMMENT ON COLUMN PERSONNEL.Type IS 'Type: Interne (employé) ou Externe (intervenant)';
CREATE TABLE ÉQUIPEMENT (
    ID_Équipement       NUMBER(10)      NOT NULL,
    Nom                 VARCHAR2(100)   NOT NULL,
    Type                VARCHAR2(50)    NOT NULL,
    Numéro_Série        VARCHAR2(100),
    Date_Acquisition    DATE            NOT NULL,
    Prix                NUMBER(10,2),
    État                VARCHAR2(20)    DEFAULT 'Opérationnel' NOT NULL,
    Date_Maintenance    DATE,
    ID_Franchise        NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_equipement PRIMARY KEY (ID_Équipement),
    
    -- Clés étrangères
    CONSTRAINT fk_equipement_franchise 
        FOREIGN KEY (ID_Franchise) REFERENCES FRANCHISE(ID_Franchise),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_equipement_serie UNIQUE (Numéro_Série),
    
    -- Contraintes de validation
    CONSTRAINT chk_equipement_etat 
        CHECK (État IN ('Opérationnel', 'Maintenance', 'Hors_Service')),
    CONSTRAINT chk_equipement_date_acq CHECK (1=1),
    CONSTRAINT chk_equipement_prix CHECK (Prix IS NULL OR Prix > 0)
);
COMMENT ON TABLE ÉQUIPEMENT IS 'Équipements médicaux par franchise';
CREATE TABLE COMMANDE (
    ID_Commande             NUMBER(10)      NOT NULL,
    Date_Commande           DATE            DEFAULT SYSDATE NOT NULL,
    Date_Livraison_Prévue   DATE            NOT NULL,
    Date_Livraison_Réelle   DATE,
    Montant_Total           NUMBER(10,2)    DEFAULT 0 NOT NULL,
    Statut                  VARCHAR2(20)    DEFAULT 'En_Cours' NOT NULL,
    ID_Fournisseur          NUMBER(10)      NOT NULL,
    ID_Franchise            NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_commande PRIMARY KEY (ID_Commande),
    
    -- Clés étrangères
    CONSTRAINT fk_commande_fournisseur 
        FOREIGN KEY (ID_Fournisseur) REFERENCES FOURNISSEUR(ID_Fournisseur),
    CONSTRAINT fk_commande_franchise 
        FOREIGN KEY (ID_Franchise) REFERENCES FRANCHISE(ID_Franchise),
    
    -- Contraintes de validation
    CONSTRAINT chk_commande_statut 
        CHECK (Statut IN ('En_Cours', 'Livrée', 'Annulée')),
    CONSTRAINT chk_commande_dates 
        CHECK (Date_Livraison_Prévue >= Date_Commande),
    CONSTRAINT chk_commande_montant CHECK (Montant_Total >= 0)
);
COMMENT ON TABLE COMMANDE IS 'Commandes de produits dentaires';
CREATE TABLE DOSSIER_PATIENT (
    ID_Dossier              NUMBER(10)      NOT NULL,
    Date_Création           DATE            DEFAULT SYSDATE NOT NULL,
    Date_Dernière_Modif     DATE            DEFAULT SYSDATE NOT NULL,
    Statut                  VARCHAR2(20)    DEFAULT 'Ouvert' NOT NULL,
    Motif_Consultation      VARCHAR2(500),
    Antécédents             CLOB,
    Allergies               VARCHAR2(500),
    Notes                   CLOB,
    ID_Patient              NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_dossier PRIMARY KEY (ID_Dossier),
    
    -- Clés étrangères
    CONSTRAINT fk_dossier_patient 
        FOREIGN KEY (ID_Patient) REFERENCES PATIENT(ID_Patient),
    
    -- Contraintes de validation
    CONSTRAINT chk_dossier_statut CHECK (Statut IN ('Ouvert', 'Fermé')),
    CONSTRAINT chk_dossier_dates 
        CHECK (Date_Dernière_Modif >= Date_Création)
);
COMMENT ON TABLE DOSSIER_PATIENT IS 'Dossiers médicaux des patients';
CREATE TABLE DENT (
    ID_Dent                 NUMBER(10)      NOT NULL,
    Code_FDI                NUMBER(2)       NOT NULL,
    Type_Dent               VARCHAR2(20)    NOT NULL,
    Position                VARCHAR2(50)    NOT NULL,
    Date_Enregistrement     DATE            DEFAULT SYSDATE NOT NULL,
    ID_Patient              NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_dent PRIMARY KEY (ID_Dent),
    
    -- Clés étrangères
    CONSTRAINT fk_dent_patient 
        FOREIGN KEY (ID_Patient) REFERENCES PATIENT(ID_Patient),
    
    -- Contraintes d'unicité
    CONSTRAINT uq_dent_patient_code UNIQUE (ID_Patient, Code_FDI),
    
    -- Contraintes de validation
    CONSTRAINT chk_dent_code_fdi CHECK (Code_FDI BETWEEN 11 AND 85),
    CONSTRAINT chk_dent_type 
        CHECK (Type_Dent IN ('Incisive', 'Canine', 'Prémolaire', 'Molaire'))
);
COMMENT ON TABLE DENT IS '⭐ Dents des patients selon système FDI';
COMMENT ON COLUMN DENT.Code_FDI IS 'Code FDI (11-48 adultes, 51-85 enfants)';
CREATE TABLE LIGNE_COMMANDE (
    ID_Commande         NUMBER(10)      NOT NULL,
    ID_Produit          NUMBER(10)      NOT NULL,
    Quantité            NUMBER(10)      NOT NULL,
    Prix_Unitaire       NUMBER(10,2)    NOT NULL,
    
    -- Clé primaire composée
    CONSTRAINT pk_ligne_commande PRIMARY KEY (ID_Commande, ID_Produit),
    
    -- Clés étrangères
    CONSTRAINT fk_ligne_commande 
        FOREIGN KEY (ID_Commande) REFERENCES COMMANDE(ID_Commande),
    CONSTRAINT fk_ligne_produit 
        FOREIGN KEY (ID_Produit) REFERENCES PRODUIT_DENTAIRE(ID_Produit),
    
    -- Contraintes de validation
    CONSTRAINT chk_ligne_quantite CHECK (Quantité > 0),
    CONSTRAINT chk_ligne_prix CHECK (Prix_Unitaire > 0)
);
COMMENT ON TABLE LIGNE_COMMANDE IS 'Détail des produits commandés (N:M)';
CREATE TABLE TRAITEMENT (
    ID_Traitement       NUMBER(10)      NOT NULL,
    Date_Début          DATE            NOT NULL,
    Date_Fin            DATE,
    Description         VARCHAR2(500),
    Coût_Total          NUMBER(10,2)    DEFAULT 0,
    Statut              VARCHAR2(20)    DEFAULT 'En cours' NOT NULL,
    ID_Dossier          NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_traitement PRIMARY KEY (ID_Traitement),
    
    -- Clés étrangères
    CONSTRAINT fk_traitement_dossier 
        FOREIGN KEY (ID_Dossier) REFERENCES DOSSIER_PATIENT(ID_Dossier),
    
    -- Contraintes de validation
    CONSTRAINT chk_traitement_statut 
        CHECK (Statut IN ('En cours', 'Terminé', 'Annulé')),
    CONSTRAINT chk_traitement_dates 
        CHECK (Date_Fin IS NULL OR Date_Fin >= Date_Début),
    CONSTRAINT chk_traitement_cout CHECK (Coût_Total >= 0)
);
COMMENT ON TABLE TRAITEMENT IS 'Traitements effectués pour les patients';
CREATE TABLE ACTE_MEDICAL (
    ID_Acte                 NUMBER(10)      NOT NULL,
    Type_Acte               VARCHAR2(100)   NOT NULL,
    Date_Acte               DATE            NOT NULL,
    Durée                   NUMBER(5)       NOT NULL,
    Montant                 NUMBER(10,2)    NOT NULL,
    Description             VARCHAR2(1000),
    Nécessite_Radio         CHAR(1)         DEFAULT 'N',
    Nécessite_Prescription  CHAR(1)         DEFAULT 'N',
    ID_Traitement           NUMBER(10)      NOT NULL,
    ID_Personnel            NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_acte PRIMARY KEY (ID_Acte),
    
    -- Clés étrangères
    CONSTRAINT fk_acte_traitement 
        FOREIGN KEY (ID_Traitement) REFERENCES TRAITEMENT(ID_Traitement),
    CONSTRAINT fk_acte_personnel 
        FOREIGN KEY (ID_Personnel) REFERENCES PERSONNEL(ID_Personnel),
    
    -- Contraintes de validation
    CONSTRAINT chk_acte_duree CHECK (Durée > 0),
    CONSTRAINT chk_acte_montant CHECK (Montant >= 0),
    CONSTRAINT chk_acte_radio CHECK (Nécessite_Radio IN ('O', 'N')),
    CONSTRAINT chk_acte_prescription CHECK (Nécessite_Prescription IN ('O', 'N'))
);
COMMENT ON TABLE ACTE_MEDICAL IS 'Actes médicaux réalisés';
CREATE TABLE PAIEMENT (
    ID_Paiement         NUMBER(10)      NOT NULL,
    Montant             NUMBER(10,2)    NOT NULL,
    Date_Paiement       DATE            NOT NULL,
    Mode_Paiement       VARCHAR2(20)    NOT NULL,
    Statut              VARCHAR2(20)    DEFAULT 'En_Attente' NOT NULL,
    ID_Acte             NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_paiement PRIMARY KEY (ID_Paiement),
    
    -- Clés étrangères
    CONSTRAINT fk_paiement_acte 
        FOREIGN KEY (ID_Acte) REFERENCES ACTE_MEDICAL(ID_Acte),
    
    -- Contraintes de validation
    CONSTRAINT chk_paiement_montant CHECK (Montant > 0),
    CONSTRAINT chk_paiement_mode 
        CHECK (Mode_Paiement IN ('CB', 'Espèces', 'Chèque', 'Virement')),
    CONSTRAINT chk_paiement_statut 
        CHECK (Statut IN ('Payé', 'En_Attente', 'En_Retard'))
);
COMMENT ON TABLE PAIEMENT IS 'Paiements des actes médicaux';
CREATE TABLE RADIOGRAPHIE (
    ID_Radiographie     NUMBER(10)      NOT NULL,
    Type_Radio          VARCHAR2(50)    NOT NULL,
    Date_Prise          DATE            NOT NULL,
    Fichier_Image       VARCHAR2(500),
    Commentaires        VARCHAR2(1000),
    ID_Acte             NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_radio PRIMARY KEY (ID_Radiographie),
    
    -- Clés étrangères
    CONSTRAINT fk_radio_acte 
        FOREIGN KEY (ID_Acte) REFERENCES ACTE_MEDICAL(ID_Acte),
    
    -- Contraintes de validation
    CONSTRAINT chk_radio_type 
        CHECK (Type_Radio IN ('Panoramique', 'Rétro-alvéolaire', 
                              'Céphalométrique', 'Cone Beam'))
);
COMMENT ON TABLE RADIOGRAPHIE IS 'Radiographies effectuées';
CREATE TABLE ÉTAT_DENT (
    ID_État_Dent            NUMBER(10)      NOT NULL,
    Date_Observation        DATE            NOT NULL,
    État_Général            VARCHAR2(50)    NOT NULL,
    Description             VARCHAR2(1000),
    Nécessite_Intervention  CHAR(1)         DEFAULT 'N' NOT NULL,
    ID_Dent                 NUMBER(10)      NOT NULL,
    ID_Acte                 NUMBER(10),
    
    -- Clé primaire
    CONSTRAINT pk_etat_dent PRIMARY KEY (ID_État_Dent),
    
    -- Clés étrangères
    CONSTRAINT fk_etat_dent_dent 
        FOREIGN KEY (ID_Dent) REFERENCES DENT(ID_Dent),
    CONSTRAINT fk_etat_dent_acte 
        FOREIGN KEY (ID_Acte) REFERENCES ACTE_MEDICAL(ID_Acte),
    
    -- Contraintes de validation
    CONSTRAINT chk_etat_general 
        CHECK (État_Général IN ('Saine', 'Cariée', 'Fracturée', 'Absente',
                                'Dévitalisée', 'Couronnée', 'Avec_Implant', 'Obturée')),
    CONSTRAINT chk_etat_intervention CHECK (Nécessite_Intervention IN ('O', 'N'))
);
COMMENT ON TABLE ÉTAT_DENT IS '⭐ Historique de l''état de chaque dent';
CREATE TABLE UTILISATION_PRODUIT (
    ID_Acte             NUMBER(10)      NOT NULL,
    ID_Produit          NUMBER(10)      NOT NULL,
    Quantité_Utilisée   NUMBER(10,2)    NOT NULL,
    
    -- Clé primaire composée
    CONSTRAINT pk_utilisation_produit PRIMARY KEY (ID_Acte, ID_Produit),
    
    -- Clés étrangères
    CONSTRAINT fk_util_prod_acte 
        FOREIGN KEY (ID_Acte) REFERENCES ACTE_MEDICAL(ID_Acte),
    CONSTRAINT fk_util_prod_produit 
        FOREIGN KEY (ID_Produit) REFERENCES PRODUIT_DENTAIRE(ID_Produit),
    
    -- Contraintes de validation
    CONSTRAINT chk_util_prod_quantite CHECK (Quantité_Utilisée > 0)
);
COMMENT ON TABLE UTILISATION_PRODUIT IS 'Produits utilisés par acte (N:M)';
CREATE TABLE UTILISATION_ÉQUIPEMENT (
    ID_Acte             NUMBER(10)      NOT NULL,
    ID_Équipement       NUMBER(10)      NOT NULL,
    Durée_Utilisation   NUMBER(5)       NOT NULL,
    
    -- Clé primaire composée
    CONSTRAINT pk_utilisation_equip PRIMARY KEY (ID_Acte, ID_Équipement),
    
    -- Clés étrangères
    CONSTRAINT fk_util_equip_acte 
        FOREIGN KEY (ID_Acte) REFERENCES ACTE_MEDICAL(ID_Acte),
    CONSTRAINT fk_util_equip_equipement 
        FOREIGN KEY (ID_Équipement) REFERENCES ÉQUIPEMENT(ID_Équipement),
    
    -- Contraintes de validation
    CONSTRAINT chk_util_equip_duree CHECK (Durée_Utilisation > 0)
);
COMMENT ON TABLE UTILISATION_ÉQUIPEMENT IS 'Équipements utilisés par acte (N:M)';
CREATE TABLE ANOMALIE (
    ID_Anomalie         NUMBER(10)      NOT NULL,
    Type_Anomalie       VARCHAR2(50)    NOT NULL,
    Gravité             VARCHAR2(20)    NOT NULL,
    Localisation        VARCHAR2(100),
    Description         VARCHAR2(1000),
    Date_Détection      DATE            NOT NULL,
    ID_État_Dent        NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_anomalie PRIMARY KEY (ID_Anomalie),
    
    -- Clés étrangères
    CONSTRAINT fk_anomalie_etat 
        FOREIGN KEY (ID_État_Dent) REFERENCES ÉTAT_DENT(ID_État_Dent),
    
    -- Contraintes de validation
    CONSTRAINT chk_anomalie_type 
        CHECK (Type_Anomalie IN ('Carie', 'Fracture', 'Infection', 
                                 'Usure', 'Décoloration', 'Fêlure',
                                 'Abcès', 'Tartre')),
    CONSTRAINT chk_anomalie_gravite 
        CHECK (Gravité IN ('Légère', 'Modérée', 'Sévère')),
    CONSTRAINT chk_anomalie_localisation
        CHECK (Localisation IN ('Face vestibulaire', 'Face occlusale',
                                'Face linguale', 'Face proximale',
                                'Collet', 'Racine'))
);
COMMENT ON TABLE ANOMALIE IS '⭐ Anomalies dentaires détectées';
CREATE TABLE RESTAURATION (
    ID_Restauration         NUMBER(10)      NOT NULL,
    Type_Restauration       VARCHAR2(50)    NOT NULL,
    Matériau                VARCHAR2(50)    NOT NULL,
    Date_Pose               DATE            NOT NULL,
    Durée_Vie_Estimée       NUMBER(3)       NOT NULL,
    Coût                    NUMBER(10,2)    NOT NULL,
    ID_État_Dent            NUMBER(10)      NOT NULL,
    ID_Personnel            NUMBER(10)      NOT NULL,
    
    -- Clé primaire
    CONSTRAINT pk_restauration PRIMARY KEY (ID_Restauration),
    
    -- Clés étrangères
    CONSTRAINT fk_restauration_etat 
        FOREIGN KEY (ID_État_Dent) REFERENCES ÉTAT_DENT(ID_État_Dent),
    CONSTRAINT fk_restauration_personnel 
        FOREIGN KEY (ID_Personnel) REFERENCES PERSONNEL(ID_Personnel),
    
    -- Contraintes de validation
    CONSTRAINT chk_restauration_type 
        CHECK (Type_Restauration IN ('Obturation', 'Couronne', 'Implant',
                                      'Bridge', 'Inlay', 'Onlay', 
                                      'Facette', 'Prothèse')),
    CONSTRAINT chk_restauration_materiau 
        CHECK (Matériau IN ('Composite', 'Amalgame', 'Céramique',
                            'Zircone', 'Titane', 'Or', 'Résine')),
    CONSTRAINT chk_restauration_duree CHECK (Durée_Vie_Estimée > 0),
    CONSTRAINT chk_restauration_cout CHECK (Coût >= 0)
);
COMMENT ON TABLE RESTAURATION IS '⭐ Restaurations dentaires effectuées';
PROMPT ========================================
PROMPT CRÉATION TERMINÉE !
PROMPT ========================================
PROMPT 16 Tables principales créées
PROMPT 3 Tables d''association créées
PROMPT ========================================
PROMPT 
PROMPT Tables créées (ordre de dépendance) :
PROMPT Niveau 1 : FRANCHISE, FOURNISSEUR, PRODUIT_DENTAIRE
PROMPT Niveau 2 : PATIENT, PERSONNEL, ÉQUIPEMENT, COMMANDE
PROMPT Niveau 3 : DOSSIER_PATIENT, DENT, LIGNE_COMMANDE
PROMPT Niveau 4 : TRAITEMENT
PROMPT Niveau 5 : ACTE_MEDICAL
PROMPT Niveau 6 : PAIEMENT, RADIOGRAPHIE, ÉTAT_DENT, UTILISATION_PRODUIT, UTILISATION_ÉQUIPEMENT
PROMPT Niveau 7 : ANOMALIE, RESTAURATION
PROMPT 
PROMPT ⭐ Focus État Buccal : DENT, ÉTAT_DENT, ANOMALIE, RESTAURATION
PROMPT ========================================
SELECT COUNT(*) AS Nombre_Tables_Créées
FROM USER_TABLES
WHERE TABLE_NAME IN (
    'FRANCHISE', 'FOURNISSEUR', 'PRODUIT_DENTAIRE', 
    'PATIENT', 'PERSONNEL', 'ÉQUIPEMENT', 'COMMANDE',
    'DOSSIER_PATIENT', 'DENT', 'LIGNE_COMMANDE',
    'TRAITEMENT', 'ACTE_MEDICAL',
    'PAIEMENT', 'RADIOGRAPHIE', 'ÉTAT_DENT', 'UTILISATION_PRODUIT', 'UTILISATION_ÉQUIPEMENT',
    'ANOMALIE', 'RESTAURATION'
);