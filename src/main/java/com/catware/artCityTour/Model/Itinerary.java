package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Itinerary {

    private Long id;
    private Long userId;
    private List<Event> event;

    public Itinerary(Long id, Long userId) {
        this.id = id;
        this.userId = userId;
    }

    public Itinerary() {
    }
}
