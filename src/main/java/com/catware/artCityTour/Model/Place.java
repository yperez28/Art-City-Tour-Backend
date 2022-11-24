package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Place {
    private Long id;
    private String name;
    private String details;
    private Image image;
    private Long imageId;
    private Double latitude;
    private Double longitude;
    private String category;
    private Long priceRange;
    private Long score;
    private String link;


    public Place(long id, String name, String details, Long photo, Double latitude, Double longitude) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.imageId = photo;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public Place(Long id, String name, String details, Image image, Long imageId, Double latitude, Double longitude, String category, Long priceRange, Long score, String link) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.image = image;
        this.imageId = imageId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.category = category;
        this.priceRange = priceRange;
        this.score = score;
        this.link = link;
    }

    public Place() {
    }

}
