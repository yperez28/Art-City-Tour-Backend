package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sponsor {

    private Long id;
    private String name;

    public Sponsor(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Sponsor() {
    }
}
