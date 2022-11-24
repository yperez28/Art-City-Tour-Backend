package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Grid;
import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Model.TypeUser;
import com.catware.artCityTour.Model.User;
import com.catware.artCityTour.Repository.EventRepository;
import com.catware.artCityTour.Repository.ItineraryRepository;
import com.catware.artCityTour.Repository.MembershipRepository;
import com.catware.artCityTour.Repository.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
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
    private HashingService hashingService;
    @Autowired
    private EmailService emailService;

    public String getAll() throws IOException, WriterException {

        List<User> users = userRepository.getAll();
        for (User user: users) {
            user.setMemberships(membershipRepository.getMembershipsByUser(user.getId()));
            if (itineraryRepository.verifyUserItinerary(user.getId()) > 0) {
                Itinerary itinerary = itineraryRepository.getItineraryByUserId(user.getId());
                itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
                user.setItinerary(itinerary);
            }
        }
        return objectMapper.writeValueAsString(users);
    }

    public String getUserById(Long id) throws JsonProcessingException {
        User user = userRepository.getUserById(id);
        user.setMemberships(membershipRepository.getMembershipsByUser(id));
        Itinerary itinerary = itineraryRepository.getItineraryByUserId(user.getId());
        itinerary.setEvents(eventRepository.getEventByItinerary(itinerary.getId()));
        user.setItinerary(itinerary);

        return objectMapper.writeValueAsString(user);
    }

    public String saveUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        user.setPassword(hashingService.hashPass(user.getPassword()));
        if(checkDuplicateEmail(user.getEmail())) {
            long result = userRepository.saveUser(user.getName(), user.getLastName(), user.getEmail(), user.getPassword(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getAge());
            if (user.getTypeUser() == null) {
                user.setTypeUser(TypeUser.NORMAL_USER.getName());
                userRepository.saveNormalUser(result);
            } else {
                userRepository.saveAdmin(result);
            }
            return objectMapper.writeValueAsString(user);
        }
        return null;
    }

    private boolean checkDuplicateEmail(String email) {
        List<String> emails = userRepository.getAllUserEmails();
        return !emails.contains(email);
    }

    public String updateUser(String jsonData) throws JsonProcessingException {
        User user =  objectMapper.readValue(jsonData, User.class);
        System.out.println(user.getName()+" "+user.getAge());
        Integer result = userRepository.updateUser(user.getName(), user.getLastName(), user.getEmail(), user.getIdentification(), user.getPhoneNumber(), user.getAddress(), user.getAge(), user.getId());
        return objectMapper.writeValueAsString(result);
    }

    public boolean deleteUser(Long id) throws JsonProcessingException {
        ItineraryRepository itineraryRepository = new ItineraryRepository();
        Itinerary itinerary =  itineraryRepository.getItineraryByUserId(id);
        itineraryRepository.deleteItinerary(itinerary.getId());
        Integer result = userRepository.deleteUser(id);
        return result == 1;
    }

    public String getLogin(String email, String password) throws JsonProcessingException {
        User returnedUser = userRepository.getLogin(email);
        if(hashingService.comparePass(password, returnedUser.getPassword())) {
            return objectMapper.writeValueAsString(returnedUser);
        }
        User wrongPassUser = new User();
        wrongPassUser.setName("wrong");
        return objectMapper.writeValueAsString(wrongPassUser);
    }

    public boolean forgetPassword(String email){
        String tempPass = createTempPass(8);
        emailService.sendEmail(email, "Olvidó su contraseña Art City Tour", getTempPass(tempPass));
        return userRepository.changePassword(email, hashingService.hashPass(tempPass));
    }

    public boolean changePassword(String email, String currentPass, String newPass) throws JsonProcessingException {
        String isCorrect = getLogin(email, currentPass);
        User checkUser = objectMapper.readValue(isCorrect, User.class);
        if (checkUser.getName() != "wrong"){
            userRepository.changePassword(email, hashingService.hashPass(newPass));
            return true;
        }
        return false;
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

    public Grid getGrid() {
        List<String> columns = Arrays.asList("ID", "Nombre", "Apellido", "Correo", "Documento de Identidad", "Tipo de Usuario");
        List<List<String>> rows  = getRows();
        return new Grid(columns, rows);
    }

    private List<List<String>> getRows() {
        List<User> users = userRepository.getAll();
        List<List<String>> rows = new ArrayList<>();
        for (User user : users){
            List<String> row = new ArrayList<>();
            row.add(String.valueOf(user.getId()));
            row.add(user.getName());
            row.add(user.getLastName());
            row.add(user.getEmail());
            row.add(user.getIdentification());
            row.add(user.getTypeUser());
            rows.add(row);
        }
        return rows;
    }
}
