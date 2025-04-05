<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodApp Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            min-height: 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)),
                url('https://images.unsplash.com/photo-1543353071-873f17a7a088?q=80&w=1974&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            transform-style: preserve-3d;
            perspective: 1000px;
            animation: containerAppear 0.6s ease-out;
        }

        .logo {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.1);
            margin: 0 auto 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: logoSpin 1s ease-out;
        }

        .logo svg {
            width: 40px;
            height: 40px;
            fill: none;
            stroke: white;
            stroke-width: 2;
        }

        h1 {
            color: white;
            text-align: center;
            margin-bottom: 10px;
            font-size: 2em;
            animation: slideDown 0.5s ease-out;
        }

        p {
            color: rgba(255, 255, 255, 0.8);
            text-align: center;
            margin-bottom: 30px;
            animation: slideDown 0.5s ease-out 0.1s backwards;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
            animation: slideUp 0.5s ease-out;
        }

        .input-group svg {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            stroke: rgba(255, 255, 255, 0.8);
        }

        input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            color: white;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        input:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.5);
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }

        button {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #FF6B6B, #FF8E53);
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            animation: slideUp 0.5s ease-out 0.2s backwards;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        button:active {
            transform: translateY(0);
        }

        .register-link {
            margin-top: 20px;
            text-align: center;
            animation: slideUp 0.5s ease-out 0.3s backwards;
        }

        .register-link a {
            color: #FF6B6B;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: #FF8E53;
        }

        @keyframes containerAppear {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes logoSpin {
            from {
                transform: rotate(-180deg);
                opacity: 0;
            }
            to {
                transform: rotate(0);
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .particle {
            position: absolute;
            background: white;
            border-radius: 50%;
            opacity: 0;
        }

    </style>
</head>
<body>
    <div class="particles"></div>
    <div class="form-container">
        <div class="logo">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M18 8h1a4 4 0 0 1 0 8h-1"></path>
                <path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"></path>
                <line x1="6" y1="1" x2="6" y2="4"></line>
                <line x1="10" y1="1" x2="10" y2="4"></line>
                <line x1="14" y1="1" x2="14" y2="4"></line>
            </svg>
        </div>
        <h1>Welcome to FoodApp</h1>
        <p>Please sign in to continue</p>
        <form action="LoginServlet" method="post" id="loginForm">
            <div class="input-group">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                    <polyline points="22,6 12,13 2,6"></polyline>
                </svg>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="input-group">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" id="submitBtn">Sign In</button>
        </form>
        <p class="register-link">Don't have an account? <a href="Register.jsp">Register Here</a></p>
    </div>

    <script>
        // Particle Animation
        function createParticles() {
            const particlesContainer = document.querySelector('.particles');
            const particleCount = 50;

            for (let i = 0; i < particleCount; i++) {
                createParticle(particlesContainer);
            }
        }

        function createParticle(container) {
            const particle = document.createElement('div');
            particle.className = 'particle';
            
            // Random size between 2-4px
            const size = Math.random() * 2 + 2;
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            
            // Random starting position
            particle.style.left = `${Math.random() * 100}%`;
            particle.style.top = `${Math.random() * 100}%`;
            
            container.appendChild(particle);
            
            // Animate the particle
            animateParticle(particle);
        }

        function animateParticle(particle) {
            const animation = particle.animate([
                {
                    transform: 'translateY(0) rotate(0deg)',
                    opacity: 0
                },
                {
                    transform: `translateY(-${window.innerHeight}px) rotate(${Math.random() * 360}deg)`,
                    opacity: 0.8
                },
                {
                    transform: `translateY(-${window.innerHeight * 2}px) rotate(${Math.random() * 720}deg)`,
                    opacity: 0
                }
            ], {
                duration: Math.random() * 3000 + 3000,
                easing: 'linear',
                iterations: Infinity
            });
        }

        // Form Animation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const button = document.getElementById('submitBtn');
            const originalText = button.textContent;
            
            button.disabled = true;
            button.innerHTML = '<span class="loading">Signing in...</span>';
            button.style.background = 'linear-gradient(45deg, #757575, #999999)';
            
            // Simulate form submission (replace with actual form submission)
            setTimeout(() => {
                this.submit();
            }, 1000);
        });

        // Input Focus Effects
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });

        // Initialize particles
        createParticles();

        // Responsive particle recreation on window resize
        let resizeTimeout;
        window.addEventListener('resize', () => {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(() => {
                const container = document.querySelector('.particles');
                container.innerHTML = '';
                createParticles();
            }, 250);
        });
    </script>
</body>
</html>