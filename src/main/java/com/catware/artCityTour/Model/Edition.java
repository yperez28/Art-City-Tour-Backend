package com.catware.artCityTour.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Edition {
    private Long id;
    private String name;
    private String details;
    private Boolean current;
    private String date;
    private List<Sponsor> sponsors;
    private List<Route> routes;
    private List<Image> images;
    private List<Long> sponsorIds;
    private List<Long> routesIds;

}


