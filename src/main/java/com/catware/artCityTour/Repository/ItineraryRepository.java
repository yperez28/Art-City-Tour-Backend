package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Event;
import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ItineraryRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Itinerary> getAll() {
        try {
            String query = "SELECT ";
            List<Itinerary> itineraries = new ArrayList<>();
            PreparedStatement statement;

            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Itinerary itinerary = new Itinerary();


                    itineraries.add(itinerary);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return itineraries;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Itinerary saveItinerary(Long id, Long userId) {
        try {
            String query = "INSERT INTO \"Itinerario\" VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            statement.setLong(2, id);

            Integer result = statement.executeUpdate();
            Itinerary itinerary = new Itinerary();
            if (result > 0) {
                 itinerary.setId(id);
                 itinerary.setUserId(userId);
            }

            return itinerary;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Itinerary updateItinerary(Long id, Long userId) {
        try {
            String query = "UPDATE \"Itinerario\" SET usuarioid=? WHERE \"ID\"=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, userId);
            statement.setLong(2, id);

            Integer result = statement.executeUpdate();
            Itinerary itinerary = new Itinerary();
            if (result > 0) {
                itinerary.setId(id);
                itinerary.setUserId(userId);
            }

            return itinerary;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteItinerary(Long id) {
        try {
            String query = "DELETE FROM \"Itinerario\" WHERE \"ID\" = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);

            Integer result = statement.executeUpdate();
            connection.close();

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Itinerary getItineraryById(Long id) {
        String query = "SELECT ";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Itinerary itinerary = new Itinerary();

            while(resultSet.next()) {

            }

            return itinerary;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
