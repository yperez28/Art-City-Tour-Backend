package com.catware.artCityTour.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @RequestMapping(value = "/usuario/create", method = RequestMethod.POST)
    public String createUser(){
        return "POST USUARIOS";
    }

    @RequestMapping(value = "/usuario/getAll", method = RequestMethod.GET)
    public String getUser(){
        return "GET USUARIOS";
    }

    @RequestMapping(value = "/usuario/update", method = RequestMethod.PUT)
    public String updateUser(){
        return "PUT USUARIOS";
    }

    @RequestMapping(value = "/usuario/delete", method = RequestMethod.DELETE)
    public String deleteUser(){
        return "DELETE USUARIOS";
    }
}
