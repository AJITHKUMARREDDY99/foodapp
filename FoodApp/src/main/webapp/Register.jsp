<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodApp Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)),
                url('https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?q=80&w=2070&auto=format&fit=crop');
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
            max-width: 500px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
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
            display: flex;
            flex-direction: column;
        }

        .input-group:nth-child(1) { animation-delay: 0.1s; }
        .input-group:nth-child(2) { animation-delay: 0.2s; }
        .input-group:nth-child(3) { animation-delay: 0.3s; }
        .input-group:nth-child(4) { animation-delay: 0.4s; }
        .input-group:nth-child(5) { animation-delay: 0.5s; }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-group svg {
            position: absolute;
            left: 15px;
            width: 20px;
            height: 20px;
            stroke: rgba(255, 255, 255, 0.8);
            pointer-events: none;
            transition: all 0.3s ease;
            top: 50%;
            transform: translateY(-50%);
        }

        label {
            display: block;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 8px;
            font-size: 0.9em;
            transform-origin: left;
            transition: all 0.3s ease;
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
            color: rgba(255, 255, 255, 0.5);
        }

        input:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.5);
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }

        input:focus + svg {
            stroke: #FF6B6B;
            transform: translateY(-50%) scale(1.1);
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
            animation: slideUp 0.5s ease-out 0.6s backwards;
            position: relative;
            overflow: hidden;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        button:active {
            transform: translateY(0);
        }

        button::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to right,
                rgba(255, 255, 255, 0) 0%,
                rgba(255, 255, 255, 0.3) 50%,
                rgba(255, 255, 255, 0) 100%
            );
            transform: rotate(45deg);
            transition: all 0.3s ease;
        }

        button:hover::after {
            animation: shimmer 1.5s infinite;
        }

        .login-link {
            margin-top: 20px;
            text-align: center;
            animation: slideUp 0.5s ease-out 0.7s backwards;
        }

        .login-link a {
            color: #FF6B6B;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-link a:hover {
            color: #FF8E53;
        }

        .login-link a::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -2px;
            left: 0;
            background: linear-gradient(to right, #FF6B6B, #FF8E53);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        .login-link a:hover::after {
            transform: scaleX(1);
            transform-origin: left;
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

        @keyframes shimmer {
            0% { transform: rotate(45deg) translateX(-100%); }
            100% { transform: rotate(45deg) translateX(100%); }
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

        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            h1 {
                font-size: 1.5em;
            }

            input {
                font-size: 14px;
            }
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
        <h1>Create Your Account</h1>
        <p>Join FoodApp and start your culinary journey</p>
        <form action="RegisterServlet" method="post" id="registerForm">
            <div class="input-group">
                <label for="username">Username</label>
                <div class="input-wrapper">
                    <input type="text" id="username" name="username" placeholder="Choose a username" required>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                </div>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <div class="input-wrapper">
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                </div>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                </div>
            </div>

            <div class="input-group">
                <label for="cpassword">Confirm Password</label>
                <div class="input-wrapper">
                    <input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                </div>
            </div>

            <div class="input-group">
                <label for="address">Address</label>
                <div class="input-wrapper">
                    <input type="text" id="address" name="address" placeholder="Enter your address" required>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                        <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                </div>
            </div>

            <button type="submit" id="submitBtn">Create Account</button>
        </form>
        <p class="login-link">Already have an account? <a href="login.jsp">Sign In</a></p>
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
            
            const size = Math.random() * 2 + 2;
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.background = 'white';
            particle.style.borderRadius = '50%';
            particle.style.position = 'absolute';
            particle.style.left = `${Math.random() * 100}%`;
            particle.style.top = `${Math.random() * 100}%`;
            
            container.appendChild(particle);
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

        // Form Validation and Animation
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const password = document.getElementById('password').value;
            const cpassword = document.getElementById('cpassword').value;
            
            if (password !== cpassword) {
                alert('Passwords do not match!');
                return;
            }

            const button = document.getElementById('submitBtn');
            button.disabled = true;
            button.innerHTML = '<span class="loading">Creating Account...</span>';
            button.style.background = 'linear-gradient(45deg, #757575, #999999)';
            
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