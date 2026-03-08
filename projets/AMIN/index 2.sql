-- ============================================================================
-- SCRIPT DE CRÉATION DES INDEX - BASE DE DONNÉES DENTISSIMO
-- Optimisation des performances des requêtes
-- Oracle Database
-- ============================================================================
--
-- Ce script crée des index sur :
--   1. Toutes les clés étrangères (pour optimiser les JOIN)
--   2. Les colonnes fréquemment utilisées dans les WHERE
--   3. Les colonnes utilisées pour les tris (ORDER BY)
--   4. Les colonnes utilisées dans les GROUP BY
--
-- IMPORTANT : Les index sur clés primaires sont créés automatiquement
--             par Oracle, pas besoin de les créer manuellement
--
-- Date : Novembre 2024
-- Auteur : Projet BUT SD 2ème année
-- ============================================================================


-- ============================================================================
-- SECTION 1 : INDEX SUR LES CLÉS ÉTRANGÈRES
-- ============================================================================
-- Oracle ne crée PAS automatiquement d'index sur les FK
-- Ces index sont ESSENTIELS pour optimiser les JOIN

-- Table PATIENT
CREATE INDEX idx_patient_franchise ON PATIENT(ID_Franchise);

-- Table PERSONNEL
CREATE INDEX idx_personnel_franchise ON PERSONNEL(ID_Franchise);

-- Table ÉQUIPEMENT
CREATE INDEX idx_equipement_franchise ON ÉQUIPEMENT(ID_Franchise);

-- Table COMMANDE
CREATE INDEX idx_commande_fournisseur ON COMMANDE(ID_Fournisseur);
CREATE INDEX idx_commande_franchise ON COMMANDE(ID_Franchise);

-- Table DOSSIER_PATIENT
CREATE INDEX idx_dossier_patient ON DOSSIER_PATIENT(ID_Patient);

-- Table DENT
CREATE INDEX idx_dent_patient ON DENT(ID_Patient);

-- Table LIGNE_COMMANDE
CREATE INDEX idx_ligne_commande ON LIGNE_COMMANDE(ID_Commande);
CREATE INDEX idx_ligne_produit ON LIGNE_COMMANDE(ID_Produit);

-- Table TRAITEMENT
CREATE INDEX idx_traitement_dossier ON TRAITEMENT(ID_Dossier);

-- Table ACTE_MEDICAL
CREATE INDEX idx_acte_traitement ON ACTE_MEDICAL(ID_Traitement);
CREATE INDEX idx_acte_personnel ON ACTE_MEDICAL(ID_Personnel);

-- Table PAIEMENT
CREATE INDEX idx_paiement_acte ON PAIEMENT(ID_Acte);

-- Table RADIOGRAPHIE
CREATE INDEX idx_radio_acte ON RADIOGRAPHIE(ID_Acte);

-- Table ÉTAT_DENT
CREATE INDEX idx_etat_dent ON ÉTAT_DENT(ID_Dent);
CREATE INDEX idx_etat_acte ON ÉTAT_DENT(ID_Acte);

-- Table UTILISATION_PRODUIT
CREATE INDEX idx_util_prod_acte ON UTILISATION_PRODUIT(ID_Acte);
CREATE INDEX idx_util_prod_produit ON UTILISATION_PRODUIT(ID_Produit);

-- Table UTILISATION_ÉQUIPEMENT
CREATE INDEX idx_util_equip_acte ON UTILISATION_ÉQUIPEMENT(ID_Acte);
CREATE INDEX idx_util_equip_equipement ON UTILISATION_ÉQUIPEMENT(ID_Équipement);

-- Table ANOMALIE
CREATE INDEX idx_anomalie_etat ON ANOMALIE(ID_État_Dent);

-- Table RESTAURATION
CREATE INDEX idx_restauration_etat ON RESTAURATION(ID_État_Dent);
CREATE INDEX idx_restauration_personnel ON RESTAURATION(ID_Personnel);


-- ============================================================================
-- SECTION 2 : INDEX SUR LES DATES (pour les requêtes temporelles)
-- ============================================================================
-- Ces index optimisent les requêtes avec des filtres ou tris sur dates

-- Dates de création et modification
CREATE INDEX idx_dossier_date_creation ON DOSSIER_PATIENT(Date_Création);
CREATE INDEX idx_traitement_date_debut ON TRAITEMENT(Date_Début);
CREATE INDEX idx_acte_date ON ACTE_MEDICAL(Date_Acte);
CREATE INDEX idx_paiement_date ON PAIEMENT(Date_Paiement);
CREATE INDEX idx_etat_date_obs ON ÉTAT_DENT(Date_Observation);
CREATE INDEX idx_restauration_date ON RESTAURATION(Date_Pose);
CREATE INDEX idx_commande_date ON COMMANDE(Date_Commande);

-- Date d'inscription des patients (pour analyses de recrutement)
CREATE INDEX idx_patient_date_insc ON PATIENT(Date_Inscription);


-- ============================================================================
-- SECTION 3 : INDEX SUR LES STATUTS (pour les filtres fréquents)
-- ============================================================================
-- Optimise les requêtes qui filtrent par statut

CREATE INDEX idx_dossier_statut ON DOSSIER_PATIENT(Statut);
CREATE INDEX idx_traitement_statut ON TRAITEMENT(Statut);
CREATE INDEX idx_paiement_statut ON PAIEMENT(Statut);
CREATE INDEX idx_commande_statut ON COMMANDE(Statut);


