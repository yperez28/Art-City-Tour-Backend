package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.User;
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

    public String getAll() throws JsonProcessingException {
        List<User> users = userRepository.getAll();
        for (User user: users) {
            user.setMemberships(userRepository.getMembershipsByUser(user.getId()));
        }

        return objectMapper.writeValueAsString(users);
    }

    public String getUserById(Long id) throws JsonProcessingException {
        User user = userRepository.getUserById(id);
        user.setMemberships(userRepository.getMembershipsByUser(id));

        return objectMapper.writeValueAsString(user);
    }

    public String saveUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, String photo, Integer age) throws JsonProcessingException {
        User result = userRepository.saveUser(name, lastname, email, password, identification, phoneNumber, address, photo, age);

        return objectMapper.writeValueAsString(result);
    }

    public String updateUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, String photo, Integer age, Long id) throws JsonProcessingException {
        Integer result = userRepository.updateUser(name, lastname, email, password, identification, phoneNumber, address, photo, age, id);

        return objectMapper.writeValueAsString(result);
    }

    public String deleteUser(Long id) throws JsonProcessingException {
        Integer result = userRepository.deleteUser(id);

        return objectMapper.writeValueAsString(result);
    }
}
