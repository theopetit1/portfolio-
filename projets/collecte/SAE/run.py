import csv
import http.server
import socketserver
import webbrowser
import threading
import time
import urllib.request
import re
from html.parser import HTMLParser

# Imports ajoutés pour la conformité "Dashboard Python"
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import folium
import json
import os

# =============================================================================
# CONFIGURATION GLOBALE
# =============================================================================
# URL de la page Wikipédia à scraper
WIKI_URL = "https://fr.wikipedia.org/wiki/Liste_des_communes_de_France_les_plus_peupl%C3%A9es"
# Nom du fichier CSV de sortie
CSV_FILE = "communes_plus_peuplees.csv"
# Port pour le serveur web local
PORT = 8080

# =============================================================================
# CLASSE DE PARSING HTML
# =============================================================================
# Cette classe hérite de HTMLParser pour analyser le code HTML brut de Wikipédia.
# Elle détecte les tableaux, les lignes (tr) et les cellules (td/th).
class WikiTableParser(HTMLParser):
    def __init__(self):
        super().__init__()
        # Drapeaux pour savoir où on se trouve dans le HTML
        self.in_table = False   # Sommes-nous dans un tableau ?
        self.in_row = False     # Sommes-nous dans une ligne ?
        self.in_cell = False    # Sommes-nous dans une cellule ?
        self.is_header = False  # Est-ce une cellule d'en-tête (th) ?
        
        # Stockage des données
        self.rows = []          # Liste de toutes les lignes extraites
        self.current_row = []   # Ligne en cours de construction
        self.current_cell_data = [] # Contenu de la cellule en cours
        self.table_found = False # A-t-on trouvé le bon tableau ?
        self.header_rows = []   # Pour stocker les en-têtes (non utilisé ici mais utile)

    # Méthode appelée quand une balise ouvrante est rencontrée (ex: <table>, <tr>)
    def handle_starttag(self, tag, attrs):
        # On cherche le tableau avec la classe "wikitable"
        if tag == 'table':
            for attr in attrs:
                if attr[0] == 'class' and 'wikitable' in attr[1]:
                    self.in_table = True
                    self.table_found = True
        
        if self.in_table:
            if tag == 'tr':
                self.in_row = True
                self.current_row = []
                self.is_header = False
            elif tag == 'th':
                self.in_cell = True
                self.is_header = True
                self.current_cell_data = []
            elif tag == 'td':
                self.in_cell = True
                self.current_cell_data = []

    # Méthode appelée quand une balise fermante est rencontrée (ex: </table>, </tr>)
    def handle_endtag(self, tag):
        if tag == 'table':
            self.in_table = False
        elif tag == 'tr':
            self.in_row = False
            if self.in_table:
                # Si c'est une ligne de données (pas un en-tête), on l'ajoute
                if self.is_header:
                    self.header_rows.append(self.current_row)
                else:
                    if self.current_row:
                        self.rows.append(self.current_row)
        elif tag in ['th', 'td']:
            self.in_cell = False
            # On nettoie les données de la cellule
            data = ''.join(self.current_cell_data).strip()
            # Suppression des références Wikipédia (ex: [1])
            data = re.sub(r'\[.*?\]', '', data) 
            # Remplacement des espaces insécables par des espaces normaux
            data = data.replace('\xa0', ' ').replace('&nbsp;', ' ')
            self.current_row.append(data)

    # Méthode appelée pour le contenu textuel entre les balises
    def handle_data(self, data):
        if self.in_cell:
            self.current_cell_data.append(data)

