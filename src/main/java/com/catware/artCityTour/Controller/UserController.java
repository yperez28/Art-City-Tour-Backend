package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Model.User;
import com.catware.artCityTour.Service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
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
    public String getLogin(@RequestParam String email, String password) throws JsonProcessingException {
        return userService.getLogin(email, password);
    }

    @CrossOrigin
    @RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
    public boolean forgetPassword(@RequestParam String email){
        return userService.forgetPassword(email);
    }

    @CrossOrigin
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public boolean changePassword(@RequestParam String email, @RequestParam String previousPass, @RequestParam String newPass){
        return userService.changePassword(email, previousPass, newPass);
    }
}
