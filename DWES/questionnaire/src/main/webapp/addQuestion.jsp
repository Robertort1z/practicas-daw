<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add question</title>
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
        h2 {
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
        input[type="text"] {
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: calc(100% - 22px); /* Full width minus padding and border */
        }
        .answer-option {
            display: flex;
            align-items: center; /* Align radio buttons and text vertically */
            margin: 10px 0; /* Space between answer options */
        }
        input[type="radio"] {
            margin-right: 10px; /* Space between radio button and text field */
            flex-shrink: 0; /* Prevent radio buttons from shrinking */
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px; /* Increased padding for better tap area */
            width: 100%; /* Full width for button */
            font-size: 18px; /* Responsive font size */
            border-radius: 4px; /* Rounded corners for buttons */
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        @media (max-width: 600px) {
            body {
                padding: 10px; /* Reduced padding for smaller screens */
            }
            h2 {
                font-size: 20px; /* Smaller font size for smaller devices */
            }
        }
    </style>
</head>
<body>
    <h2>Please, insert the question you wish to add</h2>
    <form action="MyServlet?action=addQuestionToFile" method="post">
        <label for="question">Your question:</label>
        <input type="text" placeholder="Am I tall?" name="question" required>
        
        <div class="answer-option">
            <input type="radio" name="correctAnswer" value="answer1" required>
            <input type="text" name="answer1" placeholder="Answer 1" required>
        </div>
        <div class="answer-option">
            <input type="radio" name="correctAnswer" value="answer2" required>
            <input type="text" name="answer2" placeholder="Answer 2" required>
        </div>
        <div class="answer-option">
            <input type="radio" name="correctAnswer" value="answer3" required>
            <input type="text" name="answer3" placeholder="Answer 3" required>
        </div>
        <div class="answer-option">
            <input type="radio" name="correctAnswer" value="answer4" required>
            <input type="text" name="answer4" placeholder="Answer 4" required>
        </div>
        
        <input type="submit" value="Send">
    </form>
</body>
</html>
