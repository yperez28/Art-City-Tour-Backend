package com.catware.artCityTour.Conection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCConnection {

    private static Connection connection;

    public static Connection getConnection(){
        if (connection != null){
            return connection;
        }
        String dbURL = "jdbc:postgresql://localhost:5432/ACTMainDB";
        String userName = "postgres";
        String password = "manchas";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(dbURL, userName, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }
}
