<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f3e7ff 0%, #ffe7f4 100%);
            min-height: 100vh;
            padding: 2rem;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .header {
            background: #7c3aed;
            padding: 2rem;
            color: white;
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            object-fit: cover;
        }

        .profile-name {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .member-since {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.9rem;
        }

        .content {
            padding: 2rem;
        }

        .section {
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.5rem;
            color: #333;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #eee;
            margin-bottom: 1rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #555;
            margin-bottom: 1rem;
        }

        .info-icon {
            width: 24px;
            height: 24px;
            color: #7c3aed;
        }

        .favorites {
            background: #f9f5ff;
            padding: 1.5rem;
            border-radius: 12px;
            margin-top: 2rem;
        }

        .favorites-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .favorite-item {
            background: white;
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .edit-btn {
            background: #7c3aed;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            margin-top: 1rem;
            transition: background 0.2s;
        }

        .edit-btn:hover {
            background: #6d28d9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-male-user-profile-vector-illustration-isolated-background-man-profile-sign-business-concept_157943-38764.jpg?semt=ais_hybrid" 
                 alt="Profile" 
                 class="profile-image">
            <div>
                <h1 class="profile-name" id="customerName">Sarah Johnson</h1>
                <p class="member-since">Member since January 2023</p>
            </div>
        </div>

        <div class="content">
            <div class="info-grid">
                <!-- Contact Information -->
                <div class="section">
                    <h2 class="section-title">Contact Information</h2>
                    <div class="info-item">
                        <svg class="info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                        </svg>
                        <span id="customerEmail">sarah.j@email.com</span>
                    </div>
                    <div class="info-item">
                        <svg class="info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                        </svg>
                        <span id="customerPhone">+1 (555) 987-6543</span>
                    </div>
                    <div class="info-item">
                        <svg class="info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                            <circle cx="12" cy="10" r="3"></circle>
                        </svg>
                        <span id="customerAddress">456 Park Avenue, Apt 7B, New York, NY 10022</span>
                    </div>
                </div>

                <!-- Preferences & History -->
                <div class="section">
                    <h2 class="section-title">Preferences & History</h2>
                    <div class="info-item">
                        <svg class="info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M3 3h18v18H3zM12 8v8m-4-4h8"></path>
                        </svg>
                        <span id="customerPreferences">Vegetarian</span>
                    </div>
                    <div class="info-item">
                        <svg class="info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M12 6v6l4 2"></path>
                        </svg>
                        <span id="lastOrder">Last Order: Yesterday at 7:30 PM</span>
                    </div>
                </div>
            </div>

            <!-- Favorite Restaurants -->
            <div class="favorites">
                <h2 class="section-title">Favorite Restaurants</h2>
                <div class="favorites-grid" id="favoriteRestaurants">
                    <!-- Populated by JavaScript -->
                </div>
            </div>

            <button class="edit-btn" onclick="editProfile()">Edit Profile</button>
        </div>
    </div>

    <script>
        // Sample customer data
        let customerData = {
            name: "Sarah Johnson",
            email: "sarah.j@email.com",
            phone: "+1 (555) 987-6543",
            address: "456 Park Avenue, Apt 7B, New York, NY 10022",
            preferences: "Vegetarian",
            lastOrder: "Yesterday at 7:30 PM",
            favorites: ["The Golden Plate", "Sushi Master", "La Piazza"]
        };

        // Function to update the UI with customer data
        function updateProfile() {
            document.getElementById('customerName').textContent = customerData.name;
            document.getElementById('customerEmail').textContent = customerData.email;
            document.getElementById('customerPhone').textContent = customerData.phone;
            document.getElementById('customerAddress').textContent = customerData.address;
            document.getElementById('customerPreferences').textContent = customerData.preferences;
            document.getElementById('lastOrder').textContent = `Last Order: ${customerData.lastOrder}`;

            // Update favorite restaurants
            const favoritesContainer = document.getElementById('favoriteRestaurants');
            favoritesContainer.innerHTML = '';
            customerData.favorites.forEach(restaurant => {
                const div = document.createElement('div');
                div.className = 'favorite-item';
                div.textContent = restaurant;
                favoritesContainer.appendChild(div);
            });
        }

        // Function to handle profile editing
        function editProfile() {
            const newName = prompt('Enter new name:', customerData.name);
            if (newName) customerData.name = newName;

            const newEmail = prompt('Enter new email:', customerData.email);
            if (newEmail) customerData.email = newEmail;

            const newPhone = prompt('Enter new phone:', customerData.phone);
            if (newPhone) customerData.phone = newPhone;

            const newAddress = prompt('Enter new address:', customerData.address);
            if (newAddress) customerData.address = newAddress;

            const newPreferences = prompt('Enter dietary preferences:', customerData.preferences);
            if (newPreferences) customerData.preferences = newPreferences;

            updateProfile();
        }

        // Initialize the profile
        updateProfile();
    </script>
</body>
</html>