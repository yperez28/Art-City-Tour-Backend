package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sponsor {

    private Long id;
    private String name;
    private Image image;
    private Long imageId;

    public Sponsor(Long id, String name, Image image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public Sponsor() {
    }
}
