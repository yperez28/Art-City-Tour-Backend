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

import java.security.SecureRandom;
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
    @Autowired
    private ImageService imageService;

    @Autowired
    private EmailService emailService;

    public String getAll() throws JsonProcessingException {
        List<User> users = userRepository.getAll();
        for (User user: users) {
            user.setMemberships(membershipRepository.getMembershipsByUser(user.getId()));
            List<Itinerary> itineraries = itineraryRepository.getItineraryByUserId(user.getId());

            for (Itinerary itinerary:itineraries) {
                itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
            }

            user.setItineraries(itineraries);
            user.setImage(imageService.getImageById(user.getImageId()));
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
        user.setImage(imageService.getImageById(user.getImageId()));

        return objectMapper.writeValueAsString(user);
    }

    public String saveUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        user.setImageId(imageService.createImage(user.getImage()));
        Integer result = userRepository.saveUser(user.getName(), user.getLastname(), user.getEmail(), user.getPassword(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getAge(), user.getImageId());
        return objectMapper.writeValueAsString(user);
    }

    public String updateUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        imageService.updateImage(user.getImage());
        Integer result = userRepository.updateUser(user.getName(), user.getLastname(), user.getEmail(), user.getPassword(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getAge(), user.getId());
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

    public boolean getLogin(String email, String password) {
        return userRepository.getLogin(email, password);
    }

    public boolean forgetPassword(String email){
        String tempPass = createTempPass(8);
        emailService.sendEmail(email, "Olvidó su contraseña Art City Tour", getTempPass(tempPass));
        return userRepository.changePassword(email, tempPass);
    }

    public boolean changePassword(String email, String currentPass, String newPass){
        return userRepository.changePassword(email, currentPass, newPass);
    }

    private String getTempPass(String password) {
        String initialMessage = "Utilice esta contraseña temporal para ingresar al sistema y cambiarla por una nueva:\n\n";
        String finalMessage = "\n\n Si usted no envió esta solicitud ignore este mensaje y cambie su contraseña.";
        return initialMessage +  password + finalMessage;
    }

    public static String createTempPass(int len) {
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
        return sb.toString();
    }
}
