package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private ImageService imageService;

    public List<Place> getPlaceById(Long routeId){
        List<Place> places = placeRepository.getPlacesByRoute(routeId);
        for (Place place: places){
            place.setImage(imageService.getImageById(place.getImageId()));
        }
        return places;
    }
}
