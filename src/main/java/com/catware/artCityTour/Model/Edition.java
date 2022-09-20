package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class Edition {
    private Long id;
    private String nombre;
    private String detalles;
    private LocalDate fecha;

    public Edition(long id, String nombre, String detalles, LocalDate fecha) {
        this.id = id;
        this.nombre = nombre;
        this.detalles = detalles;
        this.fecha = fecha;
    }

    public Edition() {

    }
}
