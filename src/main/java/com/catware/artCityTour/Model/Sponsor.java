package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sponsor {

    private Long id;
    private String name;
    private String photo;

    public Sponsor(Long id, String name, String photo) {
        this.id = id;
        this.name = name;
        this.photo = photo;
    }

    public Sponsor() {
    }
}
