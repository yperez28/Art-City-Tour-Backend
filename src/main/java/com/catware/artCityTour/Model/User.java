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
    private List<Membership> memberships;

    public User(Long id, String name, String lastname, String email, String password, List<Membership> memberships, List<Itinerary> itineraries) {
        this.id = id;
        this.name = name;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.memberships = memberships;
    }

    public User(String name, String lastname, String email, String password, List<Membership> memberships, List<Itinerary> itineraries) {
        this.name = name;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.memberships = memberships;
    }

    public User() {
    }
}
