package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Route {
    private Long id;
    private String name;
    private List<Place> places;
    private Long editionId;
    private Long imageId;
    private Image image;

    public Route(Long id, String name, List<Place> places, Long editionId, Long imageId, Image image) {
        this.id = id;
        this.name = name;
        this.places = places;
        this.editionId = editionId;
        this.imageId = imageId;
        this.image = image;
    }

    public Route() {
    }
}
