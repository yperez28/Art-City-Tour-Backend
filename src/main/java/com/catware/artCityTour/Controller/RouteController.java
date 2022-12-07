package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.MembershipService;
import com.catware.artCityTour.Service.RouteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.awt.*;

@RestController()
@RequestMapping(value = "/routes")
public class RouteController {

    @Autowired
    private RouteService routeService;

    @Autowired
    private ObjectMapper objectMapper;

    @CrossOrigin
    @RequestMapping(value="/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createRoute(@RequestBody String jsonData) throws JsonProcessingException {
        return routeService.saveRoute(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return routeService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/getRoutesByEditionId", method = RequestMethod.GET)
    public String getRoutesByEditionId(@RequestParam Long id) throws JsonProcessingException {
        return objectMapper.writeValueAsString(routeService.getRouteByEdition(id));
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateRoute(@RequestBody String jsonData) throws JsonProcessingException {
        return routeService.updateRoute(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public boolean deleteUser(@RequestParam Long id) throws JsonProcessingException {
        return routeService.deleteRoute(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getRouteById(@RequestParam Long id) throws JsonProcessingException {
        return routeService.getRouteById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getByCurrent", method = RequestMethod.GET)
    public String getRouteByCurrentEdition() throws JsonProcessingException {
        return routeService.getRouteByCurrentEdition();
    }
}
