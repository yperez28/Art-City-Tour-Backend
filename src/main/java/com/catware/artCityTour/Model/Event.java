package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
public class Event {

    private Long id;
    private LocalTime startHour;
    private LocalTime endHour;
    private Place place;
    private Long placeId;

    public Event(Long id, LocalTime startHour, LocalTime endHour, Place place) {
        this.id = id;
        this.startHour = startHour;
        this.endHour = endHour;
        this.place = place;
    }

    public Event() {
    }
}
