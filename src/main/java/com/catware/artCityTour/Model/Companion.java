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
    private String last_name;

    public Companion(Long id, String identification, String age, String name, String last_name) {
        this.id = id;
        this.identification = identification;
        this.age = age;
        this.name = name;
        this.last_name = last_name;
    }

    public Companion() {}
}
