package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
public class Event {

    private Long id;
    private LocalTime starthour;
    private LocalTime endhour;
    private Place place;
    private Long placeid;

    public Event(Long id, LocalTime startHour, LocalTime endHour, Place place) {
        this.id = id;
        this.starthour = startHour;
        this.endhour = endHour;
        this.place = place;
    }

    public Event() {
    }
}
