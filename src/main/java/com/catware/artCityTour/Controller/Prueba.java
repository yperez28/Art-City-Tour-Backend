package com.catware.artCityTour.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Prueba {

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String holaMundo(){
        return "HOLA MUNDO";
    }
}
