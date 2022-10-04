package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Place {
    private Long id;
    private String name;
    private String details;
    private String photo;

    public Place(long id, String name, String details, String photo) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.photo = photo;
    }

    public Place() {

    }

}
