package com.empresa.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mariadb://localhost:3306/empresa";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() throws SQLException {
        try {
            // Carga el controlador JDBC de MariaDB
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el controlador de MariaDB", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
