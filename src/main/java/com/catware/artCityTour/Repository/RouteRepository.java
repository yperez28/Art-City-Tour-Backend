package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Route;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RouteRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Route> getAll(){
        try {
            String query = "SELECT * FROM route";
            PreparedStatement statement;
            List<Route> resultArray = new ArrayList<>();
            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Route route = new Route();
                    route.setId(resultSet.getLong(1));
                    route.setName(resultSet.getString(2));
                    resultArray.add(route);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return resultArray;
        }catch (EmptyResultDataAccessException e){
            return new ArrayList<>();
        }
    }

    public Route getRouteById(Long id){
        String query = "SELECT * FROM route WHERE id =?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Route route = new Route();
            while(resultSet.next()) {
                route.setId(resultSet.getLong(1));
                route.setName(resultSet.getString(2));
            }
            return route;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Route saveRoute(String name) {
        try {
            String query = "INSERT INTO route (name) VALUES (?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.executeUpdate();

            Route route = new Route();
            route.setName(name);

            return route;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Route updateRoute(String name, Long id) {
        try {
            String query = "UPDATE route SET name=? WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setLong(2, id);
            statement.executeUpdate();

            Route route = new Route();
            route.setId(id);
            route.setName(name);

            return route;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteRoute(Long id) {
        try {
            String placeQuery = "DELETE FROM placexroute WHERE routeid=?";
            String mainQuery = "DELETE FROM route WHERE id=?";
            PreparedStatement placeStatement = connection.prepareStatement(placeQuery);
            PreparedStatement mainStatement = connection.prepareStatement(mainQuery);

            placeStatement.setLong(1, id);
            mainStatement.setLong(1, id);

            placeStatement.executeUpdate();
            Integer result = mainStatement.executeUpdate();
            connection.close();

            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
