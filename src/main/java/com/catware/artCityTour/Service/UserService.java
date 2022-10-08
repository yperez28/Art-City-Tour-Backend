package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Model.User;
import com.catware.artCityTour.Repository.EventRepository;
import com.catware.artCityTour.Repository.ItineraryRepository;
import com.catware.artCityTour.Repository.MembershipRepository;
import com.catware.artCityTour.Repository.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MembershipRepository membershipRepository;
    @Autowired
    private ItineraryRepository itineraryRepository;
    @Autowired
    private EventRepository eventRepository;


    public String getAll() throws JsonProcessingException {
        List<User> users = userRepository.getAll();
        for (User user: users) {
            user.setMemberships(membershipRepository.getMembershipsByUser(user.getId()));
            List<Itinerary> itineraries = itineraryRepository.getItineraryByUserId(user.getId());

            for (Itinerary itinerary:itineraries) {
                itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
            }

            user.setItineraries(itineraries);
        }

        return objectMapper.writeValueAsString(users);
    }

    public String getUserById(Long id) throws JsonProcessingException {
        User user = userRepository.getUserById(id);
        user.setMemberships(membershipRepository.getMembershipsByUser(id));
        List<Itinerary> itineraries = itineraryRepository.getItineraryByUserId(id);

        for (Itinerary itinerary:itineraries) {
            itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
        }

        user.setItineraries(itineraries);

        return objectMapper.writeValueAsString(user);
    }

    public String saveUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age, Long imageId) throws JsonProcessingException {
        User user = userRepository.saveUser(name, lastname, email, password, identification, phoneNumber, address, age, imageId);
        return objectMapper.writeValueAsString(user);
    }

    public String updateUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age, Long imageId, Long id) throws JsonProcessingException {
        Integer result = userRepository.updateUser(name, lastname, email, password, identification, phoneNumber, address, age, imageId, id);
        return objectMapper.writeValueAsString(result);
    }

    public String deleteUser(Long id) throws JsonProcessingException {
        ItineraryRepository itineraryRepository = new ItineraryRepository();
        List<Itinerary> itineraries =  itineraryRepository.getItineraryByUserId(id);
        for (Itinerary itinerary:itineraries ) {
            itineraryRepository.deleteItinerary(itinerary.getId());
        }
        Integer result = userRepository.deleteUser(id);
        return objectMapper.writeValueAsString(result);
    }
}
