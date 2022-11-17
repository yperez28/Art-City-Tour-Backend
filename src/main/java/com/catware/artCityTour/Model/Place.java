package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Place {
    private Long id;
    private String name;
    private String details;
    private Image image;
    private Long imageId;

    public Place(long id, String name, String details, Long photo) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.imageId = photo;
    }

    public Place() {

    }

}
