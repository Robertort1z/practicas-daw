package questionnaire;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class AccessData {
	
	// Method to write a new question into the CSV file
    public static void writeQuestionToFile(Question newQuestion) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("questionnaire.csv", true))) {
            writer.write(newQuestion.toCSV());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // Load all questions from CSV into an array
    public static ArrayList<Question> loadQuestionsFromFile() {
    	ArrayList<Question> questionnaire = new ArrayList<Question>();

        try (BufferedReader reader = new BufferedReader(new FileReader("questionnaire.csv"))) {
            String line;
            while ((line = reader.readLine()) != null) { //Update the line and check is not null
                Question question = Question.fromCSV(line);
                questionnaire.add(question);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return questionnaire;
    }
}
