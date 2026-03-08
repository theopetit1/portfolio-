import requests
import pandas as pd
import folium
import matplotlib.pyplot as plt
import seaborn as sns
import os
import math
from datetime import datetime

# =============================================================================
# CONFIGURATION ET CONSTANTES
# =============================================================================
# URL de l'API OpenDataSoft pour les données SYNOP (données météo synoptiques)
API_URL = "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/donnees-synop-essentielles-omm/records"

# Limite de données pour l'exemple
LIMIT = 2723063

# Coordonnées IUT Poitiers
POITIERS_IUT_COORDS = {'lat': 46.5671, 'lon': 0.3846}

def haversine_distance(lat1, lon1, lat2, lon2):
    R = 6371  # Earth radius in km
    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)
    a = math.sin(dlat/2) * math.sin(dlat/2) + \
        math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * \
        math.sin(dlon/2) * math.sin(dlon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    return R * c

def fetch_weather_data():
    """
    Récupère les données météorologiques depuis l'API SYNOP.
    Retourne un DataFrame Pandas contenant les relevés.
    """
    print("Récupération des données météo depuis l'API SYNOP...")
    
    all_records = []
    
    # Stratégie pour avoir une comparaison par ANNÉE :
    # On récupère un échantillon de Janvier 2023 et un échantillon de Janvier 2024
    # Cela permet de satisfaire l'exigence "comparer par année" sans télécharger tout l'historique.
    
    periods = [
        {'year': 2023, 'where': 'date >= "2023-01-01" AND date < "2023-02-01"'},
        {'year': 2024, 'where': 'date >= "2024-01-01" AND date < "2024-02-01"'}
    ]
    
    for period in periods:
        print(f"Récupération des données pour {period['year']}...")
        params = {
            'limit': 100,              # 100 par page
            'order_by': 'date DESC',
            'where': period['where']
        }
        
        # On récupère 2 pages (200 enregistrements) par année
        for i in range(2):
            params['offset'] = i * 100
            try:
                response = requests.get(API_URL, params=params, timeout=10)
                response.raise_for_status()
                data = response.json()
                
                if 'results' in data:
                    all_records.extend(data['results'])
                else:
                    break
            except Exception as e:
                print(f"Erreur lors de la récupération des données ({period['year']}) : {e}")
                break
            
    print(f"{len(all_records)} enregistrements récupérés au total.")
    return pd.DataFrame(all_records)

def get_stations_nearby():
    """
    Récupère la liste des stations situées à moins de 101km de l'IUT de Poitiers.
    """
    print("Recherche des stations à moins de 101km de Poitiers...")
    nearby_stations = set() # Utilisation d'un set pour l'unicité
    
    # On récupère les stations actives récemment (janvier 2024 par exemple)
    # Pas de group_by car buggé sur l'API ODS pour les objets geo parfois
    params = {
        'limit': 100,
        'select': 'nom,coordonnees',
        'refine': 'date:2024' # On regarde en 2024 pour avoir les stations actives
    }
    
    try:
        # On scanne un grand nombre d'enregistrements pour être sûr de trouver toutes les stations uniques
        # Il y a environ 60 stations SYNOP en France métropolitaine.
        for offset in range(0, 2000, 100):
            params['offset'] = offset
            response = requests.get(API_URL, params=params, timeout=10)
            if response.status_code != 200:
                break
                
            data = response.json()
            results = data.get('results', [])
            if not results:
                break
            
            for r in results:
                nom = r.get('nom')
                coords = r.get('coordonnees')
                if nom and coords:
                    lat = coords.get('lat')
                    lon = coords.get('lon')
                    dist = haversine_distance(POITIERS_IUT_COORDS['lat'], POITIERS_IUT_COORDS['lon'], lat, lon)
                    
                    if dist <= 101:
                        nearby_stations.add(nom)
                        
    except Exception as e:
        print(f"Erreur lors de la recherche des stations : {e}")

    # Conversion en liste
    final_list = list(nearby_stations)
    
    # Fallback de sécurité : Si on a rien trouvé (pb réseau/API), on met au moins Poitiers et Niort qu'on connait
    if not final_list:
        if "POITIERS-BIARD" not in final_list: final_list.append("POITIERS-BIARD")
    
    # Affichage des distances pour info
    print("  Stations retenues :")
    for st in final_list:
         print(f"    - {st}")
            
    return final_list

def fetch_poitiers_history():
    """
    Récupère l'historique des données météo pour TOUTES les stations proches de Poitiers (IUT).
    Boucle sur les années pour récupérer l'ensemble de l'historique (depuis 2010).
    """
    stations = get_stations_nearby()
    if not stations:
        print("Aucune station trouvée à proximité.")
        return pd.DataFrame()

    print(f"Récupération de l'historique pour {len(stations)} stations : {stations}")
    
    all_records = []
    current_year = datetime.now().year
    start_year = 2010 # On remonte jusqu'à 2010 pour "l'ensemble des années" (données SYNOP souvent dispo)
    
    # Construction du filtre pour les stations : nom IN ('S1', 'S2', ...)
    stations_filter = " OR ".join([f'nom = "{s}"' for s in stations])
    
    for year in range(start_year, current_year + 1):
        print(f"  > Récupération année {year}...")
        
        # On peut filtrer par année et par stations
        # OPTIMISATION : On ne récupère que les données de 12h (UTC) pour alléger le volume 
        # et avoir tout l'historique annuel sans dépasser la limite de pagination.
        where_clause = f'date >= "{year}-01-01" AND date < "{year+1}-01-01" AND ({stations_filter}) AND hour(date) = 12'
        
        params = {
            'limit': 100, # Max par requête API
            'where': where_clause,
            'select': 'date, nom, tc', # On ne prend que ce qui nous intéresse pour alléger
            'order_by': 'date ASC' 
        }
        
        # Pour récupérer toute l'année, il faut paginer.
        # Pour éviter de faire 1000 requêtes, on va prendre un échantillon ou augmenter la limite si l'API le permet.
        # L'API limite souvent à 10000 rows total, mais par page c'est souvent 100.
        # Stratégie "SAE" : On prend un échantillon représentatif (ex: les 500 premiers relevés de l'année pour ces stations)
        # OU on boucle jusqu'à 1000 records par an.
        
        try:
            for offset in range(0, 1000, 100): # Récupère jusqu'à 1000 points par an
                params['offset'] = offset
                response = requests.get(API_URL, params=params, timeout=5)
                if response.status_code == 200:
                    data = response.json()
                    results = data.get('results', [])
                    if not results:
                        break
                    all_records.extend(results)
                else:
                    break
        except Exception as e:
            print(f"    Erreur année {year}: {e}")
            continue

    print(f"{len(all_records)} enregistrements récupérés au total pour les alentours de Poitiers.")
    return pd.DataFrame(all_records)

def generate_poitiers_graph(df):
    """
    Génère un graphique spécifique pour les alentours de Poitiers sur l'ensemble des années.
    """
    if df.empty:
        print("Pas de données pour le graphique Poitiers.")
        return

    print("Génération du graphique Poitiers (Alentours < 100km)...")
    if 'date' not in df.columns:
        return
        
    df['date'] = pd.to_datetime(df['date'])
    df = df.sort_values('date')
    
    # Utilisation du style sombre pour correspondre au dashboard
    plt.style.use('dark_background')
    
    plt.figure(figsize=(14, 7))
    
    # Palette de couleurs personnalisée vibrante pour ressortir sur le fond sombre
    custom_palette = sns.color_palette("bright", n_colors=len(df['nom'].unique()))
    
    # --- OPTIMISATION : LISSAGE DES DONNÉES ---
    # Le graphique brute a trop de bruit. On va aggéger par mois.
    # On groupe par nom de station et par mois, puis on fait la moyenne (ME = Month End)
    df_resampled = df.set_index('date').groupby('nom').resample('ME')['tc'].mean().reset_index()
    
    # Graphique multiligne lissé
    sns.lineplot(
        data=df_resampled, 
        x='date', 
        y='tc', 
        hue='nom', 
        palette=custom_palette, 
        alpha=0.9, 
        linewidth=2.5,  # Ligne un peu plus épaisse car moins de points
        marker='o',     # Ajout de points pour marquer les mois
        markersize=4
    )
    
    # Stylisation
    plt.title("Moyenne Mensuelle des Températures - Stations proches de l'IUT DE POITIERS (<101km)", fontsize=16, fontweight='bold', color='white', pad=20)
    plt.xlabel('Date', fontsize=12, color='#cbd5e1')
    plt.ylabel('Température Moyenne (°C)', fontsize=12, color='#cbd5e1')
    
    # Légende
    plt.legend(title='Station', loc='upper right', frameon=True, facecolor='#1e293b', edgecolor='white', labelcolor='white')
    
    # Grille plus subtile
    plt.grid(True, linestyle=':', alpha=0.3, color='#94a3b8')
    
    # Rotation des dates
    plt.xticks(rotation=45)
    
    # Suppression des bordures du cadre
    sns.despine(left=True, bottom=True)
    
    plt.tight_layout()
    plt.savefig('poitiers_history.png', dpi=300, transparent=True) # Fond transparent pour intégration
    plt.close()
    
    # Reset du style pour éviter d'impacter d'autres graphiques si réutilisé
    plt.style.use('default') 
    
    print("Graphique Poitiers sauvegardé sous 'poitiers_history.png'")

def process_data(df):
    """
    Nettoie et prépare les données pour l'analyse.
    """
    # Conversion de la colonne 'date' en objets datetime pour faciliter les manipulations temporelles
    if 'date' in df.columns:
        df['date'] = pd.to_datetime(df['date'])
        df['year'] = df['date'].dt.year
        df['month'] = df['date'].dt.month
    
    # Normalisation du nom de la région (si disponible)
    # L'API renvoie souvent 'nom_reg' ou 'libgeo' qui contient la région/département
    # Si 'nom_reg' n'existe pas, on essaie de le déduire ou on utilise 'nom' (Station) comme fallback
    if 'nom_reg' not in df.columns:
        # Fallback simple : on crée une colonne 'nom_reg' vide ou basée sur autre chose si nécessaire
        # Pour l'instant, on espère que l'API le renvoie (c'est le cas pour SYNOP ODS)
        pass
        
    return df

def generate_map(df):
    """
    Génère une carte interactive Folium montrant les températures par station.
    Sauvegarde le résultat dans 'weather_map.html'.
    """
    print("Génération de la carte Folium...")
    
    # Extraction des coordonnées (Latitude/Longitude) depuis la colonne 'coordonnees'
    # L'API renvoie souvent un dictionnaire ou une liste [lat, lon]
    if 'coordonnees' in df.columns:
        df['lat'] = df['coordonnees'].apply(lambda x: x['lat'] if isinstance(x, dict) else (x[0] if isinstance(x, list) else None))
        df['lon'] = df['coordonnees'].apply(lambda x: x['lon'] if isinstance(x, dict) else (x[1] if isinstance(x, list) else None))
    
    # Agrégation par station ('nom') pour obtenir la température moyenne ('tc')
    if 'nom' in df.columns and 'tc' in df.columns:
        avg_temps = df.groupby('nom')['tc'].mean().reset_index()
        # On garde les coordonnées de la première occurrence pour chaque station
        coords = df.groupby('nom')[['lat', 'lon']].first().reset_index()
        map_data = pd.merge(avg_temps, coords, on='nom')
        
        # Création de la carte centrée sur la France
        # attributionControl=False pour un look plus épuré (demande utilisateur)
        m = folium.Map(location=[46.603354, 1.888334], zoom_start=6, tiles='CartoDB dark_matter', attributionControl=False)
        
        # Ajout des marqueurs pour chaque station
        for _, row in map_data.iterrows():
            if pd.notnull(row['lat']) and pd.notnull(row['lon']):
                temp = row['tc']
                
                # Code couleur selon la température
                color = 'blue' if temp < 10 else ('green' if temp < 20 else ('orange' if temp < 30 else 'red'))
                
                # Marqueur avec icône de thermomètre
                folium.Marker(
                    location=[row['lat'], row['lon']],
                    popup=f"<b>{row['nom']}</b><br>Temp: {temp:.1f}°C",
                    icon=folium.Icon(color=color, icon='thermometer-half', prefix='fa')
                ).add_to(m)
        
        # Ajout de la légende personnalisée
        legend_html = '''
        <div style="position: fixed; 
                    bottom: 50px; left: 50px; width: 150px; height: 130px; 
                    border:2px solid grey; z-index:9999; font-size:14px;
                    background-color:rgba(255, 255, 255, 0.8);
                    border-radius: 10px; padding: 10px;">
            <b>Température</b><br>
            <i class="fa fa-thermometer-half" style="color:blue"></i> &lt; 10°C<br>
            <i class="fa fa-thermometer-half" style="color:green"></i> 10-20°C<br>
            <i class="fa fa-thermometer-half" style="color:orange"></i> 20-30°C<br>
            <i class="fa fa-thermometer-half" style="color:red"></i> &gt; 30°C
        </div>
        '''
        m.get_root().html.add_child(folium.Element(legend_html))
        
        m.save('weather_map.html')
        print("Carte sauvegardée sous 'weather_map.html'")

def generate_charts(df):
    """
    Génère les graphiques statiques (images PNG) pour le dashboard.
    """
    print("Génération des graphiques...")
    # Utilisation du style sombre pour correspondre au dashboard
    plt.style.use('dark_background')
    
    # --- GRAPHIQUE 1 : Comparaison Température par Région et par Année (STRICT COMPLIANCE) ---
    # On utilise 'nom_reg' si dispo, sinon on essaie de grouper par 'nom' (Station) en attendant mieux
    # Mais pour la consigne "Région/Année", on va faire de notre mieux avec les données.
    
    region_col = 'nom_reg' if 'nom_reg' in df.columns else 'nom' # Fallback sur Station si Région manquante
    title_text = 'Température Moyenne par Région et par Année' if 'nom_reg' in df.columns else 'Température Moyenne par Station et par Année'
    
    if 'tc' in df.columns and 'year' in df.columns:
        plt.figure(figsize=(12, 6))
        
        # Agrégation par Région et Année
        chart_data = df.groupby([region_col, 'year'])['tc'].mean().reset_index()
        
        # Si trop de régions/stations, on prend les 10 plus fréquentes/importantes pour la lisibilité
        top_regions = chart_data[region_col].unique()[:10]
        chart_data = chart_data[chart_data[region_col].isin(top_regions)]
        
        sns.barplot(data=chart_data, x=region_col, y='tc', hue='year', palette='viridis')
        
        plt.title(title_text, fontsize=16, fontweight='bold', color='white')
        plt.xlabel('Région / Lieu', fontsize=12, color='#cbd5e1')
        plt.ylabel('Température Moyenne (°C)', fontsize=12, color='#cbd5e1')
        plt.legend(title='Année')
        plt.xticks(rotation=45)
        
        # Suppression des bordures du cadre
        sns.despine(left=True, bottom=True)
    
        plt.tight_layout()
        plt.savefig('weather_chart.png', transparent=True)
        plt.close()
        print("Graphique 1 sauvegardé sous 'weather_chart.png'")


    # --- GRAPHIQUE 2 : Focus Local (Poitiers - IUT) ---
    # Remplacé par la fonction spécifique generate_poitiers_graph
    pass

    # --- GRAPHIQUE 3 : Indicateur Innovant (Joint Plot - Hexbin) ---
    if 'tc' in df.columns and 'u' in df.columns:
        # Création du JointGrid plus grand (height=10 au lieu du defaut 6)
        g = sns.jointplot(data=df, x='tc', y='u', kind='hex', color='#4CB391', height=10)
        
        # Personnalisation des labels avec couleur visible sur fond sombre
        g.set_axis_labels('Température (°C)', 'Humidité (%)', fontsize=14, color='#cbd5e1')
        
        # Adaptation couleurs pour thème sombre des ticks
        g.ax_joint.tick_params(colors='#94a3b8')
        g.ax_marg_x.tick_params(colors='#94a3b8')
        g.ax_marg_y.tick_params(colors='#94a3b8')

        # Adaptation couleurs pour thème sombre
        # Difficile de changer tous les labels d'un jointplot facilement en seaborn pur, 
        # mais le transparent=True fera le gros du travail.
        
        # Ajustement pour éviter que les labels ne soient coupés
        g.fig.tight_layout()
        
        plt.savefig('extreme_weather.png', transparent=True)
        plt.close()
        print("Graphique 3 (Innovant) sauvegardé sous 'extreme_weather.png'")
    
    # Reset du style
    plt.style.use('default')

if __name__ == "__main__":
    # Exécution principale du script
    
    # 1. Données globales (Jan 2023/2024) pour la carte et stats générales
    df_global = fetch_weather_data()
    if not df_global.empty:
        df_global = process_data(df_global)
        generate_map(df_global)
        generate_charts(df_global)
    else:
        print("Aucune donnée globale récupérée.")
        
    # 2. Données spécifiques Poitiers (Historique)
    df_poitiers = fetch_poitiers_history()
    if not df_poitiers.empty:
        df_poitiers = process_data(df_poitiers)
        generate_poitiers_graph(df_poitiers)
    else:
        print("Aucune donnée Poitiers récupérée.")
