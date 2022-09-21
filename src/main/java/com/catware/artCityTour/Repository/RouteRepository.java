package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Membership;
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
            String query = "SELECT * FROM ruta";
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
        String query = "SELECT * FROM ruta WHERE \"ID\"=?";
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

    public List<Place> getPlacesByRoute(Long id){
        try {
            String query = "SELECT lugarid, lugar.nombre ,lugar.detalles , lugar.imagen FROM lugarxruta INNER JOIN lugar ON lugarxruta.lugarid = lugar.\"ID\" WHERE rutaid = ?";
            PreparedStatement statement;
            List<Place> resultArray = new ArrayList<>();
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Place place = new Place();
                    place.setId(resultSet.getLong(1));
                    place.setNombre(resultSet.getString(2));
                    place.setDetalles(resultSet.getString(3));
                    place.setImagen(resultSet.getString(4));
                    resultArray.add(place);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return resultArray;
        }catch (EmptyResultDataAccessException e){
            return new ArrayList<>();
        }
    }
}
