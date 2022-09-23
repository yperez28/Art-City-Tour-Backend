package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Place;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class PlaceRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Place getPlaceByEvent(Long placeid){
        String placeQuery = "SELECT * FROM lugar where \"ID\" = ?";
        PreparedStatement statementPlace;
        try {
            statementPlace = connection.prepareStatement(placeQuery);
            statementPlace.setLong(1, placeid);
            ResultSet placeResult = statementPlace.executeQuery();
            Place place = new Place();
            while (placeResult.next()) {
                place.setId(placeResult.getLong(1));
                place.setNombre(placeResult.getString(2));
                place.setDetalles(placeResult.getString(3));
                place.setImagen(placeResult.getString(4));
            }
            return place;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
