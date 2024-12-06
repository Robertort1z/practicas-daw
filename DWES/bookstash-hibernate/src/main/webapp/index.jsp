<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookStash</title>
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
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 10px;
        }

        h1 {
            text-align: center;
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 30px;
            margin-bottom: 20px;
        }

        label {
            font-size: 0.9rem;
            color: #555;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Responsive Design */
        @media (min-width: 600px) {
        	body {
        		display: flex;
        		flex-direction: row;
        	}
        
            .form-container {
                padding: 30px;
            }

            h1 {
                font-size: 2rem;
            }

            input[type="text"],
            input[type="number"] {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>BookStash - Add Product</h1>
        <form action="MyServlet" method="get">
            <input type="hidden" name="action" value="addProduct">
            <label for="product-name">Name:</label>
            <input type="text" placeholder="The Way of Kings" name="product-name" required>
            
            <label for="product-price">Price:</label>
            <input type="number" name="product-price" required>
            
            <label for="product-image">Image source:</label>
            <input type="text" placeholder="Images/..." name="product-image" required>
            
            <label for="product-stock">Stock:</label>
            <input type="number" name="product-stock" required>
            
            <input type="submit" value="Add Product">
        </form>
    </div>

    <div class="form-container">
        <form action="MyServlet" method="get">
            <input type="hidden" name="action" value="viewProducts">
            <input type="submit" value="View Products">
        </form>
    </div>
</body>
</html>
