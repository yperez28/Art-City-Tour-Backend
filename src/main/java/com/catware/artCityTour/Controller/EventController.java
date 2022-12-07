package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.EventService;
import com.catware.artCityTour.Service.ItineraryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value="/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getEvent() throws JsonProcessingException {
        return eventService.getAll();
    }

    @CrossOrigin
    @RequestMapping (value = "/getEventById", method = RequestMethod.GET)
    public String getEventById(@RequestParam Long eventId) throws JsonProcessingException {
        return eventService.getEventById(eventId);
    }

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createEvent(@RequestBody String jsonData) throws JsonProcessingException {
        return eventService.createEvent(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateEvent(@RequestBody String jsonData) throws JsonProcessingException {
        return eventService.updateEvent(jsonData);
    }
}
