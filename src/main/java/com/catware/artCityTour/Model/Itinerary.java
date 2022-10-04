package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Itinerary {

    private Long id;
    private Long userid;
    private List<Event> events;

    public Itinerary(Long id, Long userid, List<Event> events) {
        this.id = id;
        this.userid = userid;
        this.events = events;
    }

    public Itinerary() {
    }
}
