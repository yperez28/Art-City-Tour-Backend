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
    public String createUser(@RequestBody String jsonData) throws JsonProcessingException {
        return userService.saveUser(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getUser() throws JsonProcessingException {
        return userService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateUser(@RequestBody String jsonData) throws JsonProcessingException {
        return userService.updateUser(jsonData);
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

    @CrossOrigin
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public boolean getLogin(@RequestParam String email, String password){
        return userService.getLogin(email, password);
    }

}
