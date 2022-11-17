package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.PlaceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping(value = "/places")
public class PlaceController {
    @Autowired
    private PlaceService placeService;

    @Autowired
    private ObjectMapper objectMapper;

}
