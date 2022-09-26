package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createUser(@RequestParam String name, @RequestParam String lastname, @RequestParam String email, @RequestParam String password, @RequestParam String identification, @RequestParam String phoneNumber, @RequestParam String address, @RequestParam String photo, @RequestParam Integer age) throws JsonProcessingException {
        return userService.saveUser(name, lastname, email, password, identification, phoneNumber, address, photo, age);
    }

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getUser() throws JsonProcessingException {
        return userService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateUser(@RequestParam String name, @RequestParam String lastname, @RequestParam String email, @RequestParam String password, @RequestParam String identification, @RequestParam String phoneNumber, @RequestParam String address, @RequestParam String photo, @RequestParam Integer age, @RequestParam Long id) throws JsonProcessingException {
        return userService.updateUser(name, lastname, email, password, identification, phoneNumber, address, photo, age, id);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteUser(@RequestParam Long id) throws JsonProcessingException {
        return userService.deleteUser(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getUserById(@RequestParam Long id) throws JsonProcessingException {
        return userService.getUserById(id);
    }
}
