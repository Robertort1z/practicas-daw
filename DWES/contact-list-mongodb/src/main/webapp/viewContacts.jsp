<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="contactList.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact List</title>
    <style>
        /* Reset and general styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #fff5e1; /* Light orange background */
            color: #333;
            padding: 20px;
            line-height: 1.6;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        /* Header row styling */
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f2a50b; /* Light orange background for header */
            color: white;
            font-weight: bold;
            text-align: center;
            font-size: 18px;
        }

        /* Zebra striping */
        table tr:nth-child(even) {
            background-color: #fffaf0;
        }

        table tr:nth-child(odd) {
            background-color: #ffffff;
        }

        table tr:hover {
            background-color: #fde4b2; /* Subtle hover effect */
        }

        /* Responsive design */
        @media screen and (max-width: 600px) {
            table, tr, td {
                display: block;
                width: 100%;
            }
            tr {
                margin-bottom: 10px;
            }
            table th {
                display: none; /* Hide headers for mobile */
            }
            table td {
                border: none;
                border-bottom: 1px solid #ddd;
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            table td:before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                width: calc(50% - 20px);
                white-space: nowrap;
                text-align: left;
                font-weight: bold;
            }
        }

        /* Button styling */
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f2a50b; /* Matching the table header color */
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .back-button:hover {
            background-color: #e29500;
        }
    </style>
</head>
<body>
    <%
        ArrayList<Contact> contactList = (ArrayList<Contact>) request.getAttribute("contactList");

        if (contactList != null) {
            // Display contact list
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr><th>Name</th><th>Phone Number</th></tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (Contact contact : contactList) {
                out.println("<tr>");
                out.println("<td data-label='Name'>" + contact.getName() + "</td>");
                out.println("<td data-label='Phone Number'>" + contact.getPhoneNumber() + "</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else {
            out.println("<p>No contacts found.</p>");
        }
    %>

    <!-- Back to Home Button -->
    <form action="MyServlet" method="get">
    	<input type="hidden" name="action" value="home">
        <button class="back-button" type="submit">Home</button>
    </form>
</body>
</html>
