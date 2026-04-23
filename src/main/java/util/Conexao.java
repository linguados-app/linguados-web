package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(
                "jdbc:mysql://db:3306/login_db",
                "root",
                "root"
        );
    }
}