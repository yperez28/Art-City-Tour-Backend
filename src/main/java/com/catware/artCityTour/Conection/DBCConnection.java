package com.catware.artCityTour.Conection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static com.catware.artCityTour.Constants.Constants.*;

public class DBCConnection {
    private static Connection connection;

    public static Connection getConnection() {
        if (connection != null) {
            return connection;
        }
        String dbURL = DB_URL;
        String userName = DB_USERNAME;
        String password = DB_PASSWORD;
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(dbURL, userName, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }
}
