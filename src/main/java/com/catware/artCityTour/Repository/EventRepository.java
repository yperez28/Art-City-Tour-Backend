package com.catware.artCityTour.Repository;


import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Event;
import com.catware.artCityTour.Model.Itinerary;
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
public class EventRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Event> getEventByItinerary(Long id){
        try {
            String query = "SELECT * FROM event INNER JOIN eventxitinerary ON event.id = eventid WHERE itineraryid = ?";
            List<Event> events = new ArrayList<>();
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                PlaceRepository placeRepository = new PlaceRepository();
                while (resultSet.next()) {
                    Event event = new Event();
                    event.setId(resultSet.getLong(1));
                    event.setPlaceId(resultSet.getLong(2));
                    event.setStartHour((resultSet.getTime(3)).toLocalTime());
                    event.setEndHour(((resultSet.getTime(4)).toLocalTime()));
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

    public List<Event> getAll() {
        try {
            String query = "SELECT event.id, event.start_hour, event.end_hour, place.name FROM public.event INNER JOIN place ON event.placeid = place.id";
            List<Event> events = new ArrayList<>();

            try {
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Event event = new Event();
                    Place place = new Place();
                    event.setId(resultSet.getLong(1));
                    event.setStartHour(resultSet.getTime(2).toLocalTime());
                    event.setEndHour(resultSet.getTime(3).toLocalTime());
                    place.setId(resultSet.getLong(4));
                    place.setName(resultSet.getString(5));
                    place.setDetails(resultSet.getString(6));
                    place.setImageId(resultSet.getLong(7));
                    event.setPlace(place);

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
}
