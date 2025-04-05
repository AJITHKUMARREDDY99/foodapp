<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        :root {
            --primary: #2193b0;
            --primary-dark: #1b7a8f;
            --secondary: #6dd5ed;
            --text-dark: #2d3436;
            --text-light: #636e72;
            --success: #00b894;
            --danger: #d63031;
            --white: #ffffff;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            min-height: 100vh;
            margin: 0;
            padding: 20px 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-dark);
        }

        .header {
            background: var(--white);
            padding: 40px 20px;
            margin-bottom: 40px;
            position: relative;
            text-align: center;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
        }

        .header h1 {
            margin: 0;
            font-size: 3em;
            font-weight: 800;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .menu-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        .menu-card {
            background: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 20px var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .menu-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px var(--shadow);
        }

        .image-container {
            position: relative;
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .menu-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .menu-card:hover .menu-image {
            transform: scale(1.1);
        }

        .card-content {
            padding: 25px;
            position: relative;
        }

        .item-name {
            font-size: 1.5em;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 15px;
            border-bottom: 3px solid var(--primary);
            padding-bottom: 10px;
            display: inline-block;
        }

        .item-description {
            color: var(--text-light);
            line-height: 1.6;
            margin: 15px 0;
            font-size: 1rem;
            position: relative;
            transition: all 0.3s ease;
            max-height: none;
            overflow: visible;
        }

        .price {
            font-size: 1.8em;
            font-weight: 700;
            color: var(--primary);
            margin: 20px 0;
            display: flex;
            align-items: center;
        }

        .price::before {
            content: '₹';
            font-size: 0.7em;
            margin-right: 5px;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        .availability-badge {
            padding: 8px 16px;
            border-radius: 25px;
            font-size: 0.85em;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--white);
        }

        .available {
            background: var(--success);
            box-shadow: 0 2px 10px rgba(0, 184, 148, 0.3);
        }

        .unavailable {
            background: var(--danger);
            box-shadow: 0 2px 10px rgba(214, 48, 49, 0.3);
        }

        .add-button {
            background: var(--primary);
            color: var(--white);
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.9em;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(33, 147, 176, 0.3);
        }

        .add-button:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(33, 147, 176, 0.4);
        }

        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 60px;
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 10px 20px var(--shadow);
        }

        .empty-state h3 {
            color: var(--primary);
            font-size: 2em;
            margin: 0;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .menu-container {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
                padding: 15px;
            }

            .header h1 {
                font-size: 2.2em;
            }

            .item-name {
                font-size: 1.3em;
            }

            .price {
                font-size: 1.5em;
            }

            .card-content {
                padding: 20px;
            }

            .add-button {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Our Menu</h1>
    </div>

    <div class="menu-container">
        <% 
            List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu menu : menuList) {
        %>
            <div class="menu-card">
                <div class="image-container">
                    <img src="<%= menu.getImagePath() %>" 
                         alt="<%= menu.getName() %>"
                         class="menu-image"
                         onerror="this.src='images/default-food.jpg'">
                </div>
                <div class="card-content">
                    <div class="item-name"><%= menu.getName() %></div>
                    <div class="item-description"><%= menu.getDescription() %></div>
                    <div class="price"><%= menu.getPrice() %></div>
                    <div class="card-footer">
                        <span class="availability-badge <%= menu.getIsAvailable() ? "available" : "unavailable" %>">
                            <%= menu.getIsAvailable() ? "Available" : "Not Available" %>
                        </span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                            <button type="submit" class="add-button">Add to cart</button>
                        </form>
                    </div>
                </div>
            </div>
        <% 
                }
            } else {
        %>
            <div class="empty-state">
                <h3>No menu items available</h3>
            </div>
        <% 
            }
        %>
    </div>
</body>
</html>