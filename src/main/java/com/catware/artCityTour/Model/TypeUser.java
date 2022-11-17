package com.catware.artCityTour.Model;

public enum TypeUser {
    NORMAL_USER("Normal User"),
    ADMIN("Admin");

    private String name;
    TypeUser(String name) {
        this.name = name;
    }

    public String getName(){
        return this.name;
    }
}
