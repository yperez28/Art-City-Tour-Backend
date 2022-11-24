package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class User {

    private Long id;
    private String name;
    private String lastName;
    private String email;
    private String password;
    private String identification;
    private String phoneNumber;
    private String address;
    private Integer age;
    private List<Membership> memberships;
    private Itinerary itinerary;

    private String typeUser;

    public User(Long id, String name, String lastName, String email, String password, String identification, String phoneNumber, String address, Integer age, List<Membership> memberships, Itinerary itinerary, String typeUser) {
        this.id = id;
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.identification = identification;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.age = age;
        this.memberships = memberships;
        this.itinerary = itinerary;
        this.typeUser = typeUser;
    }

    public User() {
    }
}
