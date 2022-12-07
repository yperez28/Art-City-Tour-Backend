package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
public class Event {

    private Long id;
    private String startHour;
    private String endHour;
    private Place place;
    private Long placeId;

    public Event(Long id, String startHour, String endHour, Place place, Long placeId) {
        this.id = id;
        this.startHour = startHour;
        this.endHour = endHour;
        this.place = place;
        this.placeId = placeId;
    }

    public Event() {
    }
}
