<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questionnaire</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center content horizontally */
        }
        h1 {
            color: #333;
            font-size: 24px; /* Responsive font size */
        }
        h3 {
            color: #555;
            font-size: 20px; /* Responsive font size */
            text-align: center; /* Center text for better mobile layout */
        }
        form {
            margin: 10px 0; /* Spacing between forms */
            width: 100%; /* Full width for forms on mobile */
            max-width: 400px; /* Limit width on larger screens */
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 15px; /* Increased padding for better tap area */
            cursor: pointer;
            font-size: 18px; /* Responsive font size */
            width: 100%; /* Full width for buttons */
            border-radius: 5px; /* Rounded corners for buttons */
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Welcome to my questionnaire!</h1>
    <h3>What do you wish to do?</h3>
    <form action="MyServlet" method="get">
        <input type="hidden" name="action" value="addQuestion">
        <input type="submit" value="Add question">
    </form>
    <form action="MyServlet" method="get">
        <input type="hidden" name="action" value="doQuestionnaire">
        <input type="submit" value="Do questionnaire">
    </form>
</body>
</html>