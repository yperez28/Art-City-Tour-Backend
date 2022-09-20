package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Edition {
    private Long id;
    private String nombre;
    private String detalles;
    private String fecha;

    public Edition(long id, String nombre, String detalles, String fecha) {
        this.id = id;
        this.nombre = nombre;
        this.detalles = detalles;
        this.fecha = fecha;
    }
}
