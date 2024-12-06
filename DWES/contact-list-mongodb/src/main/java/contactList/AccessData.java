package contactList;

import java.util.ArrayList;
import org.bson.Document;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import com.mongodb.client.*;
import org.bson.Document;
import com.mongodb.client.model.Filters;
import java.util.ArrayList;

public class AccessData {
    // MongoDB URI - Make this static so it can be used in static contexts
    static String mongoUri = System.getenv("MONGODB_URI");
    
    // Optionally use localhost if the environment variable is not set
    static {
        if (mongoUri == null) {
            mongoUri = "mongodb://localhost:27017";
        }
    }
    
    // MongoDB client and collection initialization
    static MongoClient m = MongoClients.create(mongoUri);
    static MongoDatabase bd = m.getDatabase("contactlist"); // "contactlist" database
    static MongoCollection<Document> collection = bd.getCollection("contactlist");

    public static ArrayList<Contact> loadContacts() {
        ArrayList<Contact> contacts = new ArrayList<>();
        FindIterable<Document> contactList = collection.find();
        MongoCursor<Document> c = contactList.iterator();

        while (c.hasNext()) {
            Document d = c.next();
            String name = d.getString("name");
            String phoneNumber = d.getString("phoneNumber");
            Contact contact = new Contact(name, phoneNumber);
            contacts.add(contact);
        }
        return contacts;
    }
    
    public static ArrayList<Contact> getMatchingContacts(String data) {
        ArrayList<Contact> contacts = new ArrayList<>();

        // Create a regular expression for partial matching
        FindIterable<Document> contactList = collection.find(Filters.regex("name", data, "i"));

        // Use the iterator to loop through the matching documents
        MongoCursor<Document> c = contactList.iterator();

        while (c.hasNext()) {
            Document d = c.next();
            String name = d.getString("name");
            String phoneNumber = d.getString("phoneNumber");
            Contact contact = new Contact(name, phoneNumber);
            contacts.add(contact);
        }

        return contacts;
    }

    public static void insertContact(Contact c) {
        Document doc = new Document();
        doc.put("name", c.getName());
        doc.put("phoneNumber", c.getPhoneNumber());
        collection.insertOne(doc);
    }
}