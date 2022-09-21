package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Route {
    private Long id;
    private String nombre;
    private List<Place> lugares;

    public Route(Long id, String name, List<Place> lugares) {
        this.id = id;
        this.nombre = name;
        this.lugares = lugares;
    }

    public Route() {
    }
}
