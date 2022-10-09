package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Route;
import com.catware.artCityTour.Repository.PlaceRepository;
import com.catware.artCityTour.Repository.RouteRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RouteService {
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private RouteRepository routeRepository;
    @Autowired
    private PlaceService placeService;

    public String getAll() throws JsonProcessingException {
        List<Route> routes = routeRepository.getAll();
        for (Route route:routes) {
            route.setPlaces(placeService.getPlaceById(route.getId()));
        }

        return objectMapper.writeValueAsString(routes);
    }

    public String saveRoute(String name) throws JsonProcessingException {
        Route route = routeRepository.saveRoute(name);

        return objectMapper.writeValueAsString(route);
    }

    public String updateRoute(String name, Long id) throws JsonProcessingException {
        Route route = routeRepository.updateRoute(name, id);

        return objectMapper.writeValueAsString(route);
    }

    public String deleteRoute(Long id) throws JsonProcessingException {
        Integer result = routeRepository.deleteRoute(id);

        return objectMapper.writeValueAsString(result);
    }

    public String getRouteById(Long id) throws JsonProcessingException {
        Route route = routeRepository.getRouteById(id);
        route.setPlaces(placeService.getPlaceById(route.getId()));

        return objectMapper.writeValueAsString(route);
    }
}
