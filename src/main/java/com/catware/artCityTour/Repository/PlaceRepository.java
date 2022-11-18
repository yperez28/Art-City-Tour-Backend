package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Place;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PlaceRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Place getPlaceByEvent(Long placeid){
        String placeQuery = "SELECT * FROM place where id = ?";
        PreparedStatement statementPlace;
        try {
            statementPlace = connection.prepareStatement(placeQuery);
            statementPlace.setLong(1, placeid);
            ResultSet placeResult = statementPlace.executeQuery();
            Place place = new Place();
            while (placeResult.next()) {
                place.setId(placeResult.getLong(1));
                place.setName(placeResult.getString(2));
                place.setDetails(placeResult.getString(3));
                place.setImageId(placeResult.getLong(4));
                place.setLatitude(placeResult.getDouble(5));
                place.setLongitude(placeResult.getDouble(6));
            }
            return place;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Place> getPlacesByRoute(Long id){
        try {
            String query = "SELECT * FROM place INNER JOIN placexroute ON placexroute.placeid = place.id WHERE routeid = ?";
            PreparedStatement statement;
            List<Place> resultArray = new ArrayList<>();
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Place place = new Place();
                    place.setId(resultSet.getLong(1));
                    place.setName(resultSet.getString(2));
                    place.setDetails(resultSet.getString(3));
                    place.setImageId(resultSet.getLong(4));
                    place.setLatitude(resultSet.getDouble(5));
                    place.setLongitude(resultSet.getDouble(6));
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

    public int createPlace(String name, String details, Long imageId, Double latitude, Double longitude){
        String query = "INSERT INTO place(name, details, image_id, latitude, longitude)values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, details);
            statement.setLong(3, imageId);
            statement.setDouble(4, latitude);
            statement.setDouble(5, longitude);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int updatePlace(Long placeId, String name, String details, Long imageId, Double latitude, Double longitude){
        String query = "UPDATE place name = ?, details = ?, image_id = ?, latitude = ?, longitude = ? WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, details);
            statement.setLong(3, imageId);
            statement.setDouble(4, latitude);
            statement.setDouble(5, longitude);
            statement.setDouble(6, placeId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Place> getAllPlaces() {
        List<Place> places = new ArrayList<>();
        String placeQuery = "SELECT * FROM place";
        PreparedStatement statementPlace;
        try {
            statementPlace = connection.prepareStatement(placeQuery);
            ResultSet placeResult = statementPlace.executeQuery();
            while (placeResult.next()) {
                Place place = new Place();
                place.setId(placeResult.getLong(1));
                place.setName(placeResult.getString(2));
                place.setDetails(placeResult.getString(3));
                place.setImageId(placeResult.getLong(4));
                place.setLatitude(placeResult.getDouble(5));
                place.setLongitude(placeResult.getDouble(6));
                places.add(place);
            }
            return places;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
