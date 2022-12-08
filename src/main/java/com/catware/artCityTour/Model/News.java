package com.catware.artCityTour.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class News {
    private Long id;
    private String title;
    private String description;
    private String date;
    private Image image;
    private Long imageId;
    private String link;

}
