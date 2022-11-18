package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Place;
import com.catware.artCityTour.Repository.PlaceRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;
    @Autowired
    private ImageService imageService;
    @Autowired
    private ObjectMapper objectMapper;

    public List<Place> getPlaceById(Long routeId){
        List<Place> places = placeRepository.getPlacesByRoute(routeId);
        for (Place place: places){
            place.setImage(imageService.getImageById(place.getImageId()));
        }
        return places;
    }

    public String createPlace(String jsonData) throws JsonProcessingException {
        Place place = objectMapper.readValue(jsonData, Place.class);
        place.setImageId(imageService.createImage(place.getImage()));
        int result = placeRepository.createPlace(place.getName(), place.getDetails(), place.getImageId(), place.getLatitude(), place.getLongitude());
        if (result > 0) {
            return objectMapper.writeValueAsString(place);
        }
        return "";
    }

    public String updatePlace(String jsonData) throws JsonProcessingException {
        Place place = objectMapper.readValue(jsonData, Place.class);
        imageService.updateImage(place.getImage());
        int result = placeRepository.updatePlace(place.getId(), place.getName(), place.getDetails(), place.getImageId(), place.getLatitude(), place.getLongitude());
        if (result > 0) {
            return objectMapper.writeValueAsString(place);
        }
        return "";
    }
}
