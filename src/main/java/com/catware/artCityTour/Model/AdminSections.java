package com.catware.artCityTour.Model;

public enum AdminSections {
    PLACES("Lugares"),
    SPONSORS("Patrocinadores"),
    EDITIONS("Ediciones"),
    NEWS("Noticias"),
    USERS("Usuarios");

    private String name;

    public String getName(){
        return this.name;
    }

    AdminSections(String sectionName) {
        this.name = sectionName;
    }




}
