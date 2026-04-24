package com.linguados.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {

    // No Docker Compose, o nome do serviço é "linguados-db"
    private static final String HOST = System.getenv("DB_HOST") != null
            ? System.getenv("DB_HOST")
            : "linguados-db";

    private static final String PORT = System.getenv("DB_PORT") != null
            ? System.getenv("DB_PORT")
            : "3306";

    private static final String DB_NAME = "linguados";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME
            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    public static Connection getConnection() throws SQLException {
        try {
            // Em ambientes Tomcat, forçar o carregamento do driver é uma boa prática
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver MySQL não encontrado no classpath do Tomcat.", e);
        }
    }
}