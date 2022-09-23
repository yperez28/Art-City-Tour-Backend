package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class User {

    private Long id;
    private String name;
    private String lastname;
    private String email;
    private String password;
    private String identification;
    private String phoneNumber;
    private String address;
    private String photo;
    private Integer age;
    private List<Membership> memberships;
    private List<Itinerary> itineraries;

    public User(Long id, String name, String lastname, String email, String password, String identification, String phoneNumber, String address, String photo, Integer age, List<Membership> memberships, List<Itinerary> itineraries) {
        this.id = id;
        this.name = name;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.identification = identification;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.photo = photo;
        this.age = age;
        this.memberships = memberships;
        this.itineraries = itineraries;
    }

    public User() {
    }
}
