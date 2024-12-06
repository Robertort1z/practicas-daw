package com.bookstash.data;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

public class AccessData {
    
    private static StandardServiceRegistry registry = null;
    private static SessionFactory sessionFactory = null;

    // Method to open connection and create SessionFactory just once
    public static void openConnection() {
        if (sessionFactory == null) {
            try {
                // Create configuration registry and SessionFactory just once
                registry = new StandardServiceRegistryBuilder().configure().build();
                sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry);
                }
            }
        }
    }

    // Method to add a product to the database
    public static void addProductToDB(Product newProduct) {
        openConnection();  // Ensure sessionFactory is open
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(newProduct); // Save the new product
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback on error
            }
            e.printStackTrace();
        }
    }
    
    public static void reduceStockByOne(int productId) {
        openConnection();
        Transaction transaction = null;
        
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            
            // Retrieve the product by its name with parameterized query
            Query<Product> query = session.createQuery("FROM Product WHERE id = :productId", Product.class);
            query.setParameter("productId", productId);
            Product product = query.uniqueResult();  // Retrieve a single product
            
            // Check if product exists and has stock greater than 0
            if (product != null && product.getStock() > 0) {
                // Decrease stock by 1
                product.reduceStockByOne();
                session.merge(product);  // Update product in the database
            }
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback on error
            }
            e.printStackTrace();
        }
    }
    
    // Method to retrieve all products from the database
    public static List<Product> getAllProducts() {
        openConnection();  // Ensure sessionFactory is open
        List<Product> products = null;
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            // Corrected the query to reference the entity name
            Query<Product> query = session.createQuery("FROM Product", Product.class);
            products = query.getResultList(); // Retrieve the product list
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();  // Rollback on error
            }
            e.printStackTrace();
        }
        return products; // Return the list of products
    }

    // Method to close connection when the application ends
    public static void closeConnection() {
        if (sessionFactory != null) {
            sessionFactory.close(); // Close SessionFactory
        }
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry); // Destroy the registry
        }
    }
}
