package com.catware.artCityTour.Repository;


import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Event;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class EventRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Event> getEventByItinerary(Long id) {
        try {
            String query = "SELECT * FROM event INNER JOIN eventxitinerary ON event.id = eventid WHERE itineraryid = ?";
            List<Event> events = new ArrayList<>();
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Event event = new Event();
                    event.setId(resultSet.getLong(1));
                    event.setPlaceId(resultSet.getLong(2));
                    event.setStartHour(resultSet.getString(3));
                    event.setEndHour(resultSet.getString(4));
                    events.add(event);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return events;
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public List<Event> getAll() {
        try {
            String query = "SELECT * FROM public.event";
            List<Event> events = new ArrayList<>();

            try {
                PreparedStatement statement = connection.prepareStatement(query);
                PlaceRepository placeRepository = new PlaceRepository();
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Event event = new Event();
                    event.setId(resultSet.getLong(1));
                    event.setPlaceId(resultSet.getLong(2));
                    event.setStartHour(resultSet.getString(3));
                    event.setEndHour(resultSet.getString(4));
                    event.setPlace(placeRepository.getPlaceByEvent(event.getPlaceId()));
                    events.add(event);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return events;
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public boolean deleteEventById(Long valueId) {
        try {
            String placeQuery = "DELETE FROM eventxitinerary WHERE eventid=?";
            String mainQuery = "DELETE FROM place WHERE id=?";
            PreparedStatement placeStatement = connection.prepareStatement(placeQuery);
            PreparedStatement mainStatement = connection.prepareStatement(mainQuery);

            placeStatement.setLong(1, valueId);
            mainStatement.setLong(1, valueId);

            placeStatement.executeUpdate();
            Integer result = mainStatement.executeUpdate();
            connection.close();

            return result == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Event getEventById(Long eventId) {

        String placeQuery = "SELECT * FROM event where id = ?";
        PreparedStatement statementPlace;
        try {
            statementPlace = connection.prepareStatement(placeQuery);
            statementPlace.setLong(1, eventId);
            ResultSet eventResult = statementPlace.executeQuery();
            Event event = new Event();
            while (eventResult.next()) {
                event.setId(eventResult.getLong(1));
                event.setPlaceId(eventResult.getLong(2));
                event.setStartHour(eventResult.getString(3));
                event.setEndHour(eventResult.getString(4));
            }
            return event;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int insertEvent(Event event) {
        String query = "INSERT INTO event (placeid, start_hour, end_hour) VALUES (?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, event.getPlaceId());
            statement.setString(2, event.getStartHour());
            statement.setString(3, event.getEndHour());
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int updateEvent(Event event){
        String query = "UPDATE event SET placeid=?, start_hour=?, end_hour=? WHERE id =?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, event.getPlaceId());
            statement.setString(2, event.getStartHour());
            statement.setString(3, event.getEndHour());
            statement.setLong(4, event.getId());
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
