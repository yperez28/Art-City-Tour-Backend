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

    public Route(Long id, String name, List<Place> places, Long editionId) {
        this.id = id;
        this.name = name;
        this.places = places;
        this.editionId = editionId;
    }

    public Route() {
    }
}
