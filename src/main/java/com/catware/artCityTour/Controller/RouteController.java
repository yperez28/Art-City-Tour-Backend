package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.MembershipService;
import com.catware.artCityTour.Service.RouteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping(value = "/routes")
public class RouteController {

    @Autowired
    RouteService routeService;

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return routeService.getAll();
    }

    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getRouteById(@RequestParam Long id) throws JsonProcessingException {
        return routeService.getRouteById(id);
    }
}
