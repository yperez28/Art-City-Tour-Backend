package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Event;
import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Repository.EventRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EventRepository eventRepository;

    public List<Event> getEventByItinerary(Long itineraryId) throws JsonProcessingException {
        List<Event> events = eventRepository.getEventByItinerary(itineraryId);

        return events;
    }

    public String getAll() throws JsonProcessingException {
        List<Event> events = eventRepository.getAll();

        return objectMapper.writeValueAsString(events);
    }

}
