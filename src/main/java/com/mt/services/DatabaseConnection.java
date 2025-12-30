package com.mt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DatabaseConnection {

    private static final String DB_URL;
    private static final String DB_USER;
    private static final String DB_PASSWORD;

    static {
        DB_URL = System.getenv("DB_URL");
        DB_USER = System.getenv("DB_USER");
        DB_PASSWORD = System.getenv("DB_PASSWORD");

        if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
            throw new IllegalStateException(
                    "Missing database environment variables. " +
                            "Required: DB_URL, DB_USER, DB_PASSWORD");
        }

        try {
            // Load JDBC driver explicitly (safe for older Tomcat / WAR deployments)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Change driver if using PostgreSQL or others
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBC Driver not found on classpath", e);
        }
    }

    private DatabaseConnection() {
        // Prevent instantiation
    }

    /**
     * Returns a new JDBC Connection.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Optional health check
     */
    public static boolean isDatabaseUp() {
        try (Connection conn = getConnection()) {
            return conn != null && conn.isValid(2);
        } catch (SQLException e) {
            return false;
        }
    }
}

