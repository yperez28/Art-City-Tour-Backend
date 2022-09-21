package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Membership;
import com.catware.artCityTour.Model.Route;
import com.catware.artCityTour.Repository.RouteRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class RouteService {
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private RouteRepository routeRepository;

    public String getAll() throws JsonProcessingException {
        List<Route> routes = routeRepository.getAll();
        for (Route route:routes) {
            route.setLugares(routeRepository.getPlacesByRoute(route.getId()));
        }
        return objectMapper.writeValueAsString(routes);
    }

    public String getRouteById(Long id) throws JsonProcessingException {
        Route route = routeRepository.getRouteById(id);
        route.setLugares(routeRepository.getPlacesByRoute(route.getId()));
        return objectMapper.writeValueAsString(route);
    }
}
