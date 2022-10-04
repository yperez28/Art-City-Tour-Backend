package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Place;
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
                    route.setNombre(resultSet.getString(2));
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
                route.setNombre(resultSet.getString(2));
            }
            return route;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
