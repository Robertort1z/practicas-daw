<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert New Contact</title>
<style>
	/* General body styling */
	body {
    	font-family: Arial, sans-serif;
    	background-color: #FFF5E1; /* Light orange background */
    	color: #333;
    	margin: 20px;
    	padding: 0;
    	line-height: 1.6;
	}

	/* Styling the form */
	form {
    	background-color: #fff;
    	border: 1px solid #f2b879; /* Light orange border */
    	border-radius: 5px;
    	padding: 20px;
    	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    	max-width: 400px;
    	margin: 0 auto;
	}

	/* Label styling */
	label {
    	display: block;
    	margin-bottom: 5px;
    	font-weight: bold;
    	color: #f2a50b; /* Light orange text for labels */
	}

	/* Input field styling */
	input[type="text"],
	input[type="submit"] {
    	width: 100%;
    	padding: 10px;
    	margin-bottom: 15px;
    	border: 1px solid #f2b879; /* Light orange border */
    	border-radius: 4px;
    	box-sizing: border-box;
    	font-size: 14px;
	}

	/* Submit button styling */
	input[type="submit"] {
    	background-color: #f2a50b; /* Light orange button */
    	color: white;
    	border: none;
    	cursor: pointer;
    	transition: background-color 0.3s ease;
	}

	input[type="submit"]:hover {
    	background-color: #e89507; /* Darker shade of orange for hover */
	}

	/* Link styling */
	a {
    	display: block;
    	text-align: center;
    	margin: 20px 0;
    	text-decoration: none;
    	color: #f2a50b; /* Light orange link color */
    	font-weight: bold;
	}

	a:hover {
    	color: #e89507; /* Darker orange on hover */
	}

	/* Media query for responsive design */
	@media (max-width: 600px) {
	    form {
        	padding: 15px;
    	}

    	input[type="text"],
    	input[type="submit"] {
        	font-size: 12px;
    	}
	}
</style>
</head>
<body>
	<form action="MyServlet" method="post">
		<label for="name">Name:</label>
		<input type="text" placeholder="Contact name" name="name" id="name" required>
		<br>
		<label for="phoneNumber">Phone number:</label>
		<input type="text" placeholder="Contact number" name="phoneNumber" id="phoneNumber" required>
		<br><br>
		<input type="submit" value="Save contact">
	</form>
	<br> <!-- ---------------------------------- -->
	<a href="MyServlet?action=list">List</a>
	<br><br> <!-- ----------------------------- -->
	<form action="MyServlet" method="get">
		<input type="hidden" name="action" value="search">
		<input type="text" placeholder="Search contact" name="searchItem">
		<input type="submit" value="Search">
	</form>
</body>
</html>