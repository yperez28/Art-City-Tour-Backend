package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Reservation {

    private Long id;
    private String identification;
    private String age;
    private String name;
    private String lastName;
    private String email;
    private String phoneNumber;
    private Boolean isFirstTime;
    private Long placeId;
    private Long userId;
    private String date;
    private Place place;
    private List<Companion> companion;

    public Reservation(Long id, String identification, String age, String name, String lastName, String email,
                       String phoneNumber, Boolean isFirstTime, Long placeId, Long userId, String date, List<Companion> companion) {
        this.id = id;
        this.identification = identification;
        this.age = age;
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.isFirstTime = isFirstTime;
        this.placeId = placeId;
        this.userId = userId;
        this.date = date;
        this.companion = companion;
    }

    public Reservation() {}
}
