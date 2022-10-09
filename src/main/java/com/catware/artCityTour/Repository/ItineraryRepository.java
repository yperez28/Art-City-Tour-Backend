package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Itinerary;
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
            String query = "SELECT * FROM itinerary";
            List<Itinerary> itineraries = new ArrayList<>();
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Itinerary itinerary = new Itinerary();
                    itinerary.setId(resultSet.getLong(1));
                    itinerary.setUserId(resultSet.getLong(2));
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

    public Integer saveItinerary(Long userId) {
        try {
            String query = "INSERT INTO itinerary(userid) VALUES (?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, userId);

            int result = statement.executeUpdate();
            Itinerary itinerary = new Itinerary();
            if (result > 0) {
                itinerary.setUserId(userId);
            }

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer updateItinerary(Long id, Long userId) {
        try {
            String query = "UPDATE itinerary SET userid=? WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, userId);
            statement.setLong(2, id);

            int result = statement.executeUpdate();
            Itinerary itinerary = new Itinerary();
            if (result > 0) {
                itinerary.setId(id);
                itinerary.setUserId(userId);
            }

            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteItinerary(Long id) {
        try {
            String eventQuery = "DELETE FROM eventxitinerary WHERE itineraryid = ?";
            String mainQuery = "DELETE FROM itinerary WHERE id = ?";
            PreparedStatement eventStatement = connection.prepareStatement(eventQuery);
            PreparedStatement mainStatement = connection.prepareStatement(mainQuery);

            eventStatement.setLong(1, id);
            mainStatement.setLong(1, id);
            eventStatement.executeUpdate();

            Integer result = mainStatement.executeUpdate();
            connection.close();

            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Itinerary getItineraryById(Long id) {
        String query = "SELECT * FROM itinerary WHERE id = ?";
        Itinerary itinerary = new Itinerary();
        try {
            PreparedStatement statement;
            statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                itinerary.setId(resultSet.getLong(1));
                itinerary.setUserId(resultSet.getLong(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itinerary;
    }

    public List<Itinerary> getItineraryByUserId(Long userId) {
        try {
            String query = "SELECT * FROM itinerary WHERE userid = ?";
            List<Itinerary> itineraries = new ArrayList<>();

            try {
                PreparedStatement statement;
                statement = connection.prepareStatement(query);
                statement.setLong(1, userId);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Itinerary itinerary = new Itinerary();
                    itinerary.setId(resultSet.getLong(1));
                    itinerary.setUserId(resultSet.getLong(2));
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
}