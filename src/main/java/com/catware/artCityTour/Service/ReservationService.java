package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Companion;
import com.catware.artCityTour.Model.Reservation;
import com.catware.artCityTour.Repository.ReservationRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReservationService {

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private CompanionService companionService;
    @Autowired
    private EmailService emailService;

    public String saveReservation(String jsonData) throws JsonProcessingException {
        Reservation reservation = objectMapper.readValue(jsonData, Reservation.class);
        List<Long> companionIds = new ArrayList<>();
        for (Companion companion:reservation.getCompanion()) {
            Long id = companionService.saveCompanion(companion.getIdentification(), companion.getAge(),
                    companion.getName(), companion.getLast_name());
            companionIds.add(id);
        }
        Integer result = reservationRepository.saveReservation(reservation.getPlaceId(), reservation.getIdentification(),
                reservation.getAge(), reservation.getName(), reservation.getLastName(), reservation.getEmail(),
                reservation.getPhoneNumber(), reservation.getIsFirstTime(), reservation.getUserId(), companionIds);

        if (result == 1) {
            String emailBody = "Hola\nGracias por reservar tu espacio en la edición en curso del Art City Tour."
                    + "A continuación puede encontar el código QR de la confirmación de entrada.\n";
            emailService.sendEmail(reservation.getEmail(), "Confirmación de reservación Art City Tour", emailBody);
        }

        return objectMapper.writeValueAsString(result);
    }

    public String getAll() throws  JsonProcessingException {
        List<Reservation> reservations = reservationRepository.getAll();

        for(Reservation reservation:reservations) {
            reservation.setCompanion(companionService.getCompanionByUser(reservation.getId()));
        }

        return objectMapper.writeValueAsString(reservations);
    }

    public String updateReservation(String jsonData) throws JsonProcessingException {
        Reservation reservation = objectMapper.readValue(jsonData, Reservation.class);
        List<Long> companionIds = new ArrayList<>();
        for (Companion companion:reservation.getCompanion()) {
            Long idCompanion = companionService.saveCompanion(companion.getIdentification(), companion.getAge(),
                    companion.getName(), companion.getLast_name());
            companionIds.add(idCompanion);
        }

        Integer result = reservationRepository.updateReservation(reservation.getId(), reservation.getIdentification(),
                reservation.getAge(), reservation.getName(), reservation.getLastName(), reservation.getEmail(),
                reservation.getPhoneNumber(), reservation.getIsFirstTime(), reservation.getPlaceId(),
                reservation.getUserId(), companionIds);

        return objectMapper.writeValueAsString(result);
    }

    public String deleteReservation(Long id) throws JsonProcessingException {
        List<Companion> companions = companionService.getCompanionByReservation(id);
        for (Companion companion:companions) {
            companionService.deleteCompanion(companion.getId());
        }
        Integer result = reservationRepository.deleteReservation(id);

        return objectMapper.writeValueAsString(result);
    }

    public String getReservationByUser(Long idUser) throws JsonProcessingException {
        List<Reservation> reservations = reservationRepository.getReservationByUser(idUser);

        for(Reservation reservation:reservations) {
            reservation.setCompanion(companionService.getCompanionByUser(reservation.getId()));
        }

        return objectMapper.writeValueAsString(reservations);
    }
}
