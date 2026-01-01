package com.student.util;

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Dotenv dotenv = null;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver loaded successfully.");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("MySQL JDBC Driver not found on classpath: " + e.getMessage());
        }

        try {
            dotenv = Dotenv.configure()
                    .directory("/")
                    .filename(".env")
                    .ignoreIfMalformed()
                    .ignoreIfMissing()
                    .load();

            if (dotenv != null) {
                System.out.println(".env file loaded successfully from classpath.");
            }
        } catch (Exception e) {
            System.err.println("Warning: Could not load .env file: " + e.getMessage());
            System.err.println("Falling back to system environment variables, JVM properties, or defaults.");
            dotenv = null;
        }
    }

    public static Connection getConnection() throws SQLException {
        String url = getEnvVar("DB_URL", "jdbc:mysql://localhost:3306/student_registration");
        String user = getEnvVar("DB_USER", "root");
        String pass = getEnvVar("DB_PASSWORD", "");

        System.out.println("Attempting DB connection to: " + url + " as user: " + user);

        return DriverManager.getConnection(url, user, pass);
    }

    private static String getEnvVar(String key, String defaultValue) {
        String value = null;

        if (dotenv != null) {
            value = dotenv.get(key);
        }

        if (isEmpty(value)) {
            value = System.getenv(key);
        }

        if (isEmpty(value)) {
            value = System.getProperty(key);
        }

        return isEmpty(value) ? defaultValue : value;
    }

    private static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}