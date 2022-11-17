package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Model.AdminSections;
import com.catware.artCityTour.Service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private PlaceService placeService;

    @Autowired
    private SponsorService sponsorService;

    @Autowired
    private UserService userService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private EditionService editionService;

    @Autowired
    private ObjectMapper objectMapper;

    @CrossOrigin
    @RequestMapping(value = "/getAdminGrid", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String getAdminGrid(@RequestParam String adminSection) throws JsonProcessingException {
        AdminSections adminSec = AdminSections.valueOf(adminSection);
        switch (adminSec){
            case EDITIONS:
                return objectMapper.writeValueAsString(editionService.getGrid());
            case USERS:
                return objectMapper.writeValueAsString(userService.getGrid());
            case NEWS:
                return objectMapper.writeValueAsString(newsService.getGrid());
            case PLACES:
                return objectMapper.writeValueAsString(placeService.getAllPlacesGrid());
            case SPONSORS:
                return objectMapper.writeValueAsString(sponsorService.getGrid());
            default:
                return "Not Found";
        }
    }

    @CrossOrigin
    @RequestMapping(value = "/deleteFromGrids", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public boolean deleteFromAdminGrid(@RequestParam String type, @RequestParam Long valueId){
        AdminSections adminSec = AdminSections.valueOf(type);
        switch (adminSec){
            case SPONSORS:
                return sponsorService.deleteSponsor(valueId);
            case PLACES:
                return placeService.deletePlace(valueId);
            case NEWS:
                return newsService.deletePlace(valueId);
            case USERS:
                return userService.deletePlace(valueId);
            case EDITIONS:
                return editionService.deletePlace(valueId);
            default:
                return false;
        }
    }
}
