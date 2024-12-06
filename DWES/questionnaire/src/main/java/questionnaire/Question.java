package questionnaire;

import java.util.Iterator;

public class Question {
	private String question;
	private String[] answers;

	public Question(String question, String[] answers) {
		super();
		this.question = question;
		this.answers = answers;
	}

	public String getQuestion() {
		return question;
	}

	public String[] getAnswers() {
		return answers;
	}

	public String toCSV() {
		String toReturn = question + ";";
		toReturn += String.join(";", answers);
		return toReturn;
	}
	
	public String printHTML(int questionId) {
		StringBuilder toReturn = new StringBuilder();
	    toReturn.append("<h3>").append(question).append("</h3>\n");
	    
	    for (int i = 0; i < answers.length; i++) {
	        String displayAnswer = answers[i].replace("#", "");
	        String answerId = "question_" + questionId + "_answer_" + (i + 1); // Assuming questionId is unique
	        
	        toReturn.append("<input type='radio' name='question_" + questionId + "' id='").append(answerId)
	                .append("' value='").append(answers[i]).append("' required>\n");
	        toReturn.append("<label for='").append(answerId).append("'>").append(displayAnswer).append("</label>\n");
	        toReturn.append("<br>");
	    }
	    return toReturn.toString();
	}
	
	public boolean isCorrect(String userAnswer) {
		return (userAnswer.charAt(0) == '#');
	}

	public static Question fromCSV(String line) {
		// Divide the question and each answer
		String[] data = line.split(";");
        
		// Store the question
		String question = data[0];
		
		// Store the answers
		String[] answers = new String[4];
		for (int i = 1; i <= 4; i++) {
			answers[i-1] = data[i];
		}
		
		// Return a question object
		return new Question(question, answers);
	}
}
