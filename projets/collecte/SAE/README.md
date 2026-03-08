# Guide d'Installation

## Prérequis
Assurez-vous d'avoir Python installé sur votre machine.

## Installation des dépendances
Pour faire fonctionner l'application, vous devez installer les bibliothèques Python suivantes :

```bash
pip install pandas requests folium matplotlib seaborn
```

## Détail des bibliothèques
- **requests** : Pour récupérer les données via API (Météo) et télécharger le HTML (Wikipédia).
- **pandas** : Pour stocker et manipuler les données dans des DataFrames.
- **folium** : Pour générer les cartes interactives.
- **matplotlib** & **seaborn** : Pour générer les graphiques statistiques.

## Lancement
Pour lancer le scraping Wikipédia et le serveur :
```bash
python run.py
```

Pour lancer le dashboard Météo :
```bash
python api_weather.py
```
