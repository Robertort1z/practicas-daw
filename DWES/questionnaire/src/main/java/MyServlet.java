

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import questionnaire.AccessData;
import questionnaire.Question;

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
			case "addQuestion": {
				response.sendRedirect("addQuestion.jsp");
				break;
			}
			case "doQuestionnaire": {
				// Load questionnaire (ArrayList of questions) and send it
				ArrayList<Question> questionnaire = AccessData.loadContactsFromFile();
				
				// Set attribute and redirect to the actual questionnaire
				getServletContext().setAttribute("questionnaire", questionnaire);
				response.sendRedirect("doQuestionnaire.jsp");
				break;
			}
			case "correctQuestionnaire": {
				if (getServletContext().getAttribute("highestScore") == null) {
					getServletContext().setAttribute("highestScore", 0); // Default to 0 if not set
				    getServletContext().setAttribute("highestScoreUser", "John Doe");
				}
				
				ArrayList<Question> questionnaire = (ArrayList<Question>) getServletContext().getAttribute("questionnaire");
				
			    int score = 0; // To keep track of correct answers
			    if (questionnaire != null) {
			        for (int i = 0; i < questionnaire.size(); i++) {
			            String submittedAnswer = request.getParameter("question_" + i);
			            if (questionnaire.get(i).isCorrect(submittedAnswer)) {
			                score++; // Increment score for correct answer
			            }
			        }
			    }
			    
			    HttpSession session = request.getSession();
			    session.setAttribute("score", score);
			    
			    if ((Integer)getServletContext().getAttribute("highestScore") < score) {
			    	getServletContext().setAttribute("highestScore", score);
			    	getServletContext().setAttribute("highestScoreUser", request.getParameter("username"));
			    }
			    
			    response.sendRedirect("results.jsp");
			    break;
			}
			case "addQuestionToFile": {
				// Load the question
				String question = request.getParameter("question");
				question = cleanUpString(question);
				
				// Load the correct answer
				String correctAnswer = request.getParameter("correctAnswer");
				
				// Load the answers
				String answer1 = request.getParameter("answer1");
				String answer2 = request.getParameter("answer2");
				String answer3 = request.getParameter("answer3");
				String answer4 = request.getParameter("answer4");
				
				// Method to clean up answers
			    answer1 = cleanUpString(answer1);
			    answer2 = cleanUpString(answer2);
			    answer3 = cleanUpString(answer3);
			    answer4 = cleanUpString(answer4);
				
				// Depending on the correct answer, we modify it
				switch (correctAnswer) {
		        	case "answer1":
		        		answer1 = "#" + answer1;
		        		break;
		        	case "answer2":
		        		answer2 = "#" + answer2;
		        		break;
		        	case "answer3":
		        		answer3 = "#" + answer3;
		        		break;
		        	case "answer4":
		        		answer4 = "#" + answer4;
		        		break;
				}
				
				// Create an array with the answers
				String[] answers = {answer1, answer2, answer3, answer4};
				
				// Create new question
				Question newQuestion = new Question(question, answers);
				
				// Save the new question in the CSV file
				AccessData.writeContactToFile(newQuestion);
				
				// Redirect to home page
				response.sendRedirect("index.jsp");
				break;
			}
			case "homePage": {
				// Redirect to home page
				response.sendRedirect("index.jsp");
				break;
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
	
	// Method to clean up answers and questions
	private String cleanUpString(String data) {
	    // Remove leading '#' characters
	    while (data.startsWith("#")) {
	        data = data.substring(1);
	    }
	    
	    // Remove all occurrences of ';' characters
	    data = data.replace(";", "");
	    
	    // Trim the answer again to ensure no leading/trailing spaces
	    data = data.trim();

	    // If the answer is empty after cleanup, replace it with a placeholder
	    if (data.isEmpty()) {
	        return "Whoever did this question is stupid";
	    }

	    return data; // Return cleaned answer
	}
}
