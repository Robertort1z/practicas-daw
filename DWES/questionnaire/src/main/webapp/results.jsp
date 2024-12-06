<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag for responsive design -->
    <title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 10px; /* Reduced padding for mobile-first */
        }
        p {
            font-size: 18px; /* Default font size for paragraphs */
            color: #333;
        }
        input[type="submit"] {
            width: 100%; /* Full width for mobile */
            background-color: #28a745; /* Button background color */
            color: white; /* Button text color */
            border: none; /* No border */
            padding: 10px; /* Uniform padding */
            cursor: pointer; /* Pointer cursor on hover */
            font-size: 16px; /* Default font size for button */
            border-radius: 4px; /* Rounded corners */
        }
        input[type="submit"]:hover {
            background-color: #218838; /* Darker shade on hover */
        }

        /* Styles for larger screens */
        @media (min-width: 600px) {
            body {
                padding: 20px; /* Increased padding for larger screens */
            }
            input[type="submit"] {
                width: auto; /* Allow button to size based on content */
                padding: 10px 20px; /* Different padding for larger screens */
            }
        }
    </style>
</head>
<body>
    <%
    int score = (int) session.getAttribute("score");
    int highestScore = (int) getServletContext().getAttribute("highestScore");
    String highestScoreUser = (String) getServletContext().getAttribute("highestScoreUser");

    out.print("<p>You have answered " + score + " questions correctly.</p>");
    out.print("<p>The highest score is from " + highestScoreUser + ", who achieved " 
        + highestScore + " correct answers.</p>");
    %>
    <form action="MyServlet" method="get">
        <input type="hidden" name="action" value="homePage">
        <input type="submit" value="Go back to home page">
    </form>
</body>
</html>
