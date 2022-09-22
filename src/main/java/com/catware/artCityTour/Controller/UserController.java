package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createUser(@RequestParam String name, @RequestParam String lastname, @RequestParam String email, @RequestParam String password) throws JsonProcessingException {
        return userService.saveUser(name, lastname, email, password);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getUser() throws JsonProcessingException {
        return userService.getAll();
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateUser(@RequestParam String name, @RequestParam String lastname, @RequestParam String email, @RequestParam String password, @RequestParam Long id) throws JsonProcessingException {
        return userService.updateUser(name, lastname, email, password, id);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteUser(@RequestParam Long id) throws JsonProcessingException {
        return userService.deleteUser(id);
    }

    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getUserById(@RequestParam Long id) throws JsonProcessingException {
        return userService.getUserById(id);
    }
}
