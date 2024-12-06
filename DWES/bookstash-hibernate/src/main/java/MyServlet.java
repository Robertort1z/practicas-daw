import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.bookstash.data.Product;
import com.bookstash.data.AccessData;

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
		
		switch(action) {
			case "addProduct": {
				// Create the new product
				String name = request.getParameter("product-name");
				int price = Integer.parseInt(request.getParameter("product-price"));
				String imageSrc = request.getParameter("product-image");
				int stock = Integer.parseInt(request.getParameter("product-stock"));
				Product newProduct = new Product(name, price, imageSrc, stock);
				
				AccessData.addProductToDB(newProduct);
				
				response.sendRedirect("index.jsp");
				break;
			}
			case "viewProducts": {
                // Get products from DB.
                List<Product> productList = AccessData.getAllProducts();
                
                // Send products to JSP.
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("viewProducts.jsp").forward(request, response);
                break;
            }
			case "buyProduct": {
				int productId = Integer.parseInt(request.getParameter("productId"));
				
				// Decrease stock in the database
				AccessData.reduceStockByOne(productId);
				
				// Redirect to view updated product list
		        response.sendRedirect("MyServlet?action=viewProducts");
				break;
			}
			case "returnHome": {
				response.sendRedirect("index.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
