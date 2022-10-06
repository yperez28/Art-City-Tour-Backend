package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class Membership {

    private Long id;
    private String name;
    private String details;
    private Image photo;
    private double price;

    private Long imageId;


    public Membership(long id, String name, String details, Image photo, Integer precio, List<String> processedDetails) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.photo = photo;
        this.price = precio;
    }

    public Membership() {

    }
}
