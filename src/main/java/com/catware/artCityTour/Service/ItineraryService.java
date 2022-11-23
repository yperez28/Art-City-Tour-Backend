package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Event;
import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Repository.EventRepository;
import com.catware.artCityTour.Repository.ItineraryRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItineraryService {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private ItineraryRepository itineraryRepository;

    @Autowired
    private EventRepository eventRepository;

    public String getAll() throws JsonProcessingException {
        List<Itinerary> itineraries = itineraryRepository.getAll();
        for (Itinerary itinerary : itineraries) {
            itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
        }

        return objectMapper.writeValueAsString(itineraries);
    }

    public String saveItinerary(Long userId) throws JsonProcessingException {
        Long result = itineraryRepository.saveItinerary(userId);

        return objectMapper.writeValueAsString(result);
    }

    public String updateItinerary(Long id, Long userId) throws JsonProcessingException {
        Integer result = itineraryRepository.updateItinerary(id, userId);

        return objectMapper.writeValueAsString(result);
    }

    public String deleteItinerary(Long id) throws JsonProcessingException {
        Integer result = itineraryRepository.deleteItinerary(id);

        return objectMapper.writeValueAsString(result);
    }

    public String getItineraryById(Long id) throws JsonProcessingException {
        Itinerary itinerary = itineraryRepository.getItineraryById(id);
        itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));

        return objectMapper.writeValueAsString(itinerary);
    }

    public String getItineraryByUserId(Long userId) throws JsonProcessingException {
        Itinerary itinerary = itineraryRepository.getItineraryByUserId(userId);
        itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));

        return objectMapper.writeValueAsString(itinerary);
    }

    public String saveEventXItinerary(Long itineraryId, Long eventId) throws JsonProcessingException {
        Integer result = itineraryRepository.saveEventXItinerary(itineraryId, eventId);

        return objectMapper.writeValueAsString(result);
    }

    public String saveFullItinerary(Long userId, String jsonData) throws JsonProcessingException {
        Event[] events = objectMapper.readValue(jsonData, Event[].class);
        Itinerary itinerary = itineraryRepository.getItineraryByUserId(userId);
        itineraryRepository.deleteItinerary(itinerary.getId());
        Long idItinerary = itineraryRepository.saveItinerary(userId);
        Integer result = null;
        for (Event event : events) {
            result = itineraryRepository.saveEventXItinerary(idItinerary, event.getId());
        }

        return objectMapper.writeValueAsString(result);
    }
}
