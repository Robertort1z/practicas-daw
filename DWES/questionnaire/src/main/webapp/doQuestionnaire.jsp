<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="questionnaire.Question" %>
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
            text-align: center; /* Center heading text */
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: 100%; /* Full width for form on mobile */
            max-width: 500px; /* Limit width on larger screens */
        }
        input[type="text"], input[type="submit"] {
            box-sizing: border-box; /* Include padding and border in width */
            width: 100%; /* Full width to ensure they are the same */
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px; /* Responsive font size */
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        @media (max-width: 600px) {
            body {
                padding: 10px; /* Reduced padding for smaller screens */
            }
            h1 {
                font-size: 20px; /* Smaller font size for smaller devices */
            }
        }
    </style>
</head>
<body>
    <h1>Will you be able to complete it?</h1>
    <form action="MyServlet?action=correctQuestionnaire" method="post">
        <%
        ArrayList<Question> questionnaire = (ArrayList<Question>) application.getAttribute("questionnaire");
        if (questionnaire != null) {
            for (int i = 0; i < questionnaire.size(); i++) {
                // Retrieve the question HTML and print it
                String questionHTML = questionnaire.get(i).printHTML(i);
                out.print(questionHTML);
            }
        }
        %>
        <br>
        <label for="username">What is your name?: </label>
        <input type="text" id="username" placeholder="John Doe" name="username" required>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
