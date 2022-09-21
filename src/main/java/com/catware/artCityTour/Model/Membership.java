package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class Membership {

    private Long id;
    private String nombre;
    private String detalles;
    private String imagen;
    private List<String> processedDetalles;


    public Membership(long id, String nombre, String detalles, String imagen, List<String> processedDetalles) {
        this.id = id;
        this.nombre = nombre;
        this.detalles = detalles;
        this.imagen = imagen;
        this.processedDetalles = processedDetalles;
    }

    public Membership() {

    }
}
