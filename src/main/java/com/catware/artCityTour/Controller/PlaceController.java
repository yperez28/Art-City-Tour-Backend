package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.PlaceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController()
@RequestMapping(value = "/places")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getEdition() throws JsonProcessingException {
        return placeService.getAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createPlace(@RequestBody String jsonData) throws JsonProcessingException {
        System.out.println("json " + jsonData);
        return placeService.createPlace(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updatePlace(@RequestBody String jsonData) throws JsonProcessingException {
        return placeService.updatePlace(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value="/getAllCategory", method = RequestMethod.GET)
    public String getAllCategory(@RequestParam String category) throws JsonProcessingException {
        return placeService.getAllCategory(category);
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getPlaceById(@RequestParam Long id) throws JsonProcessingException {
        return placeService.getPlaceByIdStr(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getCategories", method = RequestMethod.GET)
    public List<String> getCategories() throws JsonProcessingException {
        return placeService.getCategories();
    }
}