# =============================================================================
# FONCTION DE SCRAPING
# =============================================================================
def scrape_wikipedia():
    print(f"Récupération des données depuis {WIKI_URL}...")
    try:
        # On se fait passer pour un navigateur web (User-Agent) pour éviter d'être bloqué
        req = urllib.request.Request(
            WIKI_URL, 
            headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'}
        )
        with urllib.request.urlopen(req) as response:
            html_content = response.read().decode('utf-8')
    except Exception as e:
        print(f"Erreur lors du téléchargement : {e}")
        return False

    print("Analyse du HTML...")
    parser = WikiTableParser()
    parser.feed(html_content)

    if not parser.rows:
        print("Aucune donnée trouvée.")
        return False

    print(f"{len(parser.rows)} lignes brutes trouvées.")

    # Définition des colonnes pour le fichier CSV final
    output_columns = [
        'Rang', 'Code INSEE', 'Commune', 'URL Wikipédia', 'Département', 'Statut', 'Région',
        'Population 2023', 'Population 2017', 'Population 2012', 'Population 2007', 'Population 1999'
    ]

    cleaned_rows = []
    
    # Traitement de chaque ligne extraite
    # On mappe les index du tableau Wikipédia vers nos colonnes CSV
    for row in parser.rows:
        # On ignore les lignes trop courtes (erreurs de parsing ou lignes vides)
        if len(row) < 7:
            continue
            
        try:
            code_insee = row[1].strip()
            commune = row[2].strip()
            
            # FILTRAGE : On exclut les DOM-TOM (Codes 97 et 98)
            # On ne garde que la France Métropolitaine (Choix du Groupe)
            if code_insee.startswith('97') or code_insee.startswith('98'):
                continue
                
            out_row = []
            # Mapping des colonnes (Attention : dépend de la structure exacte du tableau Wiki)
            out_row.append(row[0]) # Rang
            out_row.append(code_insee) # Code INSEE
            out_row.append(commune) # Commune
            # Création de l'URL Wikipédia
            out_row.append(f"https://fr.wikipedia.org/wiki/{commune.replace(' ', '_')}")
            out_row.append(row[3]) # Département
            out_row.append(row[4]) # Statut
            out_row.append(row[5]) # Région
            
            # Fonction locale pour nettoyer les chiffres de population
            def clean_pop(val):
                val = val.replace(' ', '').replace('\u202f', '') # Enlève espaces et espaces fins
                if val.isdigit():
                    return val
                return ''

            # Extraction des populations (les index peuvent changer si Wiki change)
            out_row.append(clean_pop(row[6]) if len(row) > 6 else '') # 2023
            out_row.append(clean_pop(row[7]) if len(row) > 7 else '') # 2017
            out_row.append(clean_pop(row[8]) if len(row) > 8 else '') # 2012
            out_row.append(clean_pop(row[9]) if len(row) > 9 else '') # 2007
            out_row.append(clean_pop(row[10]) if len(row) > 10 else '') # 1999
            
            cleaned_rows.append(out_row)
            
        except IndexError:
            continue

    print(f"Extraction terminée : {len(cleaned_rows)} communes (France Métropolitaine).")

    # Écriture du fichier CSV
    try:
        with open(CSV_FILE, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(output_columns) # En-têtes
            writer.writerows(cleaned_rows)  # Données
        print(f"Fichier sauvegardé : {CSV_FILE}")
        return True
    except Exception as e:
        print(f"Erreur d'écriture CSV : {e}")
        return False

# =============================================================================
# SERVEUR WEB LOCAL
# =============================================================================
def start_server():
    handler = http.server.SimpleHTTPRequestHandler
    # Permet de réutiliser le port immédiatement si on relance le script
    socketserver.TCPServer.allow_reuse_address = True
    with socketserver.TCPServer(("", PORT), handler) as httpd:
        print(f"Serveur démarré sur http://localhost:{PORT}")
        # Ouvre le navigateur automatiquement après 1 seconde
        threading.Timer(1.0, lambda: webbrowser.open(f"http://localhost:{PORT}/menu.html")).start()
        httpd.serve_forever()

# =============================================================================
# POINT D'ENTRÉE DU SCRIPT
# =============================================================================
if __name__ == "__main__":
    print("--- Démarrage de l'automatisation ---")
    
    # Étape 1 : Scraper et Filtrer
    success = scrape_wikipedia()
    
    if success:
        # Étape 2 : Lancer le serveur et la visualisation
        print("Lancement du serveur...")
        try:
            start_server()
        except KeyboardInterrupt:
            print("\nServeur arrêté.")
    else:
        print("Échec du scraping. Serveur non démarré.")
