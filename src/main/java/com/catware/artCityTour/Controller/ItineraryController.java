package com.catware.artCityTour.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ItineraryController {
    @RequestMapping(value = "/itinerario/create", method = RequestMethod.POST)
    public String createItinerary(){
        return "POST MI ITINERARIO";
    }

    @RequestMapping(value = "/itinerario/getAll", method = RequestMethod.GET)
    public String getItinerary(){
        return "GET MI ITINERARIO";
    }

    @RequestMapping(value = "/itinerario/update", method = RequestMethod.PUT)
    public String updateItinerary(){
        return "PUT MI ITINERARIO";
    }

    @RequestMapping(value = "/itinerario/delete", method = RequestMethod.DELETE)
    public String deleteItinerary(){
        return "DELETE MI ITINERARIO";
    }
}
