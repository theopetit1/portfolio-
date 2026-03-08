<?php
// Compteur de visiteurs simple
$fichier_compteur = 'compteur.txt';

// Vérifier si le fichier existe, sinon le créer avec 0
if (!file_exists($fichier_compteur)) {
    file_put_contents($fichier_compteur, '0');
}

// Lire le nombre actuel
$visiteurs = (int) file_get_contents($fichier_compteur);

// Incrémenter
$visiteurs++;

// Sauvegarder le nouveau nombre
file_put_contents($fichier_compteur, $visiteurs);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="logo2.png">
    <title>Théo PETIT - Portfolio</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation@3.0.1/dist/chartjs-plugin-annotation.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
    <!-- Import style_mobile FIRST so style.css can override it -->
    <link rel="stylesheet" href="style_mobile.css?v=12">
    <link rel="stylesheet" href="style.css?v=20">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            overflow-x: hidden;
        }

        html {
            scroll-behavior: smooth;
        }

        /* Section À propos */
        .section {
            min-height: 100vh;
            padding: 8rem 3rem 4rem;
            background: #F9FAFB;
        }

        .section-title {
            font-size: clamp(2rem, 4vw, 3rem);
            font-weight: 800;
            color: #2C3E50;
            margin-bottom: 1rem;
            letter-spacing: -0.02em;
            text-transform: uppercase;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -5px;
            right: 0;
            width: 40%;
            height: 4px;
            background: #5A8FBD;
            border-radius: 2px;
        }

        .section-subtitle {
            font-size: 1.1rem;
            font-weight: 400;
            color: #6B7280;
            margin-bottom: 4rem;
            text-align: left;
        }

        /* Carousel moderne pour À propos */
        .carousel-container {
            display: flex;
            align-items: center;
            gap: 4rem;
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
        }

        .carousel-content {
            flex: 1;
            max-width: 500px;
        }

        .carousel-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #111;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .carousel-description {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #4B5563;
            margin-bottom: 2rem;
            overflow: hidden;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.5s ease forwards;
        }

        .carousel-progress-container {
            width: 100%;
            height: 4px;
            background: #E5E7EB;
            border-radius: 2px;
            margin-top: 1rem;
            margin-bottom: 1rem;
            /* Closer to arrows */
            overflow: hidden;
        }

        .carousel-progress-bar {
            height: 100%;
            background: #5A8FBD;
            width: 0%;
            border-radius: 2px;
            /* Transition gérée en JS */
        }

        .carousel-nav {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .carousel-nav-btn {
            width: 48px;
            height: 48px;
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #4B5563;
        }

        .carousel-nav-btn:hover {
            background: #F9FAFB;
            border-color: #5A8FBD;
            color: #5A8FBD;
            transform: scale(1.05);
        }

        .carousel-nav-btn svg {
            width: 20px;
            height: 20px;
        }

        .carousel-dots {
            display: flex;
            gap: 0.8rem;
            margin-top: 2rem;
        }

        .carousel-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 2px solid transparent;
        }

        .carousel-dot:hover {
            background: rgba(90, 143, 189, 0.4);
            transform: scale(1.2);
        }

        .carousel-dot.active {
            background: transparent;
            width: 40px;
            border-radius: 6px;
            border-color: #5A8FBD;
        }

        /* Animation de progression à l'intérieur du dot actif */
        .carousel-dot.active::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            background: linear-gradient(90deg, #111 0%, #5A8FBD 100%);
            border-radius: 6px;
            animation: carousel-fill-progress 8s linear;
        }

        @keyframes carousel-fill-progress {
            0% {
                width: 0%;
            }

            100% {
                width: 100%;
            }
        }

        /* Bouton Télécharger CV */
        .cv-download-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem 2rem;
            margin-top: 2rem;
            background: linear-gradient(135deg, #1E3A8A 0%, #3B82F6 100%);
            color: white;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            cursor: pointer;
        }

        .cv-download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(59, 130, 246, 0.4);
            background: linear-gradient(135deg, #1E40AF 0%, #60A5FA 100%);
        }

        .cv-download-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 10px rgba(59, 130, 246, 0.3);
        }

        .cv-download-btn svg {
            width: 20px;
            height: 20px;
            stroke-width: 2.5;
        }

        /* Cylindre 3D pour les images */
        .carousel-images {
            flex: 1;
            height: 600px;
            position: relative;
            perspective: 1000px;
            /* 3D Perspective */
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: grab;
        }

        .carousel-images:active {
            cursor: grabbing;
        }

        .cylinder-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            /* Enable 3D */
            transition: transform 1s cubic-bezier(0.2, 0.8, 0.2, 1);
        }

        .cylinder-image {
            position: absolute;
            width: 280px;
            height: 500px;
            left: 50%;
            top: 50%;
            transform-origin: center;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            transition: all 0.5s ease;
            /* Faster transition for opacity/shadow */
            /* Glassmorphism */
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            cursor: pointer;

            /* Prevent Selection */
            user-select: none;
            -webkit-user-drag: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .cylinder-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
            transition: all 0.5s ease;
            pointer-events: none;
            /* Prevent image drag behavior */
        }

        .cylinder-image.active img {
            opacity: 1;
        }

        .cylinder-image.active {
            box-shadow: 0 0 30px rgba(90, 143, 189, 0.4);
            border: 1px solid rgba(90, 143, 189, 0.5);
        }

        /* Section Projets */
        .projects-section {
            min-height: 100vh;
            padding: 6rem 3rem;
            background: linear-gradient(180deg, #F9FAFB 0%, #FFFFFF 50%, #F3F4F6 100%);
            opacity: 0;
            transform: translateY(50px);
            transition: opacity 1s ease, transform 1s ease;
        }

        .projects-section.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .projects-header {
            text-align: left;
            margin-bottom: 4rem;
        }

        /* Controls Container */
        .projects-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4rem;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .filters-group {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        /* Modernized Tabs */
        .project-tab {
            padding: 0.8rem 2rem;
            background: white;
            border: 2px solid #E5E7EB;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            color: #6B7280;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .project-tab:hover {
            border-color: #B8D4EC;
            color: #5A8FBD;
            transform: translateY(-2px);
        }

        .project-tab.active {
            background: #5A8FBD;
            color: white;
            border-color: #5A8FBD;
            box-shadow: 0 4px 15px rgba(90, 143, 189, 0.3);
        }

        /* View Toggles */
        .view-controls {
            display: flex;
            gap: 1rem;
        }

        .view-btn {
            width: 44px;
            height: 44px;
            border: 2px solid #E5E7EB;
            background: white;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #9CA3AF;
        }

        .view-btn svg {
            width: 24px;
            height: 24px;
            stroke-width: 2;
        }

        .view-btn:hover {
            border-color: #B8D4EC;
            color: #5A8FBD;
        }

        .view-btn.active {
            border-color: #2C3E50;
            color: #2C3E50;
            background: #F3F4F6;
        }

        /* View Modes Modifier Classes */
        .projects-grid.view-large {
            grid-template-columns: repeat(2, 1fr);
        }

        /* In Large/List View, images are always visible and interactions simplified */
        .projects-grid.view-large .project-image {
            height: 350px !important;
            opacity: 1 !important;
        }

        .projects-grid.view-large .project-card:hover .project-image {
            transform: scale(1.02);
            /* Subtle zoom instead of disappearing */
        }


        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            max-width: 1400px;
            margin: 0 auto;
            /* Empêche l'étirement des cartes voisines */
        }

        .project-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.4s ease;
            text-decoration: none;
            display: block;
        }

        .project-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }

        .project-image {
            width: 100%;
            height: 280px;
            /* Visible par défaut (Mobile) */
            opacity: 1;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .project-card:hover .project-image {
            transform: scale(1.05);
        }

        /* Effet de survol uniquement sur PC */
        @media (min-width: 769px) {
            .project-image {
                height: 0;
                opacity: 0;
                transition: height 0.6s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.6s ease-in-out, transform 0.6s ease;
            }

            .project-card:hover .project-image {
                height: 280px;
                opacity: 1;
            }

            .project-content {
                padding: 3.5rem;
                /* Increased padding for PC to prevent text crowding */
            }
        }

        /* Mobile Responsive for Grid Views */
        @media (max-width: 768px) {
            .projects-controls {
                flex-direction: column;
                gap: 1.5rem;
            }

            .filters-group {
                justify-content: center;
                width: 100%;
            }

            .view-controls {
                width: 100%;
                justify-content: center;
            }

            /* Default Grid on Mobile = 2 Columns (User Request) */
            .projects-grid {
                grid-template-columns: repeat(2, 1fr) !important;
                gap: 1rem;
            }

            /* Large View on Mobile = 1 Column (User Request) */
            .projects-grid.view-large {
                grid-template-columns: 1fr !important;
            }

            .project-card {
                /* Ensure content fits in 2-col mode */
            }

            .project-content {
                padding: 1rem;
            }
        }

        .project-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2C3E50;
            margin-bottom: 0.8rem;
        }

        .project-description {
            font-size: 1rem;
            line-height: 1.6;
            color: #6B7280;
            margin-bottom: 1.5rem;
        }

        .project-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
        }

        .project-tag {
            padding: 0.4rem 1rem;
            background: #F3F4F6;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            color: #4B5563;
        }

        .projects-content {
            display: none;
        }

        .projects-content.active {
            display: block;
        }

        /* Section Expérience - Carrousel avec images de fond */
        .experience-section {
            min-height: 100vh;
            padding: 0;
            background: #FFFFFF;
            /* White background for header */
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .experience-dark-content {
            background: transparent;
            /* Transparent to show image behind */
            position: relative;
            width: 100%;
            padding: 0;
            /* Remove padding to allow full screen */
            min-height: 800px;
        }

        .experience-carousel-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
            /* Behind timeline */
        }

        .experience-slides {
            display: flex;
            transition: transform 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
        }

        .experience-slide {
            min-width: 100%;
            height: 100%;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .experience-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.6);
            /* Slightly dark image */
        }

        .experience-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.7) 0%, rgba(0, 0, 0, 0.4) 100%);
            /* Dark overlay for text readability */
        }

        .experience-content-wrapper {
            position: relative;
            z-index: 2;
            max-width: 1200px;
            width: 90%;
            padding: 4rem;
            color: white;
            /* White text on dark overlay */
            background: rgba(255, 255, 255, 0.05);
            /* Glass effect */
            backdrop-filter: blur(20px);
            border-radius: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .experience-header-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            margin-bottom: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .experience-logo-mini {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            object-fit: contain;
            background: white;
            padding: 6px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .experience-period-text {
            font-size: 0.95rem;
            font-weight: 600;
            color: rgba(255, 255, 255, 0.8);
            /* Slate gray text */
        }

        /* Badge "Actuellement" */
        .experience-current-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            padding: 0.6rem 1.3rem;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 700;
            color: white;
            margin-bottom: 2rem;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.4);
            animation: pulse-badge 2s infinite;
        }

        @keyframes pulse-badge {

            0%,
            100% {
                box-shadow: 0 44px 15px rgba(76, 175, 80, 0.4);
            }

            50% {
                box-shadow: 0 4px 25px rgba(76, 175, 80, 0.6);
            }
        }

        .experience-current-badge::before {
            content: '';
            width: 8px;
            height: 8px;
            background: white;
            border-radius: 50%;
            animation: blink 1.5s infinite;
        }

        @keyframes blink {

            0%,
            100% {
                opacity: 1;
            }

            50% {
                opacity: 0.3;
            }
        }

        /* Dates mises en valeur */
        .experience-dates-highlight {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .experience-date-box {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            padding: 1rem 1.8rem;
            border-radius: 16px;
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .experience-date-label {
            font-size: 0.8rem;
            font-weight: 600;
            color: rgba(255, 255, 255, 0.7);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.3rem;
        }

        .experience-date-value {
            font-size: 1.3rem;
            font-weight: 800;
            color: white;
        }

        .experience-duration {
            background: linear-gradient(135deg, rgba(184, 212, 236, 0.15) 0%, rgba(90, 143, 189, 0.15) 100%);
            padding: 0.8rem 1.5rem;
            border-radius: 16px;
            border: 2px solid rgba(184, 212, 236, 0.2);
        }

        .experience-duration-text {
            font-size: 1rem;
            font-weight: 700;
            color: #B8D4EC;
            /* Light blue for dark bg */
        }

        .experience-title-large {
            font-size: 4rem;
            font-weight: 800;
            color: white;
            margin-bottom: 1rem;
            line-height: 1.1;
            text-shadow: 0 2px 20px rgba(0, 0, 0, 0.3);
        }

        .experience-company-large {
            font-size: 1.8rem;
            font-weight: 600;
            color: #B8D4EC;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .experience-period {
            font-size: 1.1rem;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
            font-style: italic;
        }

        .experience-description-large {
            font-size: 1.2rem;
            line-height: 1.9;
            color: rgba(255, 255, 255, 0.95);
            margin-bottom: 3rem;
            max-width: 800px;
            text-shadow: 0 1px 10px rgba(0, 0, 0, 0.3);
        }

        .experience-skills-large {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 3rem;
        }

        .experience-skill-large {
            padding: 0.8rem 1.8rem;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 30px;
            font-size: 0.95rem;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .experience-skill-large:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-3px);
        }

        .experience-recommendation-large {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-left: 4px solid #B8D4EC;
            padding: 2rem 2.5rem;
            border-radius: 16px;
            max-width: 700px;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .recommendation-text-large {
            font-size: 1.1rem;
            line-height: 1.8;
            color: rgba(255, 255, 255, 0.95);
            font-style: italic;
            margin-bottom: 1rem;
        }

        .recommendation-author-large {
            font-size: 1rem;
            font-weight: 700;
            color: white;
            margin-bottom: 0.3rem;
        }

        .recommendation-role-large {
            font-size: 0.9rem;
            color: #B8D4EC;
            font-weight: 500;
        }

        /* Frise chronologique (Timeline) - Fixe au dessus du carousel */
        /* Timeline Container - ensure it's on top */
        .experience-timeline {
            position: relative;
            max-width: 1000px;
            margin: 0 auto 4rem;
            z-index: 10;
            /* Above carousel */
            padding-top: 4rem;
            /* Add padding here instead of wrapper */
        }

        .timeline-line {
            position: relative;
            height: 4px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 2px;
            margin: 0 auto;
            width: 80%;
            max-width: 900px;
            margin-bottom: 1rem;
        }

        .timeline-progress {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            background: linear-gradient(90deg, #B8D4EC 0%, #5A8FBD 100%);
            border-radius: 2px;
            transition: width 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .timeline-points-container {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            width: 100%;
            height: 0;
        }

        .timeline-point {
            position: absolute;
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
            transition: left 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            pointer-events: all;
            left: 50%;
            transform: translateX(-50%);
            top: -6px;
            /* Centrer le point sur la ligne (16px de hauteur / 2 - 4px de ligne / 2) */
        }

        .timeline-dot {
            width: 16px;
            height: 16px;
            background: rgba(255, 255, 255, 0.3);
            border: 3px solid rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            margin-bottom: 0.8rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .timeline-point.active .timeline-dot {
            background: #B8D4EC;
            border-color: white;
            box-shadow: 0 0 20px rgba(184, 212, 236, 0.8), 0 0 40px rgba(184, 212, 236, 0.4);
            width: 20px;
            height: 20px;
        }

        .timeline-point:hover .timeline-dot {
            transform: scale(1.2);
        }

        .timeline-date {
            font-size: 0.85rem;
            font-weight: 600;
            color: rgba(255, 255, 255, 0.7);
            white-space: nowrap;
            transition: all 0.3s ease;
        }

        .timeline-point.active .timeline-date {
            color: white;
            font-weight: 700;
            font-size: 0.95rem;
        }

        /* Layout avec logo entreprise */
        .experience-main-content {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 3rem;
            align-items: start;
        }

        .experience-left-section {
            display: flex;
            flex-direction: column;
        }

        .experience-header-section {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .experience-company-logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            background: white;
            padding: 8px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .experience-header-text {
            flex: 1;
        }

        .experience-right-section {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        /* Navigation Arrows */
        .experience-nav {
            position: absolute;
            bottom: 4rem;
            right: 4rem;
            z-index: 10;
            display: flex;
            gap: 1rem;
        }

        .experience-nav-btn {
            width: 60px;
            height: 60px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .experience-nav-btn:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: scale(1.1);
        }

        .experience-nav-btn svg {
            width: 24px;
            height: 24px;
            color: white;
        }

        /* Indicateurs */
        .experience-indicators {
            position: absolute;
            bottom: 4rem;
            left: 50%;
            transform: translateX(-50%);
            z-index: 10;
            display: flex;
            gap: 1rem;
        }

        .experience-indicator {
            width: 12px;
            height: 12px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .experience-indicator:hover {
            background: rgba(255, 255, 255, 0.4);
            transform: scale(1.2);
        }

        .experience-indicator.active {
            background: rgba(255, 255, 255, 0.3);
            width: 40px;
            border-radius: 6px;
        }

        /* Animation de progression à l'intérieur de l'indicateur actif */
        .experience-indicator.active::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            background: linear-gradient(90deg, white 0%, #B8D4EC 100%);
            border-radius: 6px;
            animation: fill-progress 10s linear infinite;
        }

        @keyframes fill-progress {
            0% {
                width: 0%;
            }

            100% {
                width: 100%;
            }
        }

        @media (max-width: 968px) {
            .experience-title-large {
                font-size: 2.5rem;
            }

            .experience-company-large {
                font-size: 1.3rem;
            }

            .experience-description-large {
                font-size: 1rem;
            }

            .experience-content-wrapper {
                padding: 2rem;
            }

            .experience-nav {
                bottom: 2rem;
                right: 2rem;
            }

            .experience-indicators {
                bottom: 2rem;
            }
        }

        /* Experience View All Button */
        .experience-view-all-btn {
            position: absolute;
            top: 2rem;
            right: 2rem;
            z-index: 20;
            padding: 0.8rem 1.5rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .experience-view-all-btn:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* Section Engagements - Modern Alternating Layout */
        .engagements-section {
            min-height: 100vh;
            padding: 6rem 3rem;
            background: linear-gradient(180deg, #F9FAFB 0%, #FFFFFF 50%, #E8F2F9 100%);
            overflow-x: hidden;
            /* Prevent horizontal scroll from animations */
        }

        .engagements-header {
            text-align: left;
            margin-bottom: 6rem;
        }

        .engagements-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2.5rem;
            padding: 0 1rem;
        }

        /* Removed .engagement-row styles */

        /* Removed image container styles */



        .engagement-content {
            height: 100%;
            /* Equal height */
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;

            /* Background Shape Style */
            background: white;
            border-radius: 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(0, 0, 0, 0.03);
            position: relative;
            z-index: 2;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .engagement-content:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
        }

        .engagement-title-modern {
            font-size: 2rem;
            font-weight: 800;
            color: #2C3E50;
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }

        .engagement-org-modern {
            font-size: 1.1rem;
            color: #5A8FBD;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: block;
        }

        .engagement-desc-modern {
            font-size: 1.05rem;
            line-height: 1.8;
            color: #6B7280;
            margin-bottom: 2rem;
        }

        .engagement-period-badge {
            display: inline-block;
            padding: 0.5rem 1rem;
            background: #F3F4F6;
            color: #4B5563;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        @media (max-width: 968px) {
            .engagements-container {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .engagement-content {
                padding: 2rem;
            }
        }

        .engagement-card-header {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .engagement-image-wrapper {
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #E8F2F9 0%, #D6E7F5 100%);
            height: 300px;
            flex-shrink: 0;
        }

        .engagement-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .engagement-card:hover .engagement-image {
            transform: scale(1.05);
        }

        .engagement-image-placeholder {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: #5A8FBD;
        }

        .engagement-card-info {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .engagement-card-top {
            margin-bottom: 1rem;
        }

        .engagement-card-title-group {
            flex: 1;
        }

        .engagement-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2C3E50;
            margin-bottom: 0.5rem;
            transition: color 0.3s ease;
        }

        .engagement-card:hover .engagement-title {
            color: #5A8FBD;
        }

        .engagement-organization {
            font-size: 0.95rem;
            font-weight: 500;
            color: #6B7280;
            margin-bottom: 0.75rem;
        }

        .engagement-period {
            font-size: 0.9rem;
            font-weight: 600;
            color: #5A8FBD;
            background: #E8F2F9;
            padding: 0.4rem 1rem;
            border-radius: 12px;
            display: inline-block;
            margin-bottom: 1rem;
        }

        .engagement-expand-btn {
            display: none;
        }

        .engagement-short-description {
            font-size: 0.95rem;
            line-height: 1.7;
            color: #6B7280;
            margin-bottom: 1.5rem;
            flex: 1;
        }

        .engagement-content {
            /* display: none; REMOVED */
        }



        .engagement-content-inner {
            padding: 0 3rem 3rem 3rem;
            border-top: 1px solid #E5E7EB;
            padding-top: 2.5rem;
        }

        .engagement-description {
            font-size: 1.05rem;
            line-height: 1.8;
            color: #4B5563;
            margin-bottom: 2.5rem;
            padding: 1.5rem 2rem;
            background: linear-gradient(135deg, #F9FAFB 0%, #EFF6FB 100%);
            border-radius: 16px;
            border-left: 4px solid #5A8FBD;
        }

        .engagement-details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .engagement-detail-card {
            background: #FAFBFC;
            border: 2px solid #E5E7EB;
            border-radius: 16px;
            padding: 2rem;
            transition: all 0.3s ease;
        }

        .engagement-detail-card:hover {
            border-color: #5A8FBD;
            background: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(90, 143, 189, 0.1);
        }

        .engagement-detail-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .engagement-detail-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #E8F2F9 0%, #D6E7F5 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .engagement-detail-icon svg {
            width: 24px;
            height: 24px;
            color: #5A8FBD;
        }

        .engagement-detail-title {
            font-size: 1.15rem;
            font-weight: 700;
            color: #2C3E50;
        }

        .engagement-detail-text {
            font-size: 0.98rem;
            line-height: 1.7;
            color: #6B7280;
        }

        .engagement-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.8rem;
        }

        .engagement-tag {
            padding: 0.6rem 1.2rem;
            background: linear-gradient(135deg, #E8F2F9 0%, #D6E7F5 100%);
            color: #5A8FBD;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .engagement-tag:hover {
            background: linear-gradient(135deg, #5A8FBD 0%, #7BA5C9 100%);
            color: white;
            transform: translateY(-2px);
        }

        @media (max-width: 968px) {
            .engagement-card-header {
                grid-template-columns: 1fr;
            }

            .engagement-image-wrapper {
                min-height: 240px;
            }

            .engagement-card-info {
                padding: 2rem;
            }

            .engagement-content-inner {
                padding: 2rem;
            }
        }

        /* Section Statistiques */
        .statistics-section {
            min-height: 100vh;
            padding: 6rem 3rem;
            background: linear-gradient(180deg, #F3F4F6 0%, #FFFFFF 50%, #F9FAFB 100%);
            /* opacity: 0; REMOVED */
            /* transform: translateY(50px); REMOVED */
            /* transition: opacity 1s ease, transform 1s ease; REMOVED */
        }

        .statistics-header {
            text-align: left;
            margin-bottom: 4rem;
        }

        .statistics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2.5rem;
            max-width: 1400px;
            margin: 0 auto;
            margin-bottom: 4rem;
        }

        .stat-card {
            background: white;
            border-radius: 20px;
            padding: 3rem 2rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, #5A8FBD 0%, #B8D4EC 100%);
        }

        .stat-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 50px rgba(90, 143, 189, 0.2);
        }

        .stat-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #B8D4EC 0%, #5A8FBD 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            transition: transform 0.3s ease;
        }

        .stat-card:hover .stat-icon {
            transform: scale(1.1) rotate(5deg);
        }

        .stat-icon svg {
            width: 35px;
            height: 35px;
            color: white;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            color: #2C3E50;
            margin-bottom: 0.5rem;
            line-height: 1;
        }

        .stat-label {
            font-size: 1rem;
            font-weight: 600;
            color: #5A8FBD;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.5rem;
        }

        .stat-description {
            font-size: 0.9rem;
            color: #6B7280;
            line-height: 1.5;
        }

        .stat-number.counter {
            background: linear-gradient(135deg, #5A8FBD 0%, #2C3E50 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Charts Container */
        .charts-container {
            max-width: 1400px;
            margin: 4rem auto 0;
        }

        .charts-main-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: #2C3E50;
            text-align: center;
            margin-bottom: 3rem;
        }

        .chart-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 3rem;
            /* opacity: 0; REMOVED */
            /* transform: translateY(30px); REMOVED */
            /* transition: all 0.8s ease; REMOVED */
        }

        .chart-title {
            font-size: 1.6rem;
            font-weight: 700;
            color: #2C3E50;
            margin-bottom: 0.5rem;
        }

        .chart-subtitle {
            font-size: 0.95rem;
            color: #6B7280;
            margin-bottom: 2rem;
        }

        .chart-wrapper {
            position: relative;
            height: 350px;
            width: 100%;
        }

        @media (max-width: 768px) {
            .charts-main-title {
                font-size: 1.8rem;
            }

            .chart-card {
                padding: 2rem 1.5rem;
            }

            .chart-wrapper {
                height: 300px !important;
                /* Force uniform height on mobile */
            }

            /* ... existing chart styles ... */

            /* Mobile Stats - KPI Grid */
            .statistics-grid {
                grid-template-columns: repeat(2, 1fr) !important;
                gap: 1rem;
            }

            /* Standardize Section Padding on Mobile */
            .statistics-section,
            .engagements-section {
                padding: 4rem 1.5rem !important;
                /* Standard mobile padding */
            }

            .contact-mobile-section {
                padding: 4rem 1.5rem 0 1.5rem !important;
                /* No bottom padding to fix gap */
                margin-bottom: 0 !important;
                padding-bottom: 3rem !important;
                /* Some breathing room before footer */
            }

            .stat-card {
                padding: 1.5rem 0.5rem;
            }

            /* ... rest of existing mobile stats styles ... */
            .stat-number {
                font-size: 1.8rem;
            }

            .stat-icon {
                width: 44px;
                height: 44px;
                margin-bottom: 0.8rem;
            }

            .stat-icon svg {
                width: 22px;
                height: 22px;
            }

            .stat-description {
                display: none;
            }
        }

        /* Masquer les liens mobile-only sur desktop */
        .nav-link-mobile-only {
            display: none;
        }

        /* Contact Mobile Section */
        .contact-mobile-section {
            display: none;
            min-height: auto;
            /* Remove 100vh constraint */
            padding: 6rem 3rem;
            background: linear-gradient(180deg, #FFFFFF 0%, #F3F4F6 50%, #FFFFFF 100%);
            margin-bottom: 0;
        }

        .contact-mobile-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .contact-mobile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .contact-mobile-card {
            background: white;
            border-radius: 16px;
            padding: 1.5rem 0.5rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.4s ease;
            text-decoration: none;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .contact-mobile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, #5A8FBD 0%, #B8D4EC 100%);
        }

        .contact-mobile-card:active {
            transform: scale(0.98);
        }

        .contact-mobile-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #B8D4EC 0%, #5A8FBD 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
        }

        .contact-mobile-icon svg {
            width: 24px;
            height: 24px;
            color: white;
        }

        .contact-mobile-title {
            font-size: 0.9rem;
            font-weight: 700;
            color: #2C3E50;
            margin-bottom: 0.8rem;
        }

        .contact-mobile-text {
            font-size: 0.8rem;
            color: #6B7280;
            word-break: break-word;
        }

        /* Skills Chart */
        .skills-chart {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }

        .skills-chart-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #2C3E50;
            margin-bottom: 2rem;
            text-align: center;
        }

        .skill-item {
            margin-bottom: 2rem;
        }

        .skill-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.8rem;
        }

        .skill-name {
            font-size: 1rem;
            font-weight: 600;
            color: #2C3E50;
        }

        .skill-percentage {
            font-size: 1rem;
            font-weight: 700;
            color: #5A8FBD;
        }

        .skill-bar-container {
            width: 100%;
            height: 12px;
            background: #E5E7EB;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .skill-bar {
            height: 100%;
            background: linear-gradient(90deg, #5A8FBD 0%, #B8D4EC 100%);
            border-radius: 10px;
            transition: width 1.5s cubic-bezier(0.34, 1.56, 0.64, 1);
            width: 0;
        }

        .skill-bar.animate {
            width: var(--skill-width);
        }



        /* Footer */
        .footer {
            background: #1a1a1a;
            color: #ffffff;
            padding: 4rem 3rem 2rem;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 3rem;
            margin-bottom: 3rem;
        }

        .footer-brand {
            max-width: 300px;
        }

        .footer-logo {
            font-size: 1.8rem;
            font-weight: 800;
            color: white;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-logo-img {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            object-fit: cover;
        }

        .footer-address {
            color: #b0b0b0;
            line-height: 1.8;
            font-size: 0.9rem;
            margin-bottom: 1.5rem;
        }

        .footer-contact {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .footer-contact-item {
            color: #b0b0b0;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-contact-label {
            color: #888;
            min-width: 80px;
        }

        .footer-contact a {
            color: #5A8FBD;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-contact a:hover {
            color: #B8D4EC;
        }

        .footer-logos {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            margin-top: 0;
        }

        .footer-university-logo {
            height: 60px;
            width: auto;
            object-fit: contain;
            opacity: 0.7;
            transition: all 0.3s ease;
            filter: brightness(0) invert(1);
        }

        .footer-university-logo:hover {
            opacity: 1;
            transform: scale(1.05);
        }

        .footer-section {
            display: flex;
            flex-direction: column;
        }

        .footer-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: white;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .footer-links {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
        }

        .footer-link {
            color: #b0b0b0;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            position: relative;
        }

        .footer-link::before {
            content: '↗';
            font-size: 0.8rem;
            opacity: 0;
            transform: translateX(-5px) translateY(2px);
            transition: all 0.3s ease;
        }

        .footer-link:hover {
            color: #5A8FBD;
        }

        .footer-link:hover::before {
            opacity: 1;
            transform: translateX(0) translateY(-2px);
        }

        .footer-bottom {
            border-top: 1px solid #333;
            padding-top: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer-copyright {
            color: #888;
            font-size: 0.85rem;
            text-align: center;
        }

        /* Hero avec carousel background */
        .hero {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }

        /* Carousel d'images */
        .bg-carousel {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            /* Behind sidebar */
        }

        .bg-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            opacity: 0;
            transition: opacity 1.5s ease-in-out;
        }

        .bg-slide.active {
            opacity: 1;
        }

        .bg-slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.2) 0%, rgba(0, 0, 0, 0.5) 100%);
        }

        /* Texte en bas à gauche */
        .hero-text {
            position: absolute;
            bottom: 8%;
            left: 5%;
            z-index: 2;
            color: white;
            max-width: 700px;
            opacity: 0;
            transform: translateY(20px);
            transition: all 1s ease;
        }

        .hero-text.active {
            opacity: 1;
            transform: translateY(0);
        }

        .hero-text h1 {
            font-size: clamp(2.5rem, 5vw, 4.5rem);
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 1rem;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            letter-spacing: -0.02em;
        }

        .hero-text p {
            font-size: clamp(1rem, 2vw, 1.3rem);
            font-weight: 300;
            line-height: 1.6;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            opacity: 0.95;
        }


        /* Scroll indicator */
        .scroll-indicator {
            position: absolute;
            bottom: 3%;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
            animation: bounce 2s infinite;
        }

        .scroll-indicator svg {
            width: 30px;
            height: 30px;
            color: white;
            opacity: 0.8;
            filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.3));
        }

        /* Hero Card Carousel */
        .hero-card-carousel {
            position: absolute;
            top: 100px;
            right: 5%;
            /* Positioned to the right for better balance */
            z-index: 10;
            width: 320px;
            height: 180px;
            perspective: 1000px;
        }

        .hero-card-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            transition: transform 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .hero-card-slide {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 20px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            opacity: 0;
            transform: translateY(20px) scale(0.95);
            transition: all 0.6s ease;
            pointer-events: none;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .hero-card-slide.active {
            opacity: 1;
            transform: translateY(0) scale(1);
            pointer-events: auto;
            z-index: 2;
        }

        /* Slide Content Styles */
        .card-header {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            margin-bottom: 0.8rem;
        }

        .card-icon-large {
            width: 40px;
            height: 40px;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
        }

        .card-title {
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            margin: 0;
        }

        .card-content {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.95rem;
        }

        /* Journal Slide */
        .journal-layout {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .journal-cover {
            width: 80px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .journal-info {
            flex: 1;
        }

        .reading-time {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            font-size: 0.85rem;
            color: #B8D4EC;
            margin-top: 0.5rem;
        }

        /* Crypto Slide */
        .crypto-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .crypto-row:last-child {
            border-bottom: none;
        }

        /* Weather Slide */
        .weather-main {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .weather-temp {
            font-size: 2.5rem;
            font-weight: 800;
            color: white;
        }

        .weather-details {
            text-align: right;
        }

        /* Navigation Dots */
        .hero-card-nav {
            position: absolute;
            bottom: -25px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 8px;
        }

        .hero-dot {
            width: 8px;
            height: 8px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .hero-dot.active {
            background: white;
            width: 20px;
            border-radius: 4px;
        }

        @media (max-width: 768px) {
            .hero-card-carousel {
                top: auto;
                bottom: 15%;
                /* Move to bottom on mobile */
                right: 50%;
                transform: translateX(50%);
                width: 90%;
                height: 160px;
            }

            /* --- Hero Card Carousel --- */
            .hero-card-carousel {
                position: absolute;
                right: 10%;
                top: 50%;
                transform: translateY(-50%);
                width: 320px;
                height: 200px;
                perspective: 1000px;
                z-index: 100;
            }

            .hero-card-slide {
                position: absolute;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 24px;
                padding: 1.5rem;
                opacity: 0;
                transform: translateX(50px) scale(0.9);
                transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
                pointer-events: none;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.1);
            }

            .hero-card-slide.active {
                opacity: 1;
                transform: translateX(0) scale(1);
                pointer-events: auto;
            }

            /* Slide Content Styles */
            .card-header {
                display: flex;
                align-items: center;
                gap: 0.8rem;
                margin-bottom: 0.8rem;
            }

            .card-title {
                color: white;
                font-size: 1.1rem;
                font-weight: 700;
                margin: 0;
            }

            .card-content {
                color: rgba(255, 255, 255, 0.9);
                font-size: 0.95rem;
            }

            /* Journal Slide */
            .journal-layout {
                display: flex;
                gap: 1rem;
                align-items: center;
            }

            .journal-cover {
                width: 80px;
                height: 100px;
                object-fit: cover;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            }

            .journal-info {
                flex: 1;
            }

            .reading-time {
                display: flex;
                align-items: center;
                gap: 0.4rem;
                font-size: 0.85rem;
                color: #B8D4EC;
                margin-top: 0.5rem;
            }

            /* Crypto Slide */
            .crypto-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.5rem 0;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .crypto-row:last-child {
                border-bottom: none;
            }

            /* Weather Slide */
            .weather-main {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .weather-temp {
                font-size: 2.5rem;
                font-weight: 800;
                color: white;
            }

            .weather-details {
                text-align: right;
            }

            /* Navigation Dots */
            .hero-card-nav {
                position: absolute;
                bottom: -25px;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
                gap: 8px;
            }

            .hero-dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.3);
                cursor: pointer;
                transition: all 0.3s;
            }

            .hero-dot.active {
                background: #5A8FBD;
                width: 24px;
                border-radius: 4px;
            }
        }

        @keyframes bounce {

            0%,
            100% {
                transform: translateX(-50%) translateY(0);
            }

            50% {
                transform: translateX(-50%) translateY(-10px);
            }
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .experience-timeline::before {
                left: 30px;
            }

            .experience-item {
                flex-direction: row !important;
                padding-left: 80px;
            }

            .experience-marker {
                left: 30px;
            }

            .carousel-container {
                flex-direction: column;
                gap: 3rem;
            }

            .carousel-content {
                max-width: 100%;
                text-align: center;
            }

            .carousel-images {
                height: 500px;
            }

            .cylinder-wrapper {
                width: 400px;
                height: 400px;
            }

            .cylinder-image {
                width: 220px;
                height: 400px;
            }

            .carousel-nav {
                top: auto;
                bottom: 2rem;
            }

            .carousel-nav.prev {
                left: 50%;
                transform: translateX(-60px);
            }

            .carousel-nav.next {
                right: auto;
                left: 50%;
                transform: translateX(10px);
            }
        }

        /* Bouton Hamburger */
        .hamburger {
            display: none;
            flex-direction: column;
            justify-content: space-around;
            width: 30px;
            height: 24px;
            background: transparent;
            border: none;
            cursor: pointer;
            padding: 0;
            z-index: 1001;
        }

        .hamburger span {
            width: 100%;
            height: 3px;
            background: #111;
            border-radius: 2px;
            transition: all 0.3s ease;
        }

        .hamburger.active span:nth-child(1) {
            transform: translateY(10.5px) rotate(45deg);
        }

        .hamburger.active span:nth-child(2) {
            opacity: 0;
        }

        .hamburger.active span:nth-child(3) {
            transform: translateY(-10.5px) rotate(-45deg);
        }

        @media (max-width: 768px) {

            .section {
                padding: 6rem 1.5rem 3rem;
            }

            .carousel-title {
                font-size: 2rem;
            }

            .carousel-description {
                font-size: 1rem;
            }

            .carousel-images {
                height: 400px;
            }

            .cylinder-wrapper {
                width: 300px;
                height: 300px;
            }

            .cylinder-image {
                width: 180px;
                height: 320px;
            }

            .hero-text {
                left: 3%;
                bottom: 12%;
                max-width: 90%;
            }

            .contact-mobile-section {
                display: block !important;
            }

            /* Mobile Catalogue View for Projects */
            .projects-grid {
                grid-template-columns: repeat(2, 1fr) !important;
                gap: 1rem !important;
            }

            .project-card {
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05) !important;
            }

            .project-image {
                height: 140px !important;
            }

            .project-content {
                padding: 0.8rem !important;
            }

            .project-title {
                font-size: 0.9rem !important;
                margin-bottom: 0 !important;
                text-align: center;
            }

            .project-description,
            .project-tags {
                display: none !important;
            }

            /* Mobile Experience Section Refinement */
            .experience-content-wrapper {
                padding: 1.5rem !important;
                width: 92% !important;
                margin: 0 auto !important;
                backdrop-filter: blur(15px) !important;
                background: rgba(255, 255, 255, 0.1) !important;
                border: 1px solid rgba(255, 255, 255, 0.2) !important;
            }

            .experience-header-badge {
                padding: 0.5rem 1rem !important;
                margin-bottom: 1.5rem !important;
                width: 100% !important;
                justify-content: center !important;
            }

            .experience-title-large {
                font-size: 1.8rem !important;
                text-align: center !important;
            }

            .experience-role-large {
                font-size: 1.1rem !important;
                text-align: center !important;
                margin-bottom: 1.5rem !important;
            }

            .experience-section {
                min-height: auto !important;
                height: auto !important;
                padding-bottom: 2rem !important;
            }

            .experience-description {
                font-size: 0.95rem !important;
                text-align: center !important;
                line-height: 1.6 !important;
            }

            /* NEW: Mobile Experience Carousel Redesign */
            .experience-carousel-container,
            .experience-timeline,
            .experience-see-more-mobile,
            .experience-header-desktop {
                display: none !important;
            }

            .experience-dark-content {
                min-height: auto !important;
                padding-bottom: 0 !important;
                height: auto !important;
            }

            .experience-section {
                min-height: auto !important;
                padding-bottom: 1rem !important;
            }

            .experience-mobile-carousel {
                display: block !important;
                width: 100% !important;
                position: relative !important;
                overflow: hidden !important;
                padding-bottom: 0 !important;
                /* Removed unnecessary padding */
            }

            .mobile-carousel-track {
                display: flex !important;
                transition: transform 0.5s ease-in-out !important;
                width: 100% !important;
            }

            .mobile-experience-card {
                min-width: 100% !important;
                position: relative !important;
                border-radius: 20px !important;
                overflow: hidden !important;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2) !important;
                aspect-ratio: 16/9 !important;
                margin-bottom: 0 !important;
                /* Removed margin */
            }

            .mobile-exp-img {
                width: 100% !important;
                height: 100% !important;
                object-fit: cover !important;
            }

            .mobile-exp-overlay {
                position: absolute !important;
                top: 0 !important;
                left: 0 !important;
                width: 100% !important;
                background: linear-gradient(to bottom, rgba(0, 0, 0, 0.7), transparent) !important;
                padding: 1rem !important;
                text-align: center !important;
            }

            .mobile-exp-title {
                color: white !important;
                font-size: 1.4rem !important;
                font-weight: 800 !important;
                margin: 0 !important;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.6) !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
            }

            .mobile-exp-company {
                color: rgba(255, 255, 255, 0.95) !important;
                font-size: 0.95rem !important;
                font-weight: 500 !important;
                margin-top: 0.3rem !important;
                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6) !important;
            }

            .mobile-exp-link {
                position: absolute !important;
                bottom: 20px !important;
                left: 50% !important;
                transform: translateX(-50%) !important;
                color: white !important;
                text-decoration: none !important;
                font-weight: 500 !important;
                font-size: 0.9rem !important;
                background: rgba(255, 255, 255, 0.15) !important;
                backdrop-filter: blur(4px) !important;
                padding: 0.4rem 1.2rem !important;
                border-radius: 50px !important;
                border: 1px solid rgba(255, 255, 255, 0.4) !important;
                display: flex !important;
                align-items: center !important;
                gap: 0.5rem !important;
                z-index: 10 !important;
                transition: background 0.3s ease !important;
                white-space: nowrap !important;
            }

            .experience-description {
                font-size: 0.95rem !important;
                text-align: center !important;
                line-height: 1.6 !important;
            }

        }

        /* Conflicting inline styles removed to allow external CSS to control Mobile Navbar */

        @media screen and (max-width: 480px) {
            .section-title {
                font-size: 1.75rem !important;
            }

            .carousel-title {
                font-size: 1.5rem !important;
            }

            .experience-title-large {
                font-size: 2rem !important;
            }
        }

        /* =========================================
           NEW: Drag Slider Styles (Desktop)
           ========================================= */
        .drag-slider-wrapper {
            position: relative;
            width: 100%;
            overflow: hidden;
            padding: 2rem 0 4rem;
        }

        .drag-slider-container {
            overflow-x: auto;
            overflow-y: hidden;
            cursor: grab;
            padding: 2rem 5%;
            /* Side padding for peeking */
            scrollbar-width: none;
            -ms-overflow-style: none;
            user-select: none;
            /* Prevent text selection while dragging */
        }

        .drag-slider-container::-webkit-scrollbar {
            display: none;
        }

        .drag-slider-container.active {
            cursor: grabbing;
        }

        .drag-slider-track {
            display: flex;
            gap: 2.5rem;
            width: max-content;
        }

        .drag-card {
            width: 700px;
            /* Wide card */
            height: 380px;
            background: white;
            border-radius: 24px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            display: flex;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            flex-shrink: 0;
            border: 1px solid rgba(0, 0, 0, 0.03);
        }

        .drag-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(90, 143, 189, 0.15);
        }

        .drag-card-image {
            flex: 0 0 40%;
            position: relative;
            overflow: hidden;
        }

        .drag-card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
            pointer-events: none;
            /* Crucial for drag */
        }

        .drag-card:hover .drag-card-image img {
            transform: scale(1.05);
        }

        .drag-card-content {
            flex: 1;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .drag-card-title {
            font-size: 1.8rem;
            font-weight: 800;
            color: #2C3E50;
            margin-bottom: 1rem;
            position: relative;
        }

        .drag-card-title::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: #5A8FBD;
            margin-top: 1rem;
            border-radius: 2px;
        }

        .drag-card-desc {
            font-size: 1.05rem;
            line-height: 1.8;
            color: #6B7280;
        }

        /* Progress Bar */
        .drag-progress-container {
            width: 200px;
            height: 4px;
            background: #E5E7EB;
            border-radius: 4px;
            margin: 2rem auto 0;
            overflow: hidden;
        }

        .drag-progress-bar {
            height: 100%;
            background: #5A8FBD;
            width: 0%;
            transition: width 0.1s linear;
        }

        /* Drag Hint */
        .drag-hint {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1rem;
            color: #9CA3AF;
            font-size: 0.9rem;
            font-weight: 500;
            opacity: 0.8;
            animation: pulseHint 2s infinite;
        }

        .drag-hint svg {
            width: 16px;
            height: 16px;
        }

        @keyframes pulseHint {

            0%,
            100% {
                opacity: 0.6;
            }

            50% {
                opacity: 1;
            }
        }

        /* Mobile Adapt for Drag Slider */
        @media (max-width: 768px) {
            .drag-slider-container {
                overflow-x: auto;
                /* Enable native scroll */
                scroll-snap-type: x mandatory;
                /* Snap effect */
                -webkit-overflow-scrolling: touch;
                /* Momentum scroll */
                padding: 1rem 5%;
            }

            .drag-slider-track {
                gap: 1.5rem;
                /* Reduce gap */
            }

            }

        @media (max-width: 768px) {
            .drag-card {
                width: 260px !important;
                /* Wider for better reading */
                min-width: 260px !important;
                height: 380px !important;
                /* Taller for content */
                flex-direction: column;
                justify-content: flex-start !important;
                /* Align top */
                scroll-snap-align: center;
                margin-right: 1.5rem;
                padding: 0 !important;
                /* Remove padding to let image fill top */
                border-radius: 16px;
                overflow: hidden;
            }

        .drag-card-image {
            width: 100%;
            height: 180px;
            /* Fixed height for image */
            overflow: hidden;
        }

        .drag-card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .drag-card-content {
            padding: 1.2rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            height: calc(100% - 180px);
        }

        .drag-card-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 0.2rem;
            color: #2C3E50;
        }

        .drag-card-desc {
            font-size: 0.9rem;
            line-height: 1.5;
            color: #000000 !important;
            overflow-y: auto;
            /* Allow scroll inside text if needed */
        }

        .drag-card-title {
            font-size: 1.2rem;
            /* Smaller title */
            margin-bottom: 0.5rem;
        }

        .drag-card-text {
            font-size: 0.9rem;
            /* Smaller text */
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            /* Limit text lines if needed */
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .drag-slider-container {
            padding: 2rem 1.5rem;
            /* Adjust container padding */
        }
        }

        /* =========================================
           Engagements & Charts Refinements
           ========================================= */
        /* Accordion Mobile for Engagements */
        .engagement-expand-btn {
            display: none;
        }

        @media (max-width: 968px) {

            .engagement-desc-modern,
            .engagement-period-badge {
                display: none;
                /* Hidden by default on mobile */
            }

            .engagement-content.expanded .engagement-desc-modern,
            .engagement-content.expanded .engagement-period-badge {
                display: block;
                animation: fadeIn 0.3s ease;
            }

            .engagement-expand-btn {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                color: #5A8FBD;
                font-size: 0.9rem;
                font-weight: 600;
                margin-top: 0.5rem;
                cursor: pointer;
                background: none;
                border: none;
                padding: 0;
            }

            .engagement-expand-btn svg {
                transition: transform 0.3s ease;
            }

            .engagement-content.expanded .engagement-expand-btn svg {
                transform: rotate(180deg);
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        }

        .chart-description {
            font-size: 0.9rem;
            color: #6B7280;
            margin-bottom: 1.5rem;
            font-style: italic;
            margin-top: -1.5rem;
            /* Pull up closer to subtitle */
        }

        /* ----- OVERRIDE NAVBAR FOR LIQUID GLASS ----- */
        .navbar {
            background: rgba(255, 255, 255, 0.05) !important;
            backdrop-filter: blur(10px) !important;
            -webkit-backdrop-filter: blur(10px) !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2) !important;
            /* give slightly more presence at bottom */
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1) !important;
            top: 20px !important;
            padding: 10px 30px !important;
            height: auto !important;
        }

        .navbar.scrolled {
            background: rgba(0, 0, 0, 0.6) !important;
            backdrop-filter: blur(15px) !important;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3) !important;
        }

        .nav-link {
            color: #ffffff !important;
            font-weight: 500 !important;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.85rem !important;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .nav-link:hover {
            color: rgba(255, 255, 255, 0.7) !important;
            transform: translateY(-2px);
        }

        /* Custom text logo */
        .logo {
            width: auto !important;
            height: auto !important;
            display: flex !important;
            flex-direction: column !important;
            align-items: flex-start !important;
            justify-content: center !important;
            text-decoration: none;
            margin-right: 2rem !important;
            background: none !important;
            border-radius: 0 !important;
        }

        .logo-main {
            font-family: inherit;
            font-weight: 900;
            font-size: 1.6rem;
            line-height: 1;
            letter-spacing: 2px;
            color: white;
            text-transform: uppercase;
        }

        .logo-sub {
            font-family: inherit;
            font-size: 0.6rem;
            letter-spacing: 5px;
            opacity: 0.7;
            text-transform: uppercase;
            color: white;
            margin-top: 4px;
            font-weight: 600;
        }

        .search-icon {
            stroke: #ffffff !important;
        }

        .hamburger span {
            background: #ffffff !important;
        }

        /* Ajustement drop down */
        .dropdown-content {
            background: rgba(0, 0, 0, 0.8) !important;
            backdrop-filter: blur(15px) !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            color: white !important;
        }

        .dropdown-title {
            color: white !important;
        }

        .dropdown-link {
            color: white !important;
        }

        .dropdown-link:hover {
            background: rgba(255, 255, 255, 0.1) !important;
            color: white !important;
        }
    </style>

</head>

<body>
    <!-- Navbar style Nike (Imported from exp.html structure) -->
    <nav class="navbar" id="navbar">
        <!-- Bouton Hamburger (mobile) -->
        <button class="hamburger" id="hamburgerBtn" onclick="toggleMobileMenu()">
            <span></span>
            <span></span>
            <span></span>
        </button>

        <!-- Logo -->
        <div class="logo" onclick="window.scrollTo({top: 0, behavior: 'smooth'});" style="cursor: pointer;">
            <span class="logo-main">THÉO</span>
            <span class="logo-sub">PORTFOLIO</span>
        </div>

        <!-- Navigation centrale -->
        <div class="nav-center" id="navCenter">
            <a href="#apropos" class="nav-link">À propos</a>

            <!-- Dropdown Projets (desktop only) -->
            <div class="nav-dropdown nav-dropdown-desktop">
                <a href="#projets" class="nav-link">Projets</a>
                <div class="dropdown-content">
                    <div>
                        <h3 class="dropdown-title">Mes Projets</h3>
                        <div class="dropdown-links">
                            <a href="#projets" class="dropdown-link" onclick="showProjects('1ere');">1ère année</a>
                            <a href="#projets" class="dropdown-link" onclick="showProjects('2eme');">2ème année</a>
                            <a href="#projets" class="dropdown-link" onclick="showProjects('recap');">Récapitulatif</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Lien Projets simple (mobile only) -->
            <a href="#projets" class="nav-link nav-link-mobile-only">Projets</a>

            <a href="#experience" class="nav-link">Expérience</a>
            <a href="#engagements" class="nav-link">Engagements</a>
            <a href="#statistiques" class="nav-link">Statistiques</a>

            <!-- Dropdown Contact (desktop only) -->
            <div class="nav-dropdown nav-dropdown-desktop">
                <span class="nav-link">Contact</span>
                <div class="dropdown-content">
                    <div>
                        <h3 class="dropdown-title">Me contacter</h3>
                        <div class="contact-info">
                            <a href="mailto:theo.petit@etu.univ-poitiers.fr" class="contact-link">
                                <div class="contact-item">
                                    <svg class="contact-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <path
                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                        </path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    <span class="contact-text">theo.petit@etu.univ-poitiers.fr</span>
                                </div>
                            </a>
                            <a href="https://www.linkedin.com/in/théo-petit1" target="_blank" class="contact-link">
                                <div class="contact-item">
                                    <svg class="contact-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <path
                                            d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z">
                                        </path>
                                        <rect x="2" y="9" width="4" height="12"></rect>
                                        <circle cx="4" cy="4" r="2"></circle>
                                    </svg>
                                    <span class="contact-text">LinkedIn</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Lien Contact simple (mobile only) -->
            <a href="#contact-mobile" class="nav-link nav-link-mobile-only">Contact</a>

            <!-- Indicateur actif glissant -->
            <div class="active-indicator" id="activeIndicator"></div>
        </div>

        <!-- Barre de recherche -->
        <div class="search-container">
            <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="11" cy="11" r="8"></circle>
                <path d="m21 21-4.35-4.35"></path>
            </svg>
            <input type="text" class="search-box" placeholder="Rechercher" id="searchInput">
            <div class="search-suggestions" id="searchSuggestions"></div>
        </div>
    </nav>

    <!-- Hero style Premium -->
    <section class="hero-premium" id="top">
        <style>
            .hero-premium {
                position: relative;
                height: 100vh;
                width: 100vw;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                color: white;
            }

            .hero-premium-bg {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                z-index: -2;
                filter: brightness(0.65);
            }

            .hero-premium-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: linear-gradient(180deg, rgba(0, 0, 0, 0.3) 0%, transparent 50%, rgba(0, 0, 0, 0.7) 100%);
                z-index: -1;
            }

            .hero-premium-content {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
                padding: 140px 50px 50px 50px;
                /* Leave room for nav */
                z-index: 1;
            }

            .hero-top-left {
                max-width: 400px;
                animation: fadeInLeft 1s ease-out;
            }

            .hero-top-left h2 {
                font-size: 1rem;
                letter-spacing: 2px;
                text-transform: uppercase;
                margin-bottom: 0.5rem;
                font-weight: 600;
            }

            .hero-top-left p {
                font-size: 0.9rem;
                opacity: 0.8;
                line-height: 1.5;
            }

            .hero-bottom {
                display: flex;
                justify-content: space-between;
                align-items: flex-end;
                animation: fadeInUp 1s ease-out 0.3s forwards;
                opacity: 0;
            }

            .hero-bottom-left {
                display: flex;
                flex-direction: column;
            }

            .hero-main-title {
                font-size: clamp(4rem, 14vw, 12rem);
                font-weight: 900;
                line-height: 0.85;
                letter-spacing: -3px;
                margin-bottom: 1rem;
                text-transform: uppercase;
                display: block;
            }

            .hero-bottom-left p {
                font-size: 0.85rem;
                letter-spacing: 4px;
                text-transform: uppercase;
                opacity: 0.8;
            }

            /* Floating Widget */
            .hero-widget {
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 16px;
                padding: 1.5rem;
                width: 320px;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
                transform: translateY(20px);
                transition: transform 0.4s ease, box-shadow 0.4s ease;
            }

            .hero-widget:hover {
                transform: translateY(10px);
                box-shadow: 0 30px 50px rgba(0, 0, 0, 0.4);
            }

            .hero-widget-stats {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
            }

            .hero-widget-avatars {
                display: flex;
            }

            .hero-widget-avatars img {
                width: 44px;
                height: 44px;
                border-radius: 50%;
                border: 2px solid rgba(255, 255, 255, 0.4);
                margin-left: -15px;
                object-fit: cover;
                background: #111;
            }

            .hero-widget-avatars img:first-child {
                margin-left: 0;
            }

            .hero-widget-info h4 {
                font-size: 1rem;
                margin-bottom: 4px;
                font-weight: 600;
            }

            .hero-widget-info p {
                font-size: 0.8rem;
                opacity: 0.7;
            }

            .hero-widget-btn {
                width: 100%;
                padding: 14px;
                background: white;
                color: black;
                border: none;
                border-radius: 8px;
                font-weight: 700;
                font-size: 0.85rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .hero-widget-btn:hover {
                background: #f0f0f0;
                transform: scale(1.02);
            }

            @keyframes fadeInLeft {
                from {
                    opacity: 0;
                    transform: translateX(-30px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (max-width: 768px) {
                .hero-premium-content {
                    padding: 100px 20px 30px 20px;
                }

                .hero-bottom {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 40px;
                }

                .hero-widget {
                    width: 100%;
                }

                .hero-main-title {
                    font-size: 5rem;
                    letter-spacing: -1px;
                }
            }
        </style>

        <img src="slide_acceuil/slide_2.png" alt="Background" class="hero-premium-bg"
            onerror="this.src='https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2070'">
        <div class="hero-premium-overlay"></div>

        <div class="hero-premium-content">
            <div class="hero-top-left">
                <h2>ÉTUDIANT - ALTERNANT</h2>
                <p>Mi-temps entre école et entreprise, la répartition idéale pour allier connaissances théoriques et
                    application concrète.</p>
            </div>

            <div class="hero-bottom">
                <div class="hero-bottom-left">
                    <span class="hero-main-title">THÉO</span>
                    <p>SUR-MESURE / INTEMPOREL</p>
                </div>

                <div class="hero-widget">
                    <div class="hero-widget-stats">
                        <div class="hero-widget-avatars">
                            <img src="propos/moi.jpg" alt="Théo">
                            <img src="logo2.png" alt="Logo">
                        </div>
                        <div class="hero-widget-info">
                            <h4>Mes Projets</h4>
                            <p>Découvrez mes réalisations</p>
                        </div>
                    </div>
                    <button class="hero-widget-btn"
                        onclick="document.getElementById('projets').scrollIntoView({behavior: 'smooth'})">
                        EXPLORER UN PROJET <span style="font-size: 1.2rem;">→</span>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- Section À propos -->
    <section id="apropos" class="section">
        <h2 class="section-title">À propos</h2>
        <p class="section-subtitle">Slidez pour voir !</p>

        <div class="drag-slider-wrapper">
            <div class="drag-slider-container" id="dragSliderContainer">
                <div class="drag-slider-track" id="dragSliderTrack">
                    <!-- Cards will be injected by JS -->
                </div>
            </div>
            <!-- Progress Bar -->
            <div class="drag-progress-container">
                <div class="drag-progress-bar" id="dragProgressBar"></div>
            </div>
            <!-- Hint -->
            <div class="drag-hint">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M17 10l4 4-4 4"></path>
                    <path d="M7 14l-4-4 4-4"></path>
                </svg>
                <span>Glissez pour découvrir</span>
            </div>
        </div>
    </section>

    <!-- Section Projets -->
    <section id="projets" class="projects-section">
        <div class="projects-header">
            <h2 class="section-title">Mes Projets</h2>
            <p class="section-subtitle">Découvrez mes réalisations par année universitaire</p>
        </div>

        <!-- Tabs pour changer d'année -->
        <!-- Contrôles : Filtres et Vue -->
        <div class="projects-controls">
            <!-- Filtres (Gauche) -->
            <div class="filters-group">
                <button class="project-tab active" onclick="showProjects('1ere')">1ère année</button>
                <button class="project-tab" onclick="showProjects('2eme')">2ème année</button>
                <button class="project-tab" onclick="showProjects('recap')">Récapitulatif</button>
            </div>

            <!-- Toggle Vue (Droite) -->
            <div class="view-controls">
                <!-- Bouton Vue Large (Split / 2 cols desktop / 1 col mobile) -->
                <button class="view-btn" id="viewLargeBtn" onclick="setProjectView('large')" title="Vue détaillée">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="3" width="18" height="18" rx="2"></rect>
                        <path d="M12 3v18"></path>
                    </svg>
                </button>
                <!-- Bouton Vue Grille (Grid / 4 cols desktop / 2 cols mobile) -->
                <button class="view-btn active" id="viewGridBtn" onclick="setProjectView('grid')" title="Vue grille">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="3" width="7" height="7"></rect>
                        <rect x="14" y="3" width="7" height="7"></rect>
                        <rect x="14" y="14" width="7" height="7"></rect>
                        <rect x="3" y="14" width="7" height="7"></rect>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Projets 1ère année -->
        <div id="projets-1ere" class="projects-content active">
            <div class="projects-grid">
                <a href="projets/ADRD.html" class="project-card" data-project-name="ADRD" data-year="1">
                    <img src="projets/ADRD/1page.png" alt="Projet 1" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+1'">
                    <div class="project-content">
                        <h3 class="project-title">Analyse de Données, Reporting et Datavisualisation (ADRD)</h3>
                        <p class="project-description">
                            Dans le cadre d’un projet réalisé en collaboration avec le laboratoire MAVIE, nous avons
                            répondu à une demande de l’entreprise Calixys visant à développer un livrable complet.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">PowerBI</span>
                            <span class="project-tag">Python</span>
                        </div>
                    </div>
                </a>

                <a href="projets/indicateurs.html" class="project-card" data-project-name="Indicateurs" data-year="1">
                    <img src="projets/Indicateurs/indicateurs.png" alt="Projet 2" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+2'">
                    <div class="project-content">
                        <h3 class="project-title">Indicateurs de performances</h3>
                        <p class="project-description">
                            Nous avons réalisé une analyse complète des indicateurs économiques du groupe Fleury-Michon,
                            à partir de données réelles sur plusieurs années.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Excel</span>
                            <span class="project-tag">Word</span>
                        </div>
                    </div>
                </a>

                <a href="projets/dataviz.html" class="project-card" data-project-name="DataViz" data-year="1">
                    <img src="projets/dataviz/dataviz.png" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Concours DataViz</h3>
                        <p class="project-description">
                            Nous avons réalisé une datavisualisation sur la jeunesse en région PACA, en croisant des
                            données sur la scolarité, l’emploi et la mobilité.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Excel</span>
                            <span class="project-tag">Canva</span>
                        </div>
                    </div>
                </a>
                <a href="projets/estimation.html" class="project-card" data-project-name="Estimation" data-year="1">
                    <img src="projets/estimation/estimation.png" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Estimation par échantillonage</h3>
                        <p class="project-description">
                            Nous avons mené une double analyse statistique portant sur l’estimation de la population de
                            l’Île-de-France via échantillonnage, et sur l’étude des liens entre habitudes de vie et
                            pratique sportive chez les étudiants.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Excel</span>
                            <span class="project-tag">R studio</span>
                            <span class="project-tag">Word</span>
                        </div>
                    </div>
                </a>
                <a href="projets/regression.html" class="project-card" data-project-name="Régression" data-year="1">
                    <img src="projets/regression/regression.png" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Régréssion Linéaire sur des données réelles</h3>
                        <p class="project-description">
                            Nous avons analysé les ventes immobilières dans le département des Deux-Sèvres sur l’année
                            2023. À partir de ces données — incluant notamment la superficie, le nombre de pièces, etc.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">R</span>
                            <span class="project-tag">Statistiques</span>
                            <span class="project-tag">Ggplot2</span>
                        </div>
                    </div>
                </a>
                <a href="projets/bdr.html" class="project-card" data-project-name="BDR" data-year="1">
                    <img src="projets/bdr/bdr2.png" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Conception et implémentation d'une BDR</h3>
                        <p class="project-description">
                            Nous avons dû créer et implémenter une Base de Données (SQL) via PHP. Nous devions y insérer
                            des données à l'aide d'un programme Python.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">SQL</span>
                            <span class="project-tag">PHP</span>
                            <span class="project-tag">Python</span>
                        </div>
                    </div>
                </a>
                <a href="projets/enquete.html" class="project-card" data-project-name="Enquête" data-year="1">
                    <img src="projets/enquete/enquete.jpeg" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Enquête sur les étudiants et leur réussite scolaire</h3>
                        <p class="project-description">
                            En début d’année, un sondage a été réalisé afin d’évaluer le ressenti des étudiants à l’IUT.
                            Les données recueillies ont été analysées et exploitées pour en dégager des conclusions
                            pertinentes.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Sphynx</span>
                            <span class="project-tag">Statistiques</span>
                        </div>
                    </div>
                </a>
                <a href="projets/vba.html" class="project-card" data-project-name="VBA" data-year="1">
                    <img src="projets/vba/vba2.jpeg" alt="Projet 3" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Projet+3'">
                    <div class="project-content">
                        <h3 class="project-title">Application Excel/VBA</h3>
                        <p class="project-description">
                            Étude statistique complète d'un jeu de données réel avec calculs de moyennes, médianes et
                            représentations graphiques.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Excel</span>
                            <span class="project-tag">VBA</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- Projets 2ème année -->
        <div id="projets-2eme" class="projects-content">
            <div class="projects-grid">
                <a href="projets/php.html" class="project-card" data-project-name="Site PHP" data-year="2">
                    <img src="projets/PHP/php.png" alt="Projet Dashboard" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Dashboard+Power+BI'">
                    <div class="project-content">
                        <h3 class="project-title">Site web dynamique en PHP – MySQL - Javascript</h3>
                        <p class="project-description">
                            Conception d’une application web dynamique reposant sur des données OpenData. Le projet
                            inclut une gestion complète des données, des calculs bivariés et statistiques, une carte
                            intéractive et un dashboard présentant plusieurs indicateurs clés sous forme de graphiques
                            dynamiques.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Power BI</span>
                            <span class="project-tag">DAX</span>
                            <span class="project-tag">Data Viz</span>
                        </div>
                    </div>
                </a>
                <a href="projets/collecte.html" class="project-card" data-project-name="Web Scraping/API" data-year="2">
                    <img src="projets/collecte/SAE/menu.png" alt="Projet Dashboard" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Dashboard+Power+BI'">
                    <div class="project-content">
                        <h3 class="project-title">Collecte de données web</h3>
                        <p class="project-description">
                            Collecte de données web via le web scraping et l'exploitation d'une API pour produire des
                            indicateurs visuels impactants.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Web Scraping</span>
                            <span class="project-tag">API</span>
                            <span class="project-tag">Data Viz</span>
                        </div>
                    </div>
                </a>
                <a href="projets/dentissimo.html" class="project-card" data-project-name="Dentissimo" data-year="2">
                    <img src="projets/AMIN/base.jpeg" alt="Projet Dashboard" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Dashboard+Power+BI'">
                    <div class="project-content">
                        <h3 class="project-title">Dentissimo</h3>
                        <p class="project-description">
                            Création d'une base de données pour un cabinet dentaire.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Oracle</span>
                            <span class="project-tag">Docker</span>
                        </div>
                    </div>
                </a>

                <a href="projets/vba(avance).html" class="project-card"
                    data-project-name="VBA Excel & Google App Script" data-year="2">
                    <img src="projets/vba(avance)/PROJET/tb.png" alt="Projet Dashboard" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Dashboard+Power+BI'">
                    <div class="project-content">
                        <h3 class="project-title">VBA Excel & Google App Script</h3>
                        <p class="project-description">
                            Application de gestion des retours étudiants (JPO, Salons). Comparaison de deux approches :
                            Excel VBA (Local) vs Google App Script (Cloud).
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">VBA</span>
                            <span class="project-tag">Excel</span>
                            <span class="project-tag">App Script</span>
                            <span class="project-tag">Sheets</span>
                        </div>
                    </div>
                </a>
                <!---
                <a href="projet-details-2-2.html" class="project-card" data-project-name="ML" data-year="2">
                    <img src="projets/2eme/projet2.jpg" alt="Machine Learning" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Machine+Learning'">
                    <div class="project-content">
                        <h3 class="project-title">Prédiction avec ML</h3>
                        <p class="project-description">
                            Modèle de machine learning pour prédire les prix immobiliers avec scikit-learn et optimisation des hyperparamètres.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Python</span>
                            <span class="project-tag">Scikit-learn</span>
                            <span class="project-tag">ML</span>
                        </div>
                    </div>
                </a>

                <a href="projet-details-2-3.html" class="project-card" data-project-name="API REST" data-year="2">
                    <img src="projets/2eme/projet3.jpg" alt="API REST" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=API+REST'">
                    <div class="project-content">
                        <h3 class="project-title">API REST Data</h3>
                        <p class="project-description">
                            Développement d'une API REST pour exposer des données analytiques avec documentation Swagger complète.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Python</span>
                            <span class="project-tag">Flask</span>
                            <span class="project-tag">API</span>
                        </div>
                    </div>
                </a>
            -->
                <a href="projets/or.html" class="project-card" data-project-name="Prédiction Cours Or" data-year="2">
                    <img src="projets/ali/or.png" alt="Prédiction Or" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/D4AF37/FFFFFF?text=Prédiction+Or'">
                    <div class="project-content">
                        <h3 class="project-title">Prédiction du Cours de l'Or</h3>
                        <p class="project-description">
                            Analyse de séries temporelles et modélisation prédictive.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Python</span>
                            <span class="project-tag">Séries Temporelles</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- Projets 3ème année
        <div id="projets-3eme" class="projects-content">
            <div class="projects-grid">
                <a href="projet-details-3-1.html" class="project-card" data-project-name="NoteIt" data-year="3">
                    <img src="projets/3eme/projet1.jpg" alt="NoteIt" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=NoteIt.fr'">
                    <div class="project-content">
                        <h3 class="project-title">NoteIt.fr - Startup</h3>
                        <p class="project-description">
                            Solution innovante de collecte d'avis client via NFC avec dashboard d'analyse en temps réel pour les entreprises.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">React</span>
                            <span class="project-tag">Node.js</span>
                            <span class="project-tag">NFC</span>
                        </div>
                    </div>
                </a>

                <a href="projet-details-3-2.html" class="project-card" data-project-name="Deep Learning" data-year="3">
                    <img src="projets/3eme/projet2.jpg" alt="Deep Learning" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Deep+Learning'">
                    <div class="project-content">
                        <h3 class="project-title">Classification d'images</h3>
                        <p class="project-description">
                            Réseau de neurones convolutif pour la classification d'images médicales avec TensorFlow et transfer learning.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">TensorFlow</span>
                            <span class="project-tag">Deep Learning</span>
                            <span class="project-tag">CNN</span>
                        </div>
                    </div>
                </a>

                <a href="projet-details-3-3.html" class="project-card" data-project-name="Big Data" data-year="3">
                    <img src="projets/3eme/projet3.jpg" alt="Big Data" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Big+Data'">
                    <div class="project-content">
                        <h3 class="project-title">Pipeline Big Data</h3>
                        <p class="project-description">
                            Architecture de traitement de données massives avec Apache Spark et stockage distribué sur cluster Hadoop.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Spark</span>
                            <span class="project-tag">Hadoop</span>
                            <span class="project-tag">Big Data</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>  -->

        <!-- Récapitulatif -->
        <div id="projets-recap" class="projects-content">
            <div class="projects-grid">
                <a href="./projets/recap/Bilan_1ere_annee.pdf" class="project-card">
                    <img src="./projets/recap/recap_1.png" alt="Best of 1" class="project-image"
                        onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Meilleur+1'">
                    <div class="project-content">
                        <h3 class="project-title">1ère année</h3>
                        <p class="project-description">
                            Bilan personnel de ma première année en BUT Science des Données.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Word</span>
                            <span class="project-tag">1ère année</span>
                        </div>
                    </div>
                </a>

                <!-- Récapitulatif 
                <a href="projet-details-2-1.html" class="project-card">
                    <img src="./projets/recap/recap_2.png" alt="Best of 2" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Meilleur+2'">
                    <div class="project-content">
                        <h3 class="project-title">Dashboard Power BI - 2ème année</h3>
                        <p class="project-description">
                            Projet qui m'a permis de découvrir la puissance de la visualisation interactive de données.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Power BI</span>
                            <span class="project-tag">2ème année</span>
                        </div>
                    </div>
                </a>

                <a href="projet-details-3-1.html" class="project-card">
                    <img src="./projets/recap/recap_3.png" alt="Best of 3" class="project-image" onerror="this.src='https://via.placeholder.com/400x280/8A8A8A/FFFFFF?text=Meilleur+3'">
                    <div class="project-content">
                        <h3 class="project-title">NoteIt.fr - 3ème année</h3>
                        <p class="project-description">
                            Mon projet entrepreneurial qui combine toutes mes compétences en data et développement web.
                        </p>
                        <div class="project-tags">
                            <span class="project-tag">Startup</span>
                            <span class="project-tag">3ème année</span>
                        </div>
                    </div>
                </a> -->
            </div>
        </div>

        <!-- Section Applications (Cloud Style - Desktop Only) -->
        <style>
            @media (max-width: 768px) {
                .desktop-applications-section {
                    display: none !important;
                }
            }
        </style>
        <div class="desktop-applications-section" style="background-color: #ffffff; width: 100%;">
            <h3 class="section-title"
                style="font-size: 1.8rem; margin: 4rem 0 3rem; color: #1e293b; text-align: center; padding-top: 2rem; border-top: 1px solid #e2e8f0;">
                MES APPLICATIONS</h3>

            <div class="applications-cloud"
                style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; gap: 3rem; padding: 0 1cm; width: 100%; box-sizing: border-box; margin-bottom: 4rem;">



                <!-- Word -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/WORD_LOGO.png" alt="Word"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Excel -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Microsoft_Excel_2013-2019_logo.svg.png" alt="Excel"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Access -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Microsoft_Office_Access_(2019-2025).svg.png" alt="Access"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Power BI -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/New_Power_BI_Logo.svg.png" alt="Power BI"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- SAS -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/SAS_logo_horiz.svg" alt="SAS"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- R Studio -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/RStudio_logo_flat.svg.png" alt="R Studio"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Python -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Python-logo-notext.svg.png" alt="Python"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- SQL -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Sql_data_base_with_logo.png" alt="SQL"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Tableau -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Tableau-Symbol.png" alt="Tableau"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Canva -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-5.png" alt="Canva"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Dev Web -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-3.jpeg" alt="Web Dev"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Trello -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Logo_Trello.svg.png" alt="Trello"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Sphinx -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/Logo-Sphinx-site-Web.png" alt="Sphynx"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- SAP (New) -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/sap_logo_rgb_onwhite_0300_0300.png" alt="SAP"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>



                <!-- QGIS -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-3.png" alt="QGIS"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Docker -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-4.jpeg" alt="Docker"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Excalidraw -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-4.png" alt="Excalidraw"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- CapCut -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/1664284836cap-cut-logo-png.png.webp" alt="CapCut"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- DaVinci Resolve -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/DaVinci_Resolve_Studio.png" alt="DaVinci Resolve"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Misc (images-2) -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-2.png" alt="App"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

                <!-- Misc (images-6 - New) -->
                <div class="app-item" style="transition: transform 0.3s ease;">
                    <img src="applications/images-6.png" alt="App"
                        style="width: 80px; height: 80px; object-fit: contain; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">
                </div>

            </div>
        </div>
        </div>

    </section>

    <!-- Section Expérience -->
    <!-- Section Expérience -->
    <section id="experience" class="experience-section">
        <!-- Full Screen Background Carousel -->
        <div class="experience-carousel-container">
            <div class="experience-slides">


                <!-- Slide 1 - POISSON -->
                <div class="experience-slide active">
                    <img src="experience/bg-poisson.png" alt="Lerclerc" class="experience-background"
                        onerror="this.src='https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=1920'">
                    <div class="experience-overlay"></div>

                    <a href="exp.html" class="experience-view-all-btn">Voir toutes les expériences</a>

                    <div class="experience-content-wrapper" style="position: relative;">
                        <!-- Local Timeline Dot - Slide 1 (Moved to Wrapper) -->
                        <div class="experience-floating-date"
                            style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); display: flex; flex-direction: column; align-items: center; z-index: 10;">
                            <div
                                style="width: 20px; height: 20px; background: #5A8FBD; border: 4px solid rgba(255, 255, 255, 0.9); border-radius: 50%; margin-top: -10px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                            </div>
                            <div
                                style="font-size: 0.9rem; font-weight: 700; color: rgba(255, 255, 255, 0.9); margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">
                                Mars 2023</div>
                        </div>

                        <div class="experience-main-content">
                            <div class="experience-left-section">
                                <div class="experience-header-section">
                                    <img src="experience/logo-poisson.jpeg" alt="Poisson logo"
                                        class="experience-company-logo"
                                        onerror="this.src='https://via.placeholder.com/80x80/FFFFFF/5A8FBD?text=IUT'">
                                    <div class="experience-header-text">
                                        <h2 class="experience-title-large">Vendeur Polyvalent</h2>
                                        <h3 class="experience-company-large">Les P'tites Pêcheries Trembladaises
                                        </h3>
                                        <p class="experience-period">Mars 2023 - Juin 2025</p>
                                    </div>
                                </div>

                                <p class="experience-description-large">
                                    Vente et conseil auprès des clients en poissonnerie. Préparation, mise en valeur
                                    et
                                    réassort des produits frais. Respect strict des normes d’hygiène et de
                                    traçabilité.
                                    Polyvalence sur la mise en place, le nettoyage du poste et la gestion du service
                                    client.
                                </p>

                                <div class="experience-skills-large">
                                    <span class="experience-skill-large">Vente</span>
                                    <span class="experience-skill-large">Hygiène & traçabilité</span>
                                    <span class="experience-skill-large">Relation client</span>
                                    <span class="experience-skill-large">Polyvalence</span>
                                    <span class="experience-skill-large">Organisation</span>
                                </div>
                            </div>

                            <div class="experience-right-section" style="position: relative;">
                                <!-- Local Timeline Dot Removed from here -->
                                <div class="experience-recommendation-large">
                                    <p class="recommendation-text-large">
                                        "Durant cette période Theo Petit a participé à l’ensemble des taches de
                                        l’entreprise.
                                        Il a fait preuve de rigueur, de ponctualité et d’une très grande régularité.
                                        En outre son travail comme son attitude positive ont été particulièrement
                                        apprécié par ses
                                        collègues.
                                        Je ne peux que vivement recommander Mr Theo PETIT"
                                    </p>
                                    <p class="recommendation-author-large">Mme. PAILLÉ</p>
                                    <p class="recommendation-role-large">Employeur</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Slide 2 - LECLERC-->
                <div class="experience-slide">
                    <img src="experience/bg-leclerc2.jpeg" alt="Leclerc" class="experience-background"
                        onerror="this.src='https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=1920'">
                    <div class="experience-overlay"></div>
                    <a href="exp.html" class="experience-view-all-btn">Voir toutes les expériences</a>

                    <div class="experience-content-wrapper" style="position: relative;">
                        <!-- Local Timeline Dot -->
                        <div class="experience-floating-date"
                            style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); display: flex; flex-direction: column; align-items: center; z-index: 10;">
                            <div
                                style="width: 20px; height: 20px; background: #5A8FBD; border: 4px solid rgba(255, 255, 255, 0.9); border-radius: 50%; margin-top: -10px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                            </div>
                            <div
                                style="font-size: 0.9rem; font-weight: 700; color: rgba(255, 255, 255, 0.9); margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">
                                Juin 2025</div>
                        </div>

                        <div class="experience-header-section">
                            <img src="experience/logo-leclerc.png" alt="Leclerc logo" class="experience-company-logo"
                                onerror="this.src='https://via.placeholder.com/80x80/FFFFFF/5A8FBD?text=Note'">
                            <div class="experience-header-text">
                                <h2 class="experience-title-large">Employé commercial</h2>
                                <h3 class="experience-company-large">E. Leclerc</h3>
                                <p class="experience-period">Juin 2025 - Août 2025</p>
                            </div>
                        </div>

                        <p class="experience-description-large">
                            Mise en rayon et gestion des produits, maintien de la présentation et de la
                            disponibilité en
                            magasin. Réassort quotidien et contrôle des dates. Accueil et orientation des clients
                            avec
                            une attention particulière portée à la qualité du service. Participation à
                            l’organisation et
                            au maintien de la propreté de l’espace de vente.
                        </p>

                        <div class="experience-skills-large">
                            <span class="experience-skill-large">Mise en rayon</span>
                            <span class="experience-skill-large">Gestion des stocks</span>
                            <span class="experience-skill-large">Relation client</span>
                            <span class="experience-skill-large">Organisation</span>
                        </div>
                    </div>
                </div>

                <!-- Slide 3 - HERROUET -->
                <div class="experience-slide">
                    <img src="experience/bg-herrouet.png" alt="Herrouet" class="experience-background"
                        onerror="this.src='https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=1920'">
                    <div class="experience-overlay"></div>
                    <a href="exp.html" class="experience-view-all-btn">Voir toutes les expériences</a>

                    <div class="experience-content-wrapper" style="position: relative;">
                        <!-- Local Timeline Dot -->
                        <div class="experience-floating-date"
                            style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); display: flex; flex-direction: column; align-items: center; z-index: 10;">
                            <div
                                style="width: 20px; height: 20px; background: #5A8FBD; border: 4px solid rgba(255, 255, 255, 0.9); border-radius: 50%; margin-top: -10px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                            </div>
                            <div
                                style="font-size: 0.9rem; font-weight: 700; color: rgba(255, 255, 255, 0.9); margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">
                                Août 2025</div>
                        </div>

                        <div class="experience-header-section">
                            <img src="experience/logo-herrouet.jpeg" alt="Herrouet logo" class="experience-company-logo"
                                onerror="this.src='https://via.placeholder.com/80x80/FFFFFF/5A8FBD?text=Note'">
                            <div class="experience-header-text">
                                <h2 class="experience-title-large">Serveur en extra</h2>
                                <h3 class="experience-company-large">SARL Charcuterie Traiteur Les Gourmets</h3>
                                <p class="experience-period">Août 2025</p>
                            </div>
                        </div>

                        <p class="experience-description-large">
                            Service en salle lors d’évènements et prestations traiteur. Gestion des tables et
                            maintien
                            d’un service fluide et de qualité. Participation à la mise en place, au service et au
                            rangement, avec une attention constante portée à la satisfaction des clients.
                        </p>

                        <div class="experience-skills-large">
                            <span class="experience-skill-large">Service en salle</span>
                            <span class="experience-skill-large">Organisation</span>
                            <span class="experience-skill-large">Relation client</span>
                            <span class="experience-skill-large">Travail d'équipe</span>
                        </div>
                    </div>
                </div>

                <!-- Slide 4 - IMA -->
                <div class="experience-slide">
                    <img src="experience/bg-ima2.png" alt="IMA Background" class="experience-background"
                        onerror="this.src='https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1920'">
                    <div class="experience-overlay"></div>
                    <a href="exp.html" class="experience-view-all-btn">Voir toutes les expériences</a>

                    <div class="experience-content-wrapper" style="position: relative;">
                        <!-- Local Timeline Dot -->
                        <div class="experience-floating-date"
                            style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); display: flex; flex-direction: column; align-items: center; z-index: 10;">
                            <div
                                style="width: 20px; height: 20px; background: #5A8FBD; border: 4px solid rgba(255, 255, 255, 0.9); border-radius: 50%; margin-top: -10px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                            </div>
                            <div
                                style="font-size: 0.9rem; font-weight: 700; color: rgba(255, 255, 255, 0.9); margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">
                                Sept. 2025</div>
                        </div>
                        <div class="experience-current-badge">
                            En poste actuellement
                        </div>

                        <div class="experience-header-section">
                            <img src="experience/logo-ima.png" alt="IMA Logo" class="experience-company-logo"
                                onerror="this.src='https://via.placeholder.com/80x80/FFFFFF/5A8FBD?text=IMA'">
                            <div class="experience-header-text">
                                <h2 class="experience-title-large">Alternant Data Analyst </h2>
                                <h3 class="experience-company-large">IMA (Inter Mutuelle Assistance)</h3>
                                <p class="experience-period">Septembre 2025 - Aujourd'hui</p>
                            </div>
                        </div>

                        <p class="experience-description-large">
                            Analyse et exploitation de jeux de données, création de visualisations dynamiques et
                            optimisation des reportings. Participation à la migration vers Power BI, réalisation
                            d’études ciblées et détection proactive des anomalies.
                        </p>

                        <div class="experience-skills-large">
                            <span class="experience-skill-large">Power BI</span>
                            <span class="experience-skill-large">SAP BO</span>
                            <span class="experience-skill-large">Excel VBA</span>
                            <span class="experience-skill-large">DAX</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Navigation -->
            <div class="experience-nav">
                <div class="experience-nav-btn" onclick="changeExperience(-1)">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="15 18 9 12 15 6"></polyline>
                    </svg>
                </div>
                <div class="experience-nav-btn" onclick="changeExperience(1)">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                </div>
            </div>

            <!-- Indicateurs -->
            <div class="experience-indicators">
                <div class="experience-indicator active" onclick="goToExperience(0)"></div>
                <div class="experience-indicator" onclick="goToExperience(1)"></div>
                <div class="experience-indicator" onclick="goToExperience(2)"></div>
                <div class="experience-indicator" onclick="goToExperience(3)"></div>
            </div>
        </div>

        <!-- Desktop Header (Moved Inside) -->
        <div class="experience-header-desktop"
            style="text-align: left; padding: 2rem 3rem 2rem; position: relative; z-index: 20; pointer-events: none;">
            <h2 class="section-title" style="color: white; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">MES EXPÉRIENCES</h2>
            <p class="section-subtitle" style="color: rgba(255,255,255,0.9); text-shadow: 0 1px 2px rgba(0,0,0,0.5);">
                Découvrez mon parcours professionnel chronologique</p>
        </div>
        <!-- Mobile Header (Visible only on mobile via CSS) -->
        <!-- Mobile Header (Visible only on mobile via CSS) -->
        <div class="experience-header-mobile"
            style="display: none; text-align: left; margin-bottom: 1rem; padding: 0 1.5rem;">
            <h2 class="section-title" style="color: #2C3E50; margin-bottom: 0.5rem; margin-top: 2rem;">MES EXPÉRIENCES
            </h2>
            <p class="section-subtitle" style="color: #666; margin-bottom: 2rem;">Découvrez mon parcours professionnel
                chronologique</p>
        </div>

        <!-- Timeline removed as per user request -->
        <div class="experience-dark-content">

            <!-- NEW: Mobile Experience Carousel (Visible only on mobile) -->
            <div class="experience-mobile-carousel" style="display: none;">
                <div class="mobile-carousel-track">
                    <!-- Slide 1: Poisson -->
                    <div class="mobile-experience-card">
                        <img src="experience/halles.jpg" alt="Vendeur Polyvalent" class="mobile-exp-img">
                        <div class="mobile-exp-overlay">
                            <h3 class="mobile-exp-title">Vendeur Polyvalent</h3>
                            <p class="mobile-exp-company">Les P'tites Pêcheries</p>
                        </div>
                        <a href="exp.html" class="mobile-exp-link">Voir mes expériences</a>
                    </div>
                    <!-- Slide 2: Leclerc -->
                    <div class="mobile-experience-card">
                        <img src="experience/bg-leclerc2.jpeg" alt="Employé Polyvalent" class="mobile-exp-img">
                        <div class="mobile-exp-overlay">
                            <h3 class="mobile-exp-title">Employé Commercial</h3>
                            <p class="mobile-exp-company">E.Leclerc</p>
                        </div>
                        <a href="exp.html" class="mobile-exp-link">Voir mes expériences</a>
                    </div>
                    <!-- Slide 3: IMA -->
                    <div class="mobile-experience-card">
                        <img src="experience/ima.jpg" alt="Alternance Data" class="mobile-exp-img">
                        <div class="mobile-exp-overlay">
                            <h3 class="mobile-exp-title">Alternance Data</h3>
                            <p class="mobile-exp-company">IMA</p>
                        </div>
                        <a href="exp.html" class="mobile-exp-link">Voir mes expériences</a>
                    </div>
                    <!-- Slide 4: Herrouet -->
                    <div class="mobile-experience-card">
                        <img src="experience/bg-herrouet.png" alt="Stage Découverte" class="mobile-exp-img">
                        <div class="mobile-exp-overlay">
                            <h3 class="mobile-exp-title">Serveur</h3>
                            <p class="mobile-exp-company">Maison Herrouet </p>
                        </div>
                        <a href="exp.html" class="mobile-exp-link">Voir mes expériences</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lien Voir Plus (Mobile) -->
        <div class="experience-see-more-mobile" style="display: none; text-align: center; margin-top: 1rem;">
            <a href="exp.html" style="color: #5A8FBD; font-size: 0.9rem; text-decoration: none; font-weight: 500;">
                Voir plus d'expériences →
            </a>
        </div>
        </div> <!-- Closing experience-dark-content -->
    </section>

    <!-- Section Engagements - Accordéon -->
    <section id="engagements" class="engagements-section">
        <div class="engagements-header">
            <h2 class="section-title">Mes Engagements</h2>
            <p class="section-subtitle">Implication dans la vie étudiante et associative</p>
        </div>

        <div class="engagements-container">
            <!-- Row 1: Left (Image Left, Text Right) -->
            <!-- Card 1 -->
            <div class="engagement-content">
                <h3 class="engagement-title-modern">Suppléant Délégué</h3>
                <span class="engagement-org-modern">Promotion BUT Science des Données</span>
                <p class="engagement-desc-modern">
                    En tant que suppléant délégué, j'assure la liaison essentielle entre les étudiants et
                    l'administration.
                    Mon rôle est d'écouter, de représenter mes camarades et de contribuer activement à
                    l'amélioration continue de la qualité de notre formation.
                </p>
                <span class="engagement-period-badge">2024 - 2027</span>
                <button class="engagement-expand-btn" onclick="toggleEngagement(this)">
                    En savoir plus
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M6 9l6 6 6-6"></path>
                    </svg>
                </button>
            </div>

            <!-- Row 2: Right (Image Right, Text Left) -->
            <!-- Row 2: Right (Image Right, Text Left) -->
            <!-- Card 2 -->
            <div class="engagement-content">
                <h3 class="engagement-title-modern">Chargé Événementiel</h3>
                <span class="engagement-org-modern">Bureau des Étudiants (BDE)</span>
                <p class="engagement-desc-modern">
                    Au coeur de la vie étudiante, je participe à l'organisation d'événements fédérateurs.
                    Mon objectif est de dynamiser le campus et de renforcer la cohésion entre les différentes
                    promotions à travers des projets conviviaux et ambitieux.
                </p>
                <span class="engagement-period-badge">2024 - 2027</span>
                <button class="engagement-expand-btn" onclick="toggleEngagement(this)">
                    En savoir plus
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M6 9l6 6 6-6"></path>
                    </svg>
                </button>
            </div>

            <!-- Row 3: Left -->
            <!-- Row 3: Left -->
            <!-- Card 3 -->
            <div class="engagement-content">
                <h3 class="engagement-title-modern">Délégué Alternant</h3>
                <span class="engagement-org-modern">Représentant des Étudiants en Alternance</span>
                <p class="engagement-desc-modern">
                    Porte-parole des étudiants en alternance, je facilite la communication entre le monde académique
                    et professionnel.
                    Je veille à ce que les spécificités de notre rythme soient prises en compte et valorisées.
                </p>
                <span class="engagement-period-badge">2025 - 2027</span>
                <button class="engagement-expand-btn" onclick="toggleEngagement(this)">
                    En savoir plus
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M6 9l6 6 6-6"></path>
                    </svg>
                </button>
            </div>

            <!-- Row 4: Right -->
            <!-- Row 4: Right -->
            <!-- Card 4 -->
            <div class="engagement-content">
                <h3 class="engagement-title-modern">Élu au Conseil</h3>
                <span class="engagement-org-modern">Conseil d'Institut de l'Université de Poitiers</span>
                <p class="engagement-desc-modern">
                    En tant qu'élu, je participe aux décisions stratégiques de l'Institut.
                    C'est un engagement fort pour défendre les intérêts des étudiants et participer à la gouvernance
                    de l'université.
                </p>
                <span class="engagement-period-badge">2025 - 2026</span>
                <button class="engagement-expand-btn" onclick="toggleEngagement(this)">
                    En savoir plus
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M6 9l6 6 6-6"></path>
                    </svg>
                </button>
            </div>
        </div>
    </section>

    <!-- Section Statistiques -->
    <!-- Section Statistiques -->
    <section id="statistiques" class="statistics-section">
        <div class="statistics-header">
            <h2 class="section-title">En Chiffres</h2>
            <p class="section-subtitle">Quelques statistiques sur mon parcours et mes compétences</p>
        </div>

        <div class="statistics-grid">



            <!-- Stat 1 - Visiteurs -->
            <div class="stat-card">
                <div class="stat-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                </div>
                <div class="stat-number counter">
                    <?php echo number_format($visiteurs + 100, 0, ',', ' '); ?>
                </div>
                <div class="stat-label">Visiteurs</div>
                <div class="stat-description">Nombre de visites sur ce portfolio</div>
            </div>

            <!-- Stat 2 - Projets -->
            <div class="stat-card">
                <div class="stat-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
                    </svg>
                </div>
                <div class="stat-number">15+</div>
                <div class="stat-label">Projets</div>
                <div class="stat-description">Projets académiques et personnels réalisés</div>
            </div>

            <!-- Stat 3 - Heures de code -->
            <div class="stat-card">
                <div class="stat-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="16 18 22 12 16 6"></polyline>
                        <polyline points="8 6 2 12 8 18"></polyline>
                    </svg>
                </div>
                <div class="stat-number">200+</div>
                <div class="stat-label">Heures de Code</div>
                <div class="stat-description">Temps consacré au développement de ce projet</div>
            </div>

            <!-- Stat 4 - Technologies -->
            <div class="stat-card">
                <div class="stat-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect>
                        <line x1="8" y1="21" x2="16" y2="21"></line>
                        <line x1="12" y1="17" x2="12" y2="21"></line>
                    </svg>
                </div>
                <div class="stat-number">10+</div>
                <div class="stat-label">Technologies</div>
                <div class="stat-description">Langages et outils maîtrisés</div>
            </div>

        </div>




        <!-- Graphiques de progression -->
        <div class="statistics-header">
            <h2 class="section-title">En graphiques</h2>
            <p class="section-subtitle">Quelques représentations de mes compétences</p>
        </div>
        <div class="charts-container">


            <!-- Graphique 1 : Répartition des Projets (Doughnut) -->
            <!-- Graphique 1 : Répartition des Projets (Doughnut) -->
            <div class="chart-card" style="position: relative;">
                <a href="BUT SD - Présentation des compétences.pdf" target="_blank" title="Voir les compétences (PDF)"
                    style="position: absolute; top: 1.5rem; right: 1.5rem; display: inline-flex; align-items: center; justify-content: center; width: 32px; height: 32px; background: #EEF2FF; border-radius: 8px; color: #5A8FBD; transition: all 0.2s;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z" />
                        <polyline points="14 2 14 8 20 8" />
                        <line x1="16" y1="13" x2="8" y2="13" />
                        <line x1="16" y1="17" x2="8" y2="17" />
                        <line x1="10" y1="9" x2="8" y2="9" />
                    </svg>
                </a>
                <h4 class="chart-title">Répartition des Projets</h4>
                <p class="chart-subtitle">Domaines d'intervention</p>

                <div class="chart-wrapper">
                    <canvas id="projectDistributionChart"></canvas>
                </div>
            </div>



            <!-- Graphique 3 : Profil de Compétences (Radar) -->
            <!-- Graphique 3 : Profil de Compétences (Radar) -->
            <div class="chart-card" style="position: relative;">
                <a href="BUT SD - Présentation des compétences.pdf" target="_blank" title="Voir les compétences (PDF)"
                    style="position: absolute; top: 1.5rem; right: 1.5rem; display: inline-flex; align-items: center; justify-content: center; width: 32px; height: 32px; background: #EEF2FF; border-radius: 8px; color: #5A8FBD; transition: all 0.2s;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z" />
                        <polyline points="14 2 14 8 20 8" />
                        <line x1="16" y1="13" x2="8" y2="13" />
                        <line x1="16" y1="17" x2="8" y2="17" />
                        <line x1="10" y1="9" x2="8" y2="9" />
                    </svg>
                </a>
                <h4 class="chart-title">Profil de Compétences</h4>
                <p class="chart-subtitle">Vue d'ensemble</p>

                <div class="chart-wrapper">
                    <canvas id="skillsRadarChart"></canvas>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Contact (visible uniquement sur mobile) -->
    <section id="contact-mobile" class="contact-mobile-section">
        <div class="contact-mobile-header">
            <h2 class="section-title">Me Contacter</h2>
            <p class="section-subtitle">N'hésitez pas à me contacter pour toute opportunité ou question</p>
        </div>

        <div class="contact-mobile-grid">
            <a href="mailto:theo.petit@etu.univ-poitiers.fr" class="contact-mobile-card">
                <div class="contact-mobile-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                </div>
                <h3 class="contact-mobile-title">Email Universitaire</h3>
                <p class="contact-mobile-text">theo.petit@etu.univ-poitiers.fr</p>
            </a>

            <a href="mailto:pro.theopetit@gmail.com" class="contact-mobile-card">
                <div class="contact-mobile-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                </div>
                <h3 class="contact-mobile-title">Email Pro</h3>
                <p class="contact-mobile-text">pro.theopetit@gmail.com</p>
            </a>

            <a href="tel:+33781088125" class="contact-mobile-card">
                <div class="contact-mobile-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path
                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                        </path>
                    </svg>
                </div>
                <h3 class="contact-mobile-title">Téléphone</h3>
                <p class="contact-mobile-text">+33 7 81 08 81 25</p>
            </a>

            <a href="https://www.linkedin.com/in/théo-petit1" target="_blank" class="contact-mobile-card">
                <div class="contact-mobile-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                        <rect x="2" y="9" width="4" height="12"></rect>
                        <circle cx="4" cy="4" r="2"></circle>
                    </svg>
                </div>
                <h3 class="contact-mobile-title">LinkedIn</h3>
                <p class="contact-mobile-text">Théo PETIT</p>
            </a>
        </div>
    </section>

    <!-- Newsletter Section -->




    <footer class="footer" style="margin-top: 0; padding-top: 2rem;">
        <div class="footer-content">
            <!-- Brand Section -->
            <div class="footer-brand">
                <div class="footer-logo">
                    <img src="logo2.png" alt="Logo" class="footer-logo-img" onerror="this.style.display='none';">
                    Théo PETIT
                </div>
                <p class="footer-address">
                    IUT de Niort<br>
                    Département BUT Science des Données<br>
                    79000 Niort, France
                </p>
                <div class="footer-contact">
                    <div class="footer-contact-item">
                        <span class="footer-contact-label">Téléphone:</span>
                        <a href="tel:+33612345678">+33 7 81 08 81 25</a>
                    </div>
                    <div class="footer-contact-item">
                        <span class="footer-contact-label">Email:</span>
                        <a href="mailto:pro.theopetit@gmail.com">pro.theopetit@gmail.com</a>
                    </div>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="footer-section">
                <h4 class="footer-title">Navigation</h4>
                <div class="footer-links">
                    <a href="#top" class="footer-link">Accueil</a>
                    <a href="#apropos" class="footer-link">À propos</a>
                    <a href="#projets" class="footer-link">Projets</a>
                    <a href="#experience" class="footer-link">Expérience</a>
                    <a href="#engagements" class="footer-link">Engagements</a>
                    <a href="#statistiques" class="footer-link">Statistiques</a>
                </div>
            </div>

            <!-- Social Links -->
            <div class="footer-section">
                <h4 class="footer-title">Réseaux</h4>
                <div class="footer-links">
                    <a href="https://www.linkedin.com/in/théo-petit1
                    " target="_blank" class="footer-link">LinkedIn</a>
                    <a href="https://x.com/but_sd_niort" target="_blank" class="footer-link">X</a>
                    <a href="https://www.instagram.com/but_sd_niort/" target="_blank" class="footer-link">Instagram</a>
                    <a </a>
                        <a </a>
                            <a href="redirectory.html" class="footer-link">Redirection</a>
                </div>
            </div>

            <!-- Partenaires -->
            <div class="footer-section">
                <h4 class="footer-title">Formation</h4>
                <div class="footer-logos">
                    <img src="but.png" alt="BUT Logo" class="footer-university-logo"
                        onerror="this.style.display='none';">
                    <img src="univ.png" alt="Université Logo" class="footer-university-logo"
                        onerror="this.style.display='none';">
                </div>
            </div>
        </div>

        <!-- Bottom Section -->
        <div class="footer-bottom">
            <p class="footer-copyright">© 2025 Théo PETIT - Tous droits réservés</p>
        </div>
    </footer>

    <script>
        // Données de recherche avec liens
        const searchData = [
            // Sections principales
            { title: 'À propos', url: '#apropos' },
            { title: 'Profil', url: '#apropos' },
            { title: 'Présentation', url: '#apropos' },
            { title: 'CV', url: 'CV_Theo_PETIT.pdf' },
            { title: 'Curriculum Vitae', url: 'CV_Theo_PETIT.pdf' },
            { title: 'Télécharger CV', url: 'CV_Theo_PETIT.pdf' },
            { title: 'Expérience professionnelle', url: '#experience' },
            { title: 'Expériences', url: '#experience' },
            { title: 'Parcours professionnel', url: '#experience' },
            { title: 'Engagements', url: '#engagements' },
            { title: 'Bénévolat', url: '#engagements' },
            { title: 'Associatif', url: '#engagements' },
            { title: 'Statistiques', url: '#statistiques' },

            { title: 'Skills', url: '#statistiques' },

            // Projets par année
            { title: 'Projets', url: '#projets-1ere' },

            // Technologies et outils
            { title: 'PowerBI', url: '#projets' },
            { title: 'Python', url: '#projets' },
            { title: 'SQL', url: '#projets' },
            { title: 'MySQL', url: '#projets' },
            { title: 'PostgreSQL', url: '#projets' },
            { title: 'R', url: '#projets' },
            { title: 'Java', url: '#projets' },
            { title: 'JavaScript', url: '#projets' },
            { title: 'HTML', url: '#projets' },
            { title: 'CSS', url: '#projets' },
            { title: 'Git', url: '#projets' },
            { title: 'GitHub', url: '#projets' },
            { title: 'Excel', url: '#projets' },
            { title: 'Tableau', url: '#projets' },

            // Compétences
            { title: 'Data Analysis', url: '#apropos' },
            { title: 'Analyse de données', url: '#apropos' },
            { title: 'Data Science', url: '#apropos' },
            { title: 'Intelligence Artificielle', url: '#propos' },
            { title: 'IA', url: '#propos' },


            // Autres termes de recherche
            { title: 'Formation', url: '#apropos' },
            { title: 'Études', url: '#apropos' },
            { title: 'BUT STID', url: '#apropos' },
            { title: 'STID', url: '#apropos' },
            { title: 'Université', url: '#apropos' },
            { title: 'IUT', url: '#apropos' },
            { title: 'Alternance', url: '#experience' },
            { title: 'Calendrier Alternance', url: 'Calendrier-alternance-2027.pdf' },
            { title: 'Calendrier', url: 'Calendrier-alternance-2027.pdf' },
            { title: 'Portail Alternant', url: 'alternance.html' },
            { title: 'Emploi du temps', url: 'planning.html' },
            { title: 'Compétences étudiées', url: 'BUT SD - Présentation des compétences.pdf' },
        ];

        // Gestion de la barre de recherche
        const searchInput = document.getElementById('searchInput');
        const searchSuggestions = document.getElementById('searchSuggestions');

        searchInput.addEventListener('input', (e) => {
            const query = e.target.value.toLowerCase().trim();

            if (query.length === 0) {
                searchSuggestions.classList.remove('active');
                return;
            }

            const results = searchData.filter(item =>
                item.title.toLowerCase().includes(query)
            );

            if (results.length > 0) {
                searchSuggestions.innerHTML = results.map(item => {
                    const highlightedTitle = item.title.replace(
                        new RegExp(query, 'gi'),
                        match => `<strong>${match}</strong>`
                    );
                    return `<div class="suggestion-item" data-url="${item.url}">${highlightedTitle}</div>`;
                }).join('');
                searchSuggestions.classList.add('active');
            } else {
                searchSuggestions.innerHTML = '<div class="suggestion-item">Aucun résultat trouvé</div>';
                searchSuggestions.classList.add('active');
            }
        });

        // Navigation sur clic de suggestion
        searchSuggestions.addEventListener('click', (e) => {
            if (e.target.classList.contains('suggestion-item')) {
                const url = e.target.getAttribute('data-url');
                if (url && url !== 'null') {
                    window.location.href = url;
                }
                searchInput.value = '';
                searchSuggestions.classList.remove('active');
            }
        });

        // Fermer les suggestions au clic extérieur
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.search-container')) {
                searchSuggestions.classList.remove('active');
            }
        });

        // Création des graphiques de progression
        function createChartsVisualizations() {
            // Configuration globale des couleurs (Thème Bleu)
            const colors = {
                primary: '#5A8FBD',    // Bleu principal
                dark: '#2C3E50',       // Bleu nuit
                light: '#A3C4DC',      // Bleu clair
                accent: '#4A6FA5',     // Bleu accent
                bg: 'rgba(90, 143, 189, 0.2)', // Fond transparent
                white: '#ffffff'
            };

            Chart.defaults.font.family = "'Inter', sans-serif";
            Chart.defaults.color = '#4B5563';

            // ========== GRAPHIQUE 1: Répartition des Projets (Doughnut) ==========
            const ctx1 = document.getElementById('projectDistributionChart');
            if (ctx1) {
                new Chart(ctx1, {
                    type: 'doughnut',
                    data: {
                        labels: ['Data Analysis', 'Business Intelligence', 'Développement Web', 'Data Science'],
                        datasets: [{
                            data: [35, 25, 20, 20], // Estimations basées sur le profil
                            backgroundColor: [
                                '#2C3E50', // Dark
                                '#5A8FBD', // Primary
                                '#7FAACF', // Lighter Primary
                                '#A3C4DC'  // Lightest
                            ],
                            borderColor: '#ffffff',
                            borderWidth: 2,
                            hoverOffset: 4
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'bottom',
                                labels: {
                                    usePointStyle: true,
                                    padding: 20,
                                    font: { size: 12 }
                                }
                            },
                            tooltip: {
                                backgroundColor: colors.dark,
                                padding: 12,
                                callbacks: {
                                    label: function (context) {
                                        return ` ${context.label}: ${context.parsed}%`;
                                    }
                                }
                            },
                            datalabels: {
                                color: '#fff',
                                font: {
                                    weight: 'bold',
                                    size: 14
                                },
                                formatter: (value) => value + '%'
                            }
                        },
                        cutout: '60%'
                    }
                });
            }



            // ========== GRAPHIQUE 3: Profil de Compétences (Radar) ==========
            const ctx3 = document.getElementById('skillsRadarChart');
            if (ctx3) {
                new Chart(ctx3, {
                    type: 'radar',
                    data: {
                        labels: ['Analyse de Données', 'Visualisation', 'Programmation', 'Gestion de Projet', 'Communication', 'Statistiques'],
                        datasets: [{
                            label: 'Mon Profil',
                            data: [90, 85, 80, 75, 85, 80],
                            fill: true,
                            backgroundColor: 'rgba(90, 143, 189, 0.2)', // colors.bg
                            borderColor: '#5A8FBD', // colors.primary
                            pointBackgroundColor: '#5A8FBD',
                            pointBorderColor: '#fff',
                            pointHoverBackgroundColor: '#fff',
                            pointHoverBorderColor: '#5A8FBD'
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            r: {
                                angleLines: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                },
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                },
                                pointLabels: {
                                    font: {
                                        size: 12,
                                        family: "'Inter', sans-serif"
                                    },
                                    color: '#4B5563'
                                },
                                suggestedMin: 0,
                                suggestedMax: 100,
                                ticks: {
                                    display: false, // Cache les chiffres de l'échelle
                                    stepSize: 20
                                }
                            }
                        },
                        plugins: {
                            legend: { display: false },
                            tooltip: {
                                backgroundColor: colors.dark,
                                callbacks: {
                                    label: function (context) {
                                        return ` ${context.label}: ${context.parsed.r}/100`;
                                    }
                                }
                            }
                        }
                    }
                });
            }
        }


        // Observer pour animer les graphiques au scroll
        const chartsObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    // Créer les graphiques une seule fois
                    if (!entry.target.dataset.chartsCreated) {
                        createChartsVisualizations();
                        entry.target.dataset.chartsCreated = 'true';
                    }
                }
            });
        }, { threshold: 0.1 });

        // Observer toutes les cartes de graphiques
        document.querySelectorAll('.chart-card').forEach(card => {
            chartsObserver.observe(card);
        });

        // Gestion des onglets de projets
        function showProjects(year) {
            // Hide all project contents
            document.querySelectorAll('.projects-content').forEach(content => {
                content.classList.remove('active');
            });

            // Remove active class from all tabs
            document.querySelectorAll('.project-tab').forEach(tab => {
                tab.classList.remove('active');
            });

            // Show selected year content
            document.getElementById(`projets-${year}`).classList.add('active');

            // Add active class to clicked tab (find the tab that was clicked)
            const clickedTab = Array.from(document.querySelectorAll('.project-tab')).find(tab => {
                const onclick = tab.getAttribute('onclick');
                return onclick && onclick.includes(year);
            });
            if (clickedTab) {
                clickedTab.classList.add('active');
            }
        }

        // Gestion de la vue des projets (Grille vs Large)
        function setProjectView(mode) {
            const grids = document.querySelectorAll('.projects-grid');
            const largeBtn = document.getElementById('viewLargeBtn');
            const gridBtn = document.getElementById('viewGridBtn');

            if (mode === 'large') {
                grids.forEach(grid => grid.classList.add('view-large'));
                largeBtn.classList.add('active');
                gridBtn.classList.remove('active');
            } else {
                grids.forEach(grid => grid.classList.remove('view-large'));
                largeBtn.classList.remove('active');
                gridBtn.classList.add('active');
            }
        }

        // Animation des Engagements (Apparition au scroll)
        const engagementObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    // Stop observing once visible to prevent re-animation
                    engagementObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.2, rootMargin: "0px 0px -100px 0px" });

        document.querySelectorAll('.engagement-row').forEach(row => {
            engagementObserver.observe(row);
        });

        // Navigation vers projets avec sélection d'année
        function navigateToProjects(year) {
            // Fermer le menu déroulant
            const dropdown = event.target.closest('.nav-dropdown');
            if (dropdown) {
                // Force le dropdown à se fermer en retirant temporairement le hover
                dropdown.style.pointerEvents = 'none';
                setTimeout(() => {
                    dropdown.style.pointerEvents = 'auto';
                }, 100);
            }

            // Scroll vers la section projets
            document.getElementById('projets').scrollIntoView({ behavior: 'smooth' });

            // Attendre que le scroll soit terminé puis changer l'onglet
            setTimeout(() => {
                showProjects(year);
            }, 800);
        }

        // Scroll vers le haut
        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Navbar scroll effect et active link avec indicateur glissant
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.nav-link[href^="#"]');
        const activeIndicator = document.getElementById('activeIndicator');

        function updateActiveIndicator(activeLink) {
            if (activeLink && activeIndicator && window.innerWidth > 768) {
                // If the link is inside a dropdown, use the dropdown parent for positioning
                let targetElement = activeLink;
                const dropdown = activeLink.closest('.nav-dropdown');
                if (dropdown) {
                    targetElement = dropdown;
                }

                const linkRect = targetElement.getBoundingClientRect();
                const navCenterRect = targetElement.closest('.nav-center').getBoundingClientRect();

                const left = linkRect.left - navCenterRect.left;
                const width = linkRect.width;

                activeIndicator.style.left = left + 'px';
                activeIndicator.style.width = width + 'px';
            }
        }

        function updateActiveLink(current) {
            // Remove active class from all links
            navLinks.forEach(link => {
                link.classList.remove('active');
            });

            // Find and activate the correct link
            let activeLink = null;
            if (current) {
                navLinks.forEach(link => {
                    const href = link.getAttribute('href');
                    if (href === `#${current}`) {
                        // On desktop, prefer the link inside the dropdown
                        if (window.innerWidth > 768) {
                            const inDropdown = link.closest('.nav-dropdown-desktop');
                            if (inDropdown || !activeLink) {
                                activeLink = link;
                            }
                        } else {
                            // On mobile, prefer the mobile-only link
                            const isMobileOnly = link.classList.contains('nav-link-mobile-only');
                            if (isMobileOnly || !activeLink) {
                                activeLink = link;
                            }
                        }
                        link.classList.add('active');
                    }
                });
            }

            // Update desktop indicator only
            if (window.innerWidth > 768) {
                if (activeLink) {
                    updateActiveIndicator(activeLink);
                } else {
                    activeIndicator.style.width = '0px';
                }
            }
        }

        window.addEventListener('scroll', () => {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }

            // Determine which section is visible
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                // Activate only if truly within the section (middle of the screen)
                if (window.scrollY >= (sectionTop - window.innerHeight / 2) &&
                    window.scrollY < (sectionTop + sectionHeight - window.innerHeight / 2)) {
                    current = section.getAttribute('id');
                }
            });

            updateActiveLink(current);
        });

        // Initialize indicator on load - detect visible section
        window.addEventListener('load', () => {
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                // Activate only if truly within the section
                if (window.scrollY >= (sectionTop - window.innerHeight / 2) &&
                    window.scrollY < (sectionTop + sectionHeight - window.innerHeight / 2)) {
                    current = section.getAttribute('id');
                }
            });

            updateActiveLink(current);
        });

        // Handle window resize
        window.addEventListener('resize', () => {
            // Recalculate active indicator
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (window.scrollY >= (sectionTop - window.innerHeight / 2) &&
                    window.scrollY < (sectionTop + sectionHeight - window.innerHeight / 2)) {
                    current = section.getAttribute('id');
                }
            });
            updateActiveLink(current);
        });


        // Données du carousel À propos (Drag Slider)
        const carouselData = [
            {
                title: 'Formation BAC+3',
                description: 'Titulaire d\'un BAC Technologique STI2D (Science de l\'Ingénieurie et du Développement Durable) avec comme spécialités : Mathématiques et Informatique. Je suis actuellement au sein d\'une formation en Science des Données (SD), un programme de 3 ans, que je devrais terminer en 2027 .',
                image: 'propos/moi.jpg'
            },
            {
                title: 'Alternance - IMA',
                description: 'Création de dashboards Power BI interactifs et automatisation de processus d\'analyse chez IMA. Optimisation de la prise de décision grâce à la visualisation de données complexes.',
                image: 'propos/ima.jpg'
            },
            {
                title: 'Sportif',
                description: 'Je pratique le football depuis mes 6 ans, avec 5 ans passés à Aiffres, 7 ans à Saint-Florent et, depuis 2025, une évolution sportive au FC Chauray. J\'ai également eu l\'occasion d\'affronter des équipes professionnelles comme Brest. En parallèle de mes études, je réalise du renforcement musculaire depuis 2023.',
                image: 'propos/Foot.jpeg'
            },
            {
                title: 'Projets Universitaires',
                description: 'Au cours de ma formation, j\'ai mené de nombreux projets universitaires, qui m\'ont permis de maîtriser un ensemble complet d\'outils, de méthodes et de techniques, couvrant aussi bien la data, le développement web, les statistiques, l\'ETL ou encore la visualisation de données.',
                image: 'propos/projets.png'
            },
            {
                title: 'Veille Technologique',
                description: 'Exploration continue des dernières tendances en data science, en intelligence artificielle et dans les technologies émergentes, afin de rester à jour sur les outils, méthodologies et innovations qui transforment le secteur.',
                image: 'propos/Techno.jpeg'
            },
            {
                title: 'Portfolio Innovation',
                description: 'Conception de solutions créatives alliant design moderne et performance technique. Focus sur l\'expérience utilisateur et l\'accessibilité pour tous les types de projets.',
                image: 'propos/Innovation.png'
            }
        ];

        // INIT DRAG SLIDER
        const sliderContainer = document.getElementById('dragSliderContainer');
        const sliderTrack = document.getElementById('dragSliderTrack');
        const sliderBar = document.getElementById('dragProgressBar');
        let isDown = false;
        let startX;
        let scrollLeft;

        function initDragSlider() {
            if (!sliderTrack) return;

            sliderTrack.innerHTML = '';
            carouselData.forEach(item => {
                const card = document.createElement('div');
                card.className = 'drag-card';
                card.innerHTML = `
            <div class="drag-card-image">
                <img src="${item.image}" alt="${item.title}" onerror="this.src='https://via.placeholder.com/300x400/8A8A8A/FFFFFF?text=${item.title}'">
            </div>
            <div class="drag-card-content">
                <h3 class="drag-card-title">${item.title}</h3>
                <p class="drag-card-desc">${item.description}</p>
            </div>
        `;
                sliderTrack.appendChild(card);
            });

            // Update bar initially
            updateProgressBar();
        }

        // Mouse Events
        sliderContainer.addEventListener('mousedown', (e) => {
            if (window.innerWidth <= 768) return; // Disable on mobile
            isDown = true;
            sliderContainer.classList.add('active');
            startX = e.pageX - sliderContainer.offsetLeft;
            scrollLeft = sliderContainer.scrollLeft;
        });

        sliderContainer.addEventListener('mouseleave', () => {
            isDown = false;
            sliderContainer.classList.remove('active');
        });

        sliderContainer.addEventListener('mouseup', () => {
            isDown = false;
            sliderContainer.classList.remove('active');
        });

        sliderContainer.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            const x = e.pageX - sliderContainer.offsetLeft;
            const walk = (x - startX) * 2; // Scroll-fast
            sliderContainer.scrollLeft = scrollLeft - walk;
        });

        // Touch Events - Disabled on mobile to let native scroll work
        // Only enabled if we w        ant "drag" feeling, but native is                 better.
        // We remove e.preve        ntDefault() to allow scrol                         l.
        /*
sliderContainer.addEventListener('touchstart', (e) => {
// Let native scroll handle it
});
*/

        // Scroll Progress
        sliderContainer.addEventListener('scroll', updateProgressBar);

        function updateProgressBar() {
            const maxScroll = sliderContainer.scrollWidth - sliderContainer.clientWidth;
            const currentScroll = sliderContainer.scrollLeft;
            const width = (currentScroll / maxScroll) * 100;
            if (sliderBar) {
                sliderBar.style.width = width + '%';
            }
        }

        // Init
        document.addEventListener('DOMContentLoaded', initDragSlider);


        // Textes pour chaque image
        const texts = [
            {
                title: "Data Analyst - IMA",
                description: "Passionné par l'analyse de données et la visualisation, je poursuis ma formation en alternance"
            },
            {
                title: "Étudiant en Science des Données",
                description: "Formation BUT à l'IUT de Niort, spécialisation en analyse statistique et de visualisation à des fins décisionnelles"
            },

            {
                title: "Une formation appliquée",
                description: "Axée sur les données, mêlant informatique, statistiques et mathématiques"
            },
            {
                title: "Une formation appliquée",
                description: "Axée sur les données, mêlant informatique, statistiques et mathématiques"
            }
        ];

        // Carousel d'images et textes
        const slides = document.querySelectorAll('.bg-slide');
        const heroText = document.getElementById('heroText');
        let currentSlide = 0;

        function changeSlide() {
            // Fade out texte
            heroText.classList.remove('active');

            setTimeout(() => {
                // Change image
                slides[currentSlide].classList.remove('active');
                currentSlide = (currentSlide + 1) % slides.length;
                slides[currentSlide].classList.add('active');

                // Change texte
                const currentText = texts[currentSlide];
                heroText.querySelector('h1').textContent = currentText.title;
                heroText.querySelector('p').textContent = currentText.description;

                // Fade in texte
                setTimeout(() => {
                    heroText.classList.add('active');
                }, 100);
            }, 500);
        }

        // Change toutes les 4 secondes
        setInterval(changeSlide, 4000);

        // Observer pour l'animation des sections au scroll
        const observerOptions = {
            threshold: 0.2,
            rootMargin: '0px 0px -100px 0px'
        };

        const sectionObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    sectionObserver.unobserve(entry.target);
                }
            });
        }, observerOptions);

        // Observer la section Projets
        const projectsSection = document.querySelector('.projects-section');
        if (projectsSection) {
            sectionObserver.observe(projectsSection);
        }

        // Observer la section Expérience
        const experienceSection = document.querySelector('.experience-section');
        if (experienceSection) {
            sectionObserver.observe(experienceSection);
        }

        // Carrousel d'expériences
        let currentExperienceIndex = 0;
        const experienceSlides = document.querySelectorAll('.experience-slide');
        const experienceIndicators = document.querySelectorAll('.experience-indicator');
        const slidesContainer = document.querySelector('.experience-slides');

        function updateExperienceCarousel() {
            // Déplacer le conteneur des slides
            if (slidesContainer) {
                slidesContainer.style.transform = `translateX(-${currentExperienceIndex * 100}%)`;
            }

            // Positionner chaque point de la timeline
            const timelinePoints = document.querySelectorAll('.timeline-point');
            const totalPoints = experienceSlides.length;

            timelinePoints.forEach((point, index) => {
                // Calculer la position relative : le point actif est à 50%, les autres se décalent
                const offset = (index - currentExperienceIndex) * 200; // Espacement entre les points

                if (index === currentExperienceIndex) {
                    // Point actif au centre
                    point.style.left = '50%';
                } else if (Math.abs(index - currentExperienceIndex) <= 2) {
                    // Points proches visibles
                    point.style.left = `calc(50% + ${offset}px)`;
                } else {
                    // Points lointains hors écran
                    point.style.left = offset > 0 ? '150%' : '-50%';
                }

                // Mettre à jour la classe active
                point.classList.toggle('active', index === currentExperienceIndex);
            });

            // Mettre à jour les classes active des slides
            experienceSlides.forEach((slide, index) => {
                slide.classList.toggle('active', index === currentExperienceIndex);
            });

            experienceIndicators.forEach((indicator, index) => {
                indicator.classList.toggle('active', index === currentExperienceIndex);
            });

            // Mettre à jour la progression de la timeline
            const timelineProgress = document.querySelector('.timeline-progress');
            if (timelineProgress) {
                const progressPercent = (currentExperienceIndex / (experienceSlides.length - 1)) * 100;
                timelineProgress.style.width = progressPercent + '%';
            }
        }

        function changeExperience(direction) {
            currentExperienceIndex += direction;

            // Boucle circulaire
            if (currentExperienceIndex < 0) {
                currentExperienceIndex = experienceSlides.length - 1;
            } else if (currentExperienceIndex >= experienceSlides.length) {
                currentExperienceIndex = 0;
            }

            updateExperienceCarousel();
        }

        function goToExperience(index) {
            currentExperienceIndex = index;
            updateExperienceCarousel();
        }

        // Initialiser le carrousel
        window.addEventListener('load', () => {
            updateExperienceCarousel();
        });

        // Auto-rotation toutes les 10 secondes
        let experienceAutoRotate = setInterval(() => {
            changeExperience(1);
        }, 10000);

        // Réinitialiser le timer quand l'utilisateur change manuellement
        function resetExperienceTimer() {
            clearInterval(experienceAutoRotate);
            experienceAutoRotate = setInterval(() => {
                changeExperience(1);
            }, 10000);
        }

        // Modifier la fonction changeExperience pour réinitialiser le timer
        const originalChangeExperience = changeExperience;
        changeExperience = function (direction) {
            originalChangeExperience(direction);
            resetExperienceTimer();
        };

        // Modifier goToExperience pour réinitialiser le timer aussi
        const originalGoToExperience = goToExperience; // Store original function
        goToExperience = function (index) {
            originalGoToExperience(index);
            resetExperienceTimer();
        };

        // Observer la section Engagements
        const engagementsSection = document.querySelector('.engagements-section');
        if (engagementsSection) {
            sectionObserver.observe(engagementsSection);
        }

        // Observer la section Statistiques
        const statisticsSection = document.querySelector('.statistics-section');
        if (statisticsSection) {
            sectionObserver.observe(statisticsSection);
        }



        // Animer les barres de compétences au scroll
        const skillBars = document.querySelectorAll('.skill-bar');

        const skillsObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                    skillsObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });

        skillBars.forEach(bar => {
            skillsObserver.observe(bar);
        });

        // Accordéon Engagements
        // Accordion functionality removed - cards are now static
        // function toggleEngagement(card) {
        //     const wasActive = card.classList.contains('active');
        //     document.querySelectorAll('.engagement-card').forEach(otherCard => {
        //         if (otherCard !== card) {
        //             otherCard.classList.remove('active');
        //         }
        //     });
        //     if (wasActive) {
        //         card.classList.remove('active');
        //     } else {
        //         card.classList.add('active');
        //     }
        // }

        // Menu Mobile - Toggle
        function toggleMobileMenu() {
            const navCenter = document.getElementById('navCenter');
            const hamburgerBtn = document.getElementById('hamburgerBtn');

            navCenter.classList.toggle('active');
            hamburgerBtn.classList.toggle('active');
            document.body.classList.toggle('menu-open');
        }

        // Toggle barre de recherche sur mobile
        const searchIcon = document.querySelector('.search-icon');
        const searchContainer = document.querySelector('.search-container');

        if (searchIcon) {
            searchIcon.addEventListener('click', (e) => {
                if (window.innerWidth <= 768) {
                    e.stopPropagation();
                    searchContainer.classList.toggle('active');
                    if (searchContainer.classList.contains('active')) {
                        document.getElementById('searchInput').focus();
                    }
                }
            });
        }

        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 768 &&
                searchContainer.classList.contains('active') &&
                !searchContainer.contains(e.target)) {
                searchContainer.classList.remove('active');
            }
        });



        // Init


        // Drag & Drop Logic

        // 1. About Section (3D Rotation Drag)
        function enableDragRotation() {
            const container = document.querySelector('.carousel-images');
            let isDragging = false;
            let startX;

            container.addEventListener('mousedown', (e) => {
                isDragging = true;
                startX = e.pageX;
                container.style.cursor = 'grabbing';
                pauseAboutCarousel();
            });

            container.addEventListener('mouseleave', () => {
                isDragging = false;
                container.style.cursor = 'grab';
            });

            container.addEventListener('mouseup', () => {
                isDragging = false;
                container.style.cursor = 'grab';
            });

            container.addEventListener('mousemove', (e) => {
                if (!isDragging) return;
                e.preventDefault();
                const x = e.pageX;
                const walk = (x - startX);

                if (Math.abs(walk) > 50) { // Threshold
                    if (walk > 0) {
                        // Drag Right -> Previous Slide
                        const newIndex = (currentAboutSlide - 1 + carouselData.length) % carouselData.length;
                        goToSlideAbout(newIndex);
                    } else {
                        // Drag Left -> Next Slide
                        const newIndex = (currentAboutSlide + 1) % carouselData.length;
                        goToSlideAbout(newIndex);
                    }
                    isDragging = false; // Reset
                    startX = x; // Reset start to prevent rapid firing
                }
            });

            // Touch support
            container.addEventListener('touchstart', (e) => {
                startX = e.touches[0].pageX;
                pauseAboutCarousel();
            });

            container.addEventListener('touchmove', (e) => {
                const x = e.touches[0].pageX;
                const walk = (x - startX);

                if (Math.abs(walk) > 50) {
                    if (walk > 0) {
                        const newIndex = (currentAboutSlide - 1 + carouselData.length) % carouselData.length;
                        goToSlideAbout(newIndex);
                    } else {
                        const newIndex = (currentAboutSlide + 1) % carouselData.length;
                        goToSlideAbout(newIndex);
                    }
                    startX = x;
                }
            });
        }

        // 2. Experience Section (Slide Change)
        function enableDragSlide() {
            const container = document.querySelector('.experience-carousel-container');
            let isDragging = false;
            let startX;

            container.addEventListener('mousedown', (e) => {
                isDragging = true;
                startX = e.pageX;
                container.style.cursor = 'grabbing';
            });

            container.addEventListener('mouseleave', () => {
                isDragging = false;
                container.style.cursor = 'grab';
            });

            container.addEventListener('mouseup', () => {
                isDragging = false;
                container.style.cursor = 'grab';
            });

            container.addEventListener('mousemove', (e) => {
                if (!isDragging) return;
                e.preventDefault();
                const x = e.pageX;
                const walk = (x - startX);

                if (Math.abs(walk) > 100) { // Threshold
                    if (walk > 0) {
                        // Drag Right -> Previous Slide
                        if (currentExperienceIndex > 0) {
                            goToExperience(currentExperienceIndex - 1);
                        }
                    } else {
                        // Drag Left -> Next Slide
                        if (currentExperienceIndex < 3) { // 4 slides total (0-3)
                            goToExperience(currentExperienceIndex + 1);
                        }
                    }
                    isDragging = false;
                }
            });

            // Touch support
            container.addEventListener('touchstart', (e) => {
                startX = e.touches[0].pageX;
            });

            container.addEventListener('touchmove', (e) => {
                const x = e.touches[0].pageX;
                const walk = (x - startX);

                if (Math.abs(walk) > 50) {
                    if (walk > 0) {
                        if (currentExperienceIndex > 0) goToExperience(currentExperienceIndex - 1);
                    } else {
                        if (currentExperienceIndex < 3) goToExperience(currentExperienceIndex + 1);
                    }
                    startX = x;
                }
            });
        }

        // 3. Desktop Horizontal Scroll on Vertical Wheel (About Section)
        // 3. Desktop Horizontal Scroll on Vertical Wheel (About Section)
        // Simple version maintained as fallback if needed, or left empty if user wants purely manual drag
        function enableDesktopWheelScroll() {
            const container = document.getElementById('dragSliderContainer');
            if (!container) return;

            container.addEventListener('wheel', (e) => {
                // Only on Desktop
                if (window.innerWidth <= 768) return;

                // Vertical scroll (deltaY)
                if (e.deltaY !== 0) {
                    // We removed the complex logic. 
                    // If user wants NO hijacking, we do nothing.
                    // If user wants simple conversion:
                    /*
                   e.preventDefault();
                   container.scrollLeft += e.deltaY;
                    */
                }
            }, { passive: false });
        }


        // 3. Vertical Scroll Reveal Logic (GSAP-like)
        function initScrollAnimations() {
            if (window.innerWidth <= 768) return;

            const observerOptions = {
                threshold: 0.15,
                rootMargin: "0px 0px -50px 0px"
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        observer.unobserve(entry.target); // Once visible, stay visible
                    }
                });
            }, observerOptions);

            const elements = document.querySelectorAll('.reveal-on-scroll');
            elements.forEach(el => observer.observe(el));
        }

        // Init Drag & Drop
        document.addEventListener('DOMContentLoaded', () => {
            enableDragRotation();
            enableDragSlide();
            enableDesktopWheelScroll();

        });
        if (window.innerWidth <= 768) {
            const searchContainer = document.querySelector('.search-container');
            const searchIcon = document.querySelector('.search-icon');
            const searchInput = document.getElementById('searchInput');

            if (searchIcon && searchContainer) {
                searchIcon.addEventListener('click', (e) => {
                    e.stopPropagation();
                    searchContainer.classList.toggle('active');
                    if (searchContainer.classList.contains('active')) {
                        setTimeout(() => searchInput.focus(), 300);
                    }
                });

                // Fermer la recherche si on clique ailleurs
                document.addEventListener('click', (e) => {
                    if (!e.target.closest('.search-container')) {
                        searchContainer.classList.remove('active');
                    }
                });
            }
        }

        // Réinitialiser au redimensionnement
        window.addEventListener('resize', () => {
            const searchContainer = document.querySelector('.search-container');
            if (window.innerWidth > 768 && searchContainer) {
                searchContainer.classList.remove('active');
            }
        });

        // Fermer le menu quand on clique sur un lien
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', (e) => {
                // Ne pas fermer si c'est un dropdown
                if (!e.target.closest('.nav-dropdown')) {
                    const navCenter = document.getElementById('navCenter');
                    const hamburgerBtn = document.getElementById('hamburgerBtn');
                    navCenter.classList.remove('active');
                    hamburgerBtn.classList.remove('active');
                }
            });
        });

        // Toggle dropdown mobile
        document.querySelectorAll('.nav-dropdown > .nav-link, .nav-dropdown > span').forEach(dropdownToggle => {
            dropdownToggle.addEventListener('click', (e) => {
                if (window.innerWidth <= 768) {
                    e.preventDefault();
                    const dropdown = dropdownToggle.closest('.nav-dropdown');
                    dropdown.classList.toggle('active');
                }
            });
        });
        // Mobile Experience Carousel Logic (Auto-Scroll)
        function initMobileExperienceCarousel() {
            const track = document.querySelector('.mobile-carousel-track');
            if (!track) return;

            let currentIndex = 0;
            const slides = track.querySelectorAll('.mobile-experience-card');
            const totalSlides = slides.length;

            function nextSlideMobile() {
                currentIndex = (currentIndex + 1) % totalSlides;
                track.style.transform = `translateX(-${currentIndex * 100}%)`;
            }

            // Auto scroll every 3 seconds
            let mobileInterval = setInterval(nextSlideMobile, 3000);

            // Pause on touch to allow reading/clicking
            track.addEventListener('touchstart', () => clearInterval(mobileInterval));
            track.addEventListener('touchend', () => {
                clearInterval(mobileInterval);
                mobileInterval = setInterval(nextSlideMobile, 3000);
            });
        }

        document.addEventListener('DOMContentLoaded', initMobileExperienceCarousel);
    </script>
    <script>
        function toggleEngagement(btn) {
            const content = btn.closest('.engagement-content');
            content.classList.toggle('expanded');
        }
    </script>
</body>

</html>