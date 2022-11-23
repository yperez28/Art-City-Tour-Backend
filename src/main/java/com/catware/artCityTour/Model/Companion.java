package com.catware.artCityTour.Model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Companion {

    private Long id;
    private String identification;
    private String age;
    private String name;
    private String lastName;

    public Companion(Long id, String identification, String age, String name, String lastName) {
        this.id = id;
        this.identification = identification;
        this.age = age;
        this.name = name;
        this.lastName = lastName;
    }

    public Companion() {}
}
