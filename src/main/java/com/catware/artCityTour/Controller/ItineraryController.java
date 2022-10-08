package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.ItineraryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value="/itinerary")
public class ItineraryController {

    @Autowired
    private ItineraryService itineraryService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createItinerary(@RequestParam Long userId ) throws JsonProcessingException {
        return itineraryService.saveItinerary(userId);
    }

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getItinerary() throws JsonProcessingException {
        return itineraryService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateItinerary(@RequestParam Long id, @RequestParam Long userId) throws JsonProcessingException {
        return itineraryService.updateItinerary(id, userId);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteItinerary(@RequestParam Long id) throws JsonProcessingException {
        return itineraryService.deleteItinerary(id);
    }

    @CrossOrigin
    @RequestMapping(value="/getById", method = RequestMethod.GET)
    public String getItineraryById(@RequestParam Long id) throws JsonProcessingException {
        return itineraryService.getItineraryById(id);
    }

    @CrossOrigin
    @RequestMapping(value="/getByUserId", method = RequestMethod.GET)
    public String getItineraryByUserId(@RequestParam Long userId) throws JsonProcessingException {
        return itineraryService.getItineraryByUserId(userId);
    }
}
