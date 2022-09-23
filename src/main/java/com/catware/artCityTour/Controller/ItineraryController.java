package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.ItineraryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/itinerary")
public class ItineraryController {

    @Autowired
    private ItineraryService itineraryService;

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createItinerary(@RequestParam Long id, @RequestParam Long userId ) throws JsonProcessingException {
        return itineraryService.saveItinerary(id, userId);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getItinerary() throws JsonProcessingException {
        return itineraryService.getAll();
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateItinerary(@RequestParam Long id, @RequestParam Long userId) throws JsonProcessingException {
        return itineraryService.updateItinerary(id, userId);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteItinerary(@RequestParam Long id) throws JsonProcessingException {
        return itineraryService.deleteItinerary(id);
    }

    @RequestMapping(value="/getById", method = RequestMethod.GET)
    public String getItineraryById(@RequestParam Long id) throws JsonProcessingException {
        return itineraryService.getItineraryById(id);
    }
}
