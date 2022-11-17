package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Grid;
import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private ImageService imageService;

    public List<Place> getPlaceByRouteId(Long routeId){
        List<Place> places = placeRepository.getPlacesByRoute(routeId);
        for (Place place: places){
            place.setImage(imageService.getImageById(place.getImageId()));
        }
        return places;
    }

    public Grid getAllPlacesGrid(){
        List<String> columns = Arrays.asList("ID", "Nombre", "Detalles");
        List<List<String>> rows = getRows();
        return new Grid(columns, rows);
    }

    private List<List<String>> getRows() {
        List<Place> allPlaces = placeRepository.getAllPlaces();
        List<List<String>> rows = new ArrayList<>();
        for (Place p: allPlaces){
            List<String> row = new ArrayList<>();
            row.add(String.valueOf(p.getId()));
            row.add(p.getName());
            row.add(p.getDetails());
            rows.add(row);
        }
        return rows;
    }
}