-- ============================================================================
-- SECTION 4 : INDEX SUR LES CODES ET NUMÉROS (recherches fréquentes)
-- ============================================================================
-- Optimise les recherches par codes spécifiques

-- Code FDI des dents (recherches par numéro de dent)
CREATE INDEX idx_dent_code_fdi ON DENT(Code_FDI);

-- Types d'anomalies (pour analyses statistiques)
CREATE INDEX idx_anomalie_type ON ANOMALIE(Type_Anomalie);

-- Types de restaurations (pour analyses de durabilité)
CREATE INDEX idx_restauration_type ON RESTAURATION(Type_Restauration);


-- ============================================================================
-- SECTION 5 : INDEX COMPOSITES (pour requêtes complexes)
-- ============================================================================
-- Index sur plusieurs colonnes pour optimiser des requêtes spécifiques

-- Recherche de patients par nom complet
CREATE INDEX idx_patient_nom_prenom ON PATIENT(Nom, Prénom);

-- Recherche d'actes par date et type (analyses fréquentes)
CREATE INDEX idx_acte_date_type ON ACTE_MEDICAL(Date_Acte, Type_Acte);

-- Dents d'un patient par code FDI (déjà UNIQUE, mais utile pour tris)
-- Note : L'index UNIQUE existant peut servir, pas besoin d'en créer un autre

-- États de dents par date (historique chronologique)
CREATE INDEX idx_etat_dent_date ON ÉTAT_DENT(ID_Dent, Date_Observation);

-- Anomalies par type et gravité (statistiques)
CREATE INDEX idx_anomalie_type_gravite ON ANOMALIE(Type_Anomalie, Gravité);

-- Produits par catégorie et stock (gestion stocks)
CREATE INDEX idx_produit_cat_stock ON PRODUIT_DENTAIRE(Catégorie, Stock_Actuel);


-- ============================================================================
-- SECTION 6 : INDEX FONCTIONNELS (pour recherches insensibles à la casse)
-- ============================================================================
-- Optimise les recherches de texte

-- Recherche de patients par nom (insensible à la casse)
CREATE INDEX idx_patient_nom_upper ON PATIENT(UPPER(Nom));
CREATE INDEX idx_patient_prenom_upper ON PATIENT(UPPER(Prénom));

-- Recherche de personnel par nom
CREATE INDEX idx_personnel_nom_upper ON PERSONNEL(UPPER(Nom));


-- ============================================================================
-- SECTION 7 : INDEX POUR ANALYSES SPÉCIFIQUES (État Buccal)
-- ============================================================================
-- Index dédiés aux requêtes analytiques de l'état buccal

-- Anomalies par date de détection (tendances temporelles)
CREATE INDEX idx_anomalie_date_detection ON ANOMALIE(Date_Détection);

-- Restaurations par matériau (analyses de performance matériaux)
CREATE INDEX idx_restauration_materiau ON RESTAURATION(Matériau);

-- Anomalies par gravité (priorités d'intervention)
CREATE INDEX idx_anomalie_gravite ON ANOMALIE(Gravité);


-- ============================================================================
-- FIN DE LA CRÉATION DES INDEX
-- ============================================================================

PROMPT ========================================
PROMPT INDEX CRÉÉS AVEC SUCCÈS !
PROMPT ========================================
PROMPT 
PROMPT Récapitulatif :
PROMPT - 25 index sur clés étrangères
PROMPT - 8 index sur dates
PROMPT - 4 index sur statuts
PROMPT - 3 index sur codes/types
PROMPT - 5 index composites
PROMPT - 4 index fonctionnels
PROMPT - 3 index pour analyses État Buccal
PROMPT 
PROMPT Total : ~50 index créés
PROMPT ========================================

-- Vérification des index créés
SELECT 
    INDEX_NAME,
    TABLE_NAME,
    UNIQUENESS,
    STATUS
FROM USER_INDEXES
WHERE TABLE_NAME IN (
    'FRANCHISE', 'FOURNISSEUR', 'PRODUIT_DENTAIRE',
    'PATIENT', 'PERSONNEL', 'ÉQUIPEMENT', 'COMMANDE',
    'DOSSIER_PATIENT', 'DENT', 'LIGNE_COMMANDE',
    'TRAITEMENT', 'ACTE_MEDICAL',
    'PAIEMENT', 'RADIOGRAPHIE', 'ÉTAT_DENT', 
    'UTILISATION_PRODUIT', 'UTILISATION_ÉQUIPEMENT',
    'ANOMALIE', 'RESTAURATION'
)
ORDER BY TABLE_NAME, INDEX_NAME;

-- Statistiques sur les index
SELECT 
    TABLE_NAME,
    COUNT(*) AS Nombre_Index
FROM USER_INDEXES
WHERE TABLE_NAME IN (
    'FRANCHISE', 'FOURNISSEUR', 'PRODUIT_DENTAIRE',
    'PATIENT', 'PERSONNEL', 'ÉQUIPEMENT', 'COMMANDE',
    'DOSSIER_PATIENT', 'DENT', 'LIGNE_COMMANDE',
    'TRAITEMENT', 'ACTE_MEDICAL',
    'PAIEMENT', 'RADIOGRAPHIE', 'ÉTAT_DENT', 
    'UTILISATION_PRODUIT', 'UTILISATION_ÉQUIPEMENT',
    'ANOMALIE', 'RESTAURATION'
)
GROUP BY TABLE_NAME
ORDER BY TABLE_NAME;