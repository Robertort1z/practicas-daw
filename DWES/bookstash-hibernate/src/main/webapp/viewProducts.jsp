<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookstash.data.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Products - BookStash</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 10px;
        }

        .container {
            max-width: 1200px; /* Maximum width of the container */
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .product-list {
            display: flex;
            flex-direction: column; /* Stack on mobile */
            gap: 15px; /* Space between products */
        }

        .product-item {
            display: flex;
            align-items: center; /* Center items vertically */
            justify-content: space-between; /* Space between image and buy button */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fefefe;
        }

        .product-item img {
            width: 50px;
            height: auto; /* Maintain aspect ratio */
            margin-right: 15px; /* Space between image and text */
        }

        .product-info {
            flex: 1; /* Allow the product info to take available space */
        }

        form {
            margin: 0; /* Remove default margin from form */
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Additional button for returning home */
        .return-home {
            text-align: center; /* Center the return home button */
            margin-top: 20px; /* Space above the button */
        }

        /* Responsive Design */
        @media (min-width: 600px) {
            .product-list {
                flex-direction: row; /* Arrange products in a row on larger screens */
                flex-wrap: wrap; /* Allow wrapping */
                justify-content: space-around; /* Space out products evenly */
            }

            .product-item {
                width: 45%; /* Limit item width for larger screens */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Available Products</h2>
        <div class="product-list">
            <%
                // Get the product list from the Servlet
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>
                <div class="product-item">
                    <img src="<%= product.getImageSrc() %>" alt="<%= product.getName() %>">
                    <div class="product-info">
                        <strong><%= product.getName() %></strong> - $<%= product.getPrice() %> 
                        (Stock: <%= product.getStock() %>)
                    </div>
                    <form action="MyServlet" method="get">
                        <input type="hidden" name="action" value="buyProduct">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="submit" value="Buy">
                    </form>
                </div>
            <%
                    }
                } else {
            %>
                <p style="text-align: center;">No products available.</p>
            <%
                }
            %>
        </div>

        <!-- Button to return home -->
        <div class="return-home">
            <form action="MyServlet" method="get">
                <input type="hidden" name="action" value="returnHome">
                <input type="submit" value="Return Home">
            </form>
        </div>
    </div>
</body>
</html>
