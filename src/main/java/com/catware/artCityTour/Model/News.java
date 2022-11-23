package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;


@Getter
@Setter
public class News {
    private Long id;
    private String title;
    private String description;
    private LocalDate date;
    private Image image;
    private Long imageId;
    private String link;

    public News(Long id, String title, String description, LocalDate date, Image image, Long imageId, String link) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.date = date;
        this.image = image;
        this.imageId = imageId;
        this.link = link;
    }

    public News() {
    }
}
