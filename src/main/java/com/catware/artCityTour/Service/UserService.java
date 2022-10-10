package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Model.User;
import com.catware.artCityTour.Repository.ItineraryRepository;
import com.catware.artCityTour.Repository.MembershipRepository;
import com.catware.artCityTour.Repository.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MembershipRepository membershipRepository;

    public String getAll() throws JsonProcessingException {
        List<User> users = userRepository.getAll();
        for (User user: users) {
            user.setMemberships(membershipRepository.getMembershipsByUser(user.getId()));
        }

        return objectMapper.writeValueAsString(users);
    }

    public String getUserById(Long id) throws JsonProcessingException {
        User user = userRepository.getUserById(id);
        user.setMemberships(membershipRepository.getMembershipsByUser(id));

        return objectMapper.writeValueAsString(user);
    }

    /*public String saveUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, String photo, Integer age) throws JsonProcessingException {
        Integer result = userRepository.saveUser(name, lastname, email, password, identification, phoneNumber, address, photo, age);
        return objectMapper.writeValueAsString(result);
    }*/

    public String saveUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        Integer result = userRepository.saveUser(user.getName(), user.getLastname(), user.getEmail(), user.getPassword(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getAge());
        return objectMapper.writeValueAsString(result);
    }

    public String updateUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        Integer result = userRepository.updateUser(user.getName(), user.getLastname(), user.getEmail(), user.getPassword(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getPhoto(), user.getAge(), user.getId());
        return objectMapper.writeValueAsString(result);
    }

    public String deleteUser(Long id) throws JsonProcessingException {
        ItineraryRepository itineraryRepository = new ItineraryRepository();
        List<Itinerary> itinerary =  itineraryRepository.getItineraryByUser(id);
        for (Itinerary itin:itinerary ) {
            itineraryRepository.deleteItinerary(itin.getId());
        }
        Integer result = userRepository.deleteUser(id);
        return objectMapper.writeValueAsString(result);
    }

    public boolean getLogin(String email, String password) {
        return userRepository.getLogin(email, password);
    }
}
