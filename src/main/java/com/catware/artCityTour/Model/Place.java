package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Place {
    private Long id;
    private String nombre;
    private String detalles;
    private String imagen;

    public Place(long id, String nombre, String detalles, String imagen) {
        this.id = id;
        this.nombre = nombre;
        this.detalles = detalles;
        this.imagen = imagen;
    }

    public Place() {

    }

}
