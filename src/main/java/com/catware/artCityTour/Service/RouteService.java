package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Model.Route;
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
            route.setPlaces(placeService.getPlaceByRouteId(route.getId()));
        }

        return objectMapper.writeValueAsString(routes);
    }

    public String saveRoute(String jsonData) throws JsonProcessingException {
        Route route = objectMapper.readValue(jsonData, Route.class);
        routeRepository.saveRoute(route.getName(), route.getEditionId());
        return objectMapper.writeValueAsString(route);
    }

    public String updateRoute(String jsonData) throws JsonProcessingException {
        Route route = objectMapper.readValue(jsonData, Route.class);
        routeRepository.updateRoute(route.getName(), route.getId(), route.getEditionId());
        return objectMapper.writeValueAsString(route);
    }

    public String deleteRoute(Long id) throws JsonProcessingException {
        Integer result = routeRepository.deleteRoute(id);
        return objectMapper.writeValueAsString(result);
    }

    public String getRouteById(Long id) throws JsonProcessingException {
        Route route = routeRepository.getRouteById(id);
        route.setPlaces(placeService.getPlaceByRouteId(route.getId()));

        return objectMapper.writeValueAsString(route);
    }

    public String getRouteByCurrentEdition() throws JsonProcessingException {
        List<Route> routes = routeRepository.getRouteByCurrentEdition();
        for (Route route:routes) {
            route.setPlaces(placeService.getPlaceByRouteId(route.getId()));
        }
        return objectMapper.writeValueAsString(routes);
    }

    public List<Route> getRouteByEdition(Long editionId) {
        List<Route> routes = routeRepository.getRouteByEdition(editionId);
        for (Route route:routes) {
            route.setPlaces(placeService.getPlaceByRouteId(route.getId()));
        }
        return routes;
    }

    public void deleteRouteByEdition(Long editionId) throws JsonProcessingException {
        List<Route> routes = getRouteByEdition(editionId);
        for (Route route:routes) {
            deleteRoute(route.getId());
        }
    }
}
