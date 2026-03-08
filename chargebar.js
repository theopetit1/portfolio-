document.addEventListener('DOMContentLoaded', () => {
    // Inject styles for the specific loading screen elements
    const style = document.createElement('style');
    style.innerHTML = `
        #loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            transition: opacity 0.8s ease-out, visibility 0.8s ease-out;
            overflow: hidden;
        }

        /* Background Image with Blur and Darken */
        #loading-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('slide_acceuil/slide_3.png');
            background-size: cover;
            background-position: center;
            filter: blur(8px) brightness(0.4);
            transform: scale(1.1); /* Prevent blur edges */
            z-index: -1;
        }

        #loading-content {
            position: relative;
            z-index: 10;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1.5rem;
            text-align: center;
            padding: 2rem;
        }

        #loading-logo {
            width: 100px;
            height: 100px;
            object-fit: contain;
            filter: drop-shadow(0 0 15px rgba(255,255,255,0.3));
            animation: pulse-logo 2s infinite ease-in-out;
        }

        #loading-title {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
            margin: 0;
            text-shadow: 0 4px 10px rgba(0,0,0,0.5);
        }

        .loading-bar-container {
            width: 250px;
            height: 4px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            margin-top: 1rem;
        }

        #loading-bar {
            width: 0%;
            height: 100%;
            background: linear-gradient(90deg, #5A8FBD 0%, #B8D4EC 100%);
            border-radius: 10px;
            transition: width 0.1s linear;
            box-shadow: 0 0 10px rgba(90, 143, 189, 0.5);
        }

        #loading-text {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
            font-weight: 500;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: 0.5rem;
        }

        @keyframes pulse-logo {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.05); opacity: 0.9; }
        }

        /* Mobile Adjustments */
        @media (max-width: 768px) {
            #loading-logo {
                width: 80px;
                height: 80px;
            }
            #loading-title {
                font-size: 1.8rem;
            }
            .loading-bar-container {
                width: 200px;
            }
        }
    `;
    document.head.appendChild(style);

    // Create overlay structure
    const overlay = document.createElement('div');
    overlay.id = 'loading-overlay';

    // Background
    const bg = document.createElement('div');
    bg.id = 'loading-bg';
    overlay.appendChild(bg);

    // Content Container
    const content = document.createElement('div');
    content.id = 'loading-content';

    // Logo
    const logo = document.createElement('img');
    logo.id = 'loading-logo';
    logo.src = 'logo2.png';
    logo.alt = 'Logo';
    // Fallback for logo
    logo.onerror = function () { this.style.display = 'none'; };
    content.appendChild(logo);

    // Title
    const title = document.createElement('h1');
    title.id = 'loading-title';
    title.textContent = 'Portfolio Numérique';
    content.appendChild(title);

    // Bar Container
    const barContainer = document.createElement('div');
    barContainer.className = 'loading-bar-container';

    // Bar
    const bar = document.createElement('div');
    bar.id = 'loading-bar';
    barContainer.appendChild(bar);
    content.appendChild(barContainer);

    // Text "Chargement..."
    const text = document.createElement('div');
    text.id = 'loading-text';
    text.textContent = 'Chargement...';
    content.appendChild(text);

    overlay.appendChild(content);
    document.body.prepend(overlay);

    // Animation Logic
    const startTime = Date.now();
    const minLoadTime = 2000; // Minimum screen time in ms
    let progress = 0;

    // Emulate loading progress
    const interval = setInterval(() => {
        // Random increment
        progress += Math.random() * 5;

        // Cap visual progress until loaded
        if (progress > 90) progress = 90;

        bar.style.width = `${progress}%`;
    }, 50);

    // Remove overlay when window loads AND min time passed
    window.addEventListener('load', () => {
        const elapsedTime = Date.now() - startTime;
        const remainingTime = Math.max(0, minLoadTime - elapsedTime);

        setTimeout(() => {
            clearInterval(interval);
            bar.style.width = '100%';

            setTimeout(() => {
                overlay.style.opacity = '0';
                overlay.style.visibility = 'hidden';
                setTimeout(() => {
                    overlay.remove();
                }, 800);
            }, 500); // Wait for bar to hit 100% visibily
        }, remainingTime);
    });
});
