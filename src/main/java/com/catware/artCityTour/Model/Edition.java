package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.time.LocalDate;

@Getter
@Setter
public class Edition {
    private Long id;
    private String name;
    private String details;
    private LocalDate date;
    private List<Sponsor> sponsors;

    public Edition(long id, String name, String details, LocalDate date, List<Sponsor> sponsors) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.date = date;
        this.sponsors = sponsors;
    }

    public Edition() {

    }
}
