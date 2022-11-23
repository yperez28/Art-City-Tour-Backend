package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Event;
import com.catware.artCityTour.Model.Grid;
import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Repository.EventRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class EventService {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private PlaceService placeService;
    public List<Event> getEventByItinerary(Long itineraryId) throws JsonProcessingException {
        List<Event> events = eventRepository.getEventByItinerary(itineraryId);
        for (Event event: events){
            event.setPlace(placeService.getPlaceById(event.getPlaceId()));
        }
        return events;
    }

    public String getAll() throws JsonProcessingException {
        List<Event> events = eventRepository.getAll();
        return objectMapper.writeValueAsString(events);
    }

    public Grid getGrid() {
        List<String> columns = Arrays.asList("ID", "Lugar", "Hora de Inicio", "Hora de Finalización");
        List<List<String>> rows = getRows();
        return new Grid(columns, rows);
    }

    private List<List<String>> getRows() {
        List<List<String>> rows = new ArrayList<>();
        List<Event> events = getAllList();
        for (Event event : events){
            List<String> row = new ArrayList<>();
            row.add(String.valueOf(event.getId()));
            row.add(event.getPlace().getName());
            row.add(String.valueOf(event.getStartHour()));
            row.add(String.valueOf(event.getEndHour()));
            rows.add(row);
        }
        return rows;
    }

    private List<Event> getAllList() {
        List<Event> events = eventRepository.getAll();
        for (Event event: events){
            event.setPlace(placeService.getPlaceById(event.getPlaceId()));
        }
        return events;
    }

}
