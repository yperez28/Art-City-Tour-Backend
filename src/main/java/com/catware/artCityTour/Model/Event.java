package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
public class Event {

    private Long id;
    private LocalTime start_hour;
    private LocalTime end_hour;
    private Place place;
    private Long placeid;

    public Event(Long id, LocalTime startHour, LocalTime endHour, Place place) {
        this.id = id;
        this.start_hour = startHour;
        this.end_hour = endHour;
        this.place = place;
    }

    public Event() {
    }
}
