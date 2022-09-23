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
            String query = "SELECT * FROM evento INNER JOIN eventoxitinerario ON evento.\"ID\" = eventoid WHERE itinerarioid = ?";
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
                    event.setPlaceid(resultSet.getLong(2));
                    event.setStartHour((resultSet.getTime(3)).toLocalTime());
                    event.setEndHour(((resultSet.getTime(4)).toLocalTime()));
                    event.setPlace(placeRepository.getPlaceByEvent(event.getPlaceid()));
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
