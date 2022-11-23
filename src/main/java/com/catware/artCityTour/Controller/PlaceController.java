package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.PlaceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/places")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createPlace(@RequestBody String jsonData) throws JsonProcessingException {
        return placeService.createPlace(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updatePlace(@RequestBody String jsonData) throws JsonProcessingException {
        return placeService.updatePlace(jsonData);
    }

    @RequestMapping(value="/getAllCategory", method = RequestMethod.GET)
    public String getAllCategory(@RequestParam String category) throws JsonProcessingException {
        return placeService.getAllCategory(category);
    }
}
