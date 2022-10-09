package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Reservation {

    private Integer id;
    private String identification;
    private String age;
    private String name;
    private String last_name;
    private String email;
    private String phoneNumber;
    private Boolean isFirstTime;
    private Integer place_id;
    private List<Companion> companion;

    public Reservation(Integer id, String identification, String age, String name, String last_name,
                       String email, String phoneNumber, Boolean isFirstTime, Integer place_id, List<Companion> companion) {
        this.id = id;
        this.identification = identification;
        this.age = age;
        this.name = name;
        this.last_name = last_name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.isFirstTime = isFirstTime;
        this.place_id = place_id;
        this.companion = companion;
    }

    public Reservation() {}
}
