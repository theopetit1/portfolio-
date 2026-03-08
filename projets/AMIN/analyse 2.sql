-- ============================================================================
-- SCRIPT D'ANALYSE ET DE REPORTING (Livrable 5)
-- Base de Données Clinique Dentaire DENTISSIMO
-- ============================================================================

SET PAGESIZE 100;
SET LINESIZE 200;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

PROMPT ========================================================================
PROMPT A. ANALYSE DE LA PATIENTÈLE
PROMPT ========================================================================

PROMPT 1. Profil de la patientèle (Répartition par Sexe et Tranche d'âge)
SELECT 
    Sexe,
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 < 18 THEN 'Mineur (-18)'
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 BETWEEN 18 AND 35 THEN 'Jeune Adulte (18-35)'
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 BETWEEN 36 AND 60 THEN 'Adulte (36-60)'
        ELSE 'Senior (60+)'
    END AS Tranche_Age,
    COUNT(*) as Nombre_Patients
FROM PATIENT
GROUP BY Sexe, 
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 < 18 THEN 'Mineur (-18)'
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 BETWEEN 18 AND 35 THEN 'Jeune Adulte (18-35)'
        WHEN MONTHS_BETWEEN(SYSDATE, Date_Naissance)/12 BETWEEN 36 AND 60 THEN 'Adulte (36-60)'
        ELSE 'Senior (60+)'
    END
ORDER BY Sexe, Tranche_Age;

PROMPT 2. Patients Nouveaux vs Récurrents (Fidélité)
SELECT 
    Type_Patient,
    COUNT(*) as Nombre
FROM (
    SELECT 
        CASE 
            WHEN COUNT(d.ID_Dossier) = 1 THEN 'Nouveau Patient (1 dossier)'
            ELSE 'Patient Récurrent (>1 dossier)'
        END AS Type_Patient
    FROM PATIENT p
    JOIN DOSSIER_PATIENT d ON p.ID_Patient = d.ID_Patient
    GROUP BY p.ID_Patient
)
GROUP BY Type_Patient;

PROMPT ========================================================================
PROMPT B. ANALYSE DES DOSSIERS MÉDICAUX ET ACTES
PROMPT ========================================================================

PROMPT 1. Statut des Dossiers (Ouverts vs Fermés)
SELECT Statut, COUNT(*) AS Nombre_Dossiers
FROM DOSSIER_PATIENT
GROUP BY Statut;

PROMPT 2. Top 5 des Actes Médicaux les plus fréquents
SELECT * FROM (
    SELECT Type_Acte, COUNT(*) as Frequence, AVG(Montant) as Cout_Moyen
    FROM ACTE_MEDICAL
    GROUP BY Type_Acte
    ORDER BY Frequence DESC
) WHERE ROWNUM <= 5;

PROMPT 3. Temps Moyen de Traitement (en jours)
SELECT AVG(Date_Fin - Date_Début) as Duree_Moyenne_Jours
FROM TRAITEMENT
WHERE Date_Fin IS NOT NULL;

PROMPT ========================================================================
PROMPT C. ANALYSE DES COÛTS ET REVENUS
PROMPT ========================================================================

PROMPT 1. Revenu Total par Type de Soin (Top 10)
SELECT Type_Acte, SUM(Montant) as Revenu_Total
FROM ACTE_MEDICAL
GROUP BY Type_Acte
ORDER BY Revenu_Total DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT 2. Paiements en Retard
SELECT ID_Paiement, Montant, Date_Paiement, Statut
FROM PAIEMENT
WHERE Statut = 'En_Retard';

PROMPT 3. Revenu Mensuel (Année courante et précédente)
SELECT TO_CHAR(Date_Paiement, 'YYYY-MM') as Mois, SUM(Montant) as Revenu
FROM PAIEMENT
WHERE Statut = 'Payé'
GROUP BY TO_CHAR(Date_Paiement, 'YYYY-MM')
ORDER BY Mois DESC;

PROMPT ========================================================================
PROMPT D. PERFORMANCE DU PERSONNEL
PROMPT ========================================================================

PROMPT 1. Nombre d'actes et CA par Praticien
SELECT p.Nom, p.Prénom, p.Spécialité, COUNT(a.ID_Acte) as Nb_Actes, SUM(a.Montant) as Chiffre_Affaires
FROM PERSONNEL p
JOIN ACTE_MEDICAL a ON p.ID_Personnel = a.ID_Personnel
WHERE p.Type = 'Interne' OR p.Type = 'Externe'
GROUP BY p.Nom, p.Prénom, p.Spécialité
ORDER BY Nb_Actes DESC;

PROMPT ========================================================================
PROMPT E. GESTION DES ÉQUIPEMENTS ET CONSOMMABLES
PROMPT ========================================================================

PROMPT 1. Produits les plus utilisés (Top 5)
SELECT pd.Nom as Nom_Produit, SUM(up.Quantité_Utilisée) as Total_Utilise
FROM PRODUIT_DENTAIRE pd
JOIN UTILISATION_PRODUIT up ON pd.ID_Produit = up.ID_Produit
GROUP BY pd.Nom
ORDER BY Total_Utilise DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT 2. Historique des Commandes (Dernières 5)
SELECT ID_Commande, Date_Commande, Montant_Total, Statut
FROM COMMANDE
ORDER BY Date_Commande DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT 3. Coût Total Acquisition Équipements
SELECT SUM(Prix) as Total_Investissement_Equipement
FROM ÉQUIPEMENT;

PROMPT ========================================================================
PROMPT F. ANALYSE DE L''ÉTAT BUCCAL ET DENTAIRE
PROMPT ========================================================================

PROMPT 1. Anomalies les plus fréquentes
SELECT Type_Anomalie, Gravité, COUNT(*) as Frequence
FROM ANOMALIE
GROUP BY Type_Anomalie, Gravité
ORDER BY Frequence DESC;

PROMPT 2. Dents les plus sujettes aux anomalies (Top 5)
SELECT d.ID_Dent, d.Position, COUNT(a.ID_Anomalie) as Nb_Anomalies
FROM DENT d
JOIN ÉTAT_DENT ed ON d.ID_Dent = ed.ID_Dent
JOIN ANOMALIE a ON ed.ID_État_Dent = a.ID_État_Dent
GROUP BY d.ID_Dent, d.Position
ORDER BY Nb_Anomalies DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT 3. Types de Restaurations les plus courantes
SELECT Type_Restauration, Matériau, COUNT(*) as Nombre
FROM RESTAURATION
GROUP BY Type_Restauration, Matériau
ORDER BY Nombre DESC;

PROMPT ========================================================================
PROMPT G. ANALYSE DE LA FRÉQUENTATION DES FRANCHISES
PROMPT ========================================================================

PROMPT 1. Répartition des Patients par Franchise
SELECT f.Ville as Franchise, COUNT(DISTINCT dp.ID_Patient) as Nb_Patients_Uniques
FROM FRANCHISE f
JOIN PERSONNEL p ON f.ID_Franchise = p.ID_Franchise
JOIN ACTE_MEDICAL a ON p.ID_Personnel = a.ID_Personnel
JOIN TRAITEMENT t ON a.ID_Traitement = t.ID_Traitement
JOIN DOSSIER_PATIENT dp ON t.ID_Dossier = dp.ID_Dossier
GROUP BY f.Ville
ORDER BY Nb_Patients_Uniques DESC;

PROMPT ========================================================================
PROMPT H. SUIVI DES DÉPENSES ET RENTABILITÉ
PROMPT ========================================================================

PROMPT 1. Dépenses par Type (Commandes vs Équipements)
SELECT 'Commandes Fournisseurs' as Type_Depense, SUM(Montant_Total) as Montant
FROM COMMANDE
UNION ALL
SELECT 'Achat Équipements', SUM(Prix)
FROM ÉQUIPEMENT;

PROMPT 2. Rentabilité Globale (Revenus Actes - Dépenses Commandes)
SELECT 
    (SELECT SUM(Montant) FROM PAIEMENT WHERE Statut = 'Payé') as Total_Revenus,
    (SELECT SUM(Montant_Total) FROM COMMANDE) as Total_Depenses_Commandes,
    (SELECT SUM(Montant) FROM PAIEMENT WHERE Statut = 'Payé') - 
    (SELECT SUM(Montant_Total) FROM COMMANDE) as Marge_Brute_Estimee
FROM DUAL;

PROMPT ========================================================================
PROMPT FIN DU RAPPORT COMPLET
PROMPT ========================================================================
