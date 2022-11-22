package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.EventService;
import com.catware.artCityTour.Service.ItineraryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
}
