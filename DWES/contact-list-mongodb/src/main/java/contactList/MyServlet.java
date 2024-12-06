package contactList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		switch (action) {
        	case "list": {
        		ArrayList<Contact> contactList = AccessData.loadContacts();
        		
        		request.setAttribute("contactList", contactList);
        		request.getRequestDispatcher("viewContacts.jsp").forward(request, response);
        		break;
        	}
        	case "search": {
        		String data = request.getParameter("searchItem");
        		ArrayList<Contact> contactList = AccessData.getMatchingContacts(data);
        		request.setAttribute("contactList", contactList);
        		request.getRequestDispatcher("viewContacts.jsp").forward(request, response);
        		break;
        	}
        	case "home": {
        		response.sendRedirect("index.jsp");
        		break;
        	}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		
		// Create new contact
		Contact newContact = new Contact(name, phoneNumber);
		
		// Add contact to DB
		AccessData.insertContact(newContact);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
