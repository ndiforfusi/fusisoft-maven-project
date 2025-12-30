package com.mt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DatabaseConnection {

    private DatabaseConnection() {
    }

    private static String getEnvOrProp(String key) {
        String v = System.getenv(key);
        if (v == null || v.trim().isEmpty()) {
            v = System.getProperty(key);
        }
        return (v == null || v.trim().isEmpty()) ? null : v.trim();
    }

    public static Connection getConnection() throws SQLException {
        String url = getEnvOrProp("DB_URL");
        String user = getEnvOrProp("DB_USER");
        String password = getEnvOrProp("DB_PASSWORD");

        if (url == null || user == null || password == null) {
            throw new IllegalStateException(
                    "Database credentials not set. Required: DB_URL, DB_USER, DB_PASSWORD (env or -D properties).");
        }

        return DriverManager.getConnection(url, user, password);
    }
}
