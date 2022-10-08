package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.MembershipService;
import com.catware.artCityTour.Service.RouteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/routes")
public class RouteController {

    @Autowired
    RouteService routeService;

    @CrossOrigin
    @RequestMapping(value="/create", method = RequestMethod.GET)
    public String createRoute(@RequestParam String name) throws JsonProcessingException {
        return routeService.saveRoute(name);
    }

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return routeService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateRoute(@RequestParam String name, @RequestParam Long id) throws JsonProcessingException {
        return routeService.updateRoute(name, id);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteUser(@RequestParam Long id) throws JsonProcessingException {
        return routeService.deleteRoute(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getRouteById(@RequestParam Long id) throws JsonProcessingException {
        return routeService.getRouteById(id);
    }
}
