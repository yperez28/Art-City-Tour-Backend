package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Reservation;
import com.catware.artCityTour.Repository.ReservationRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private ReservationRepository reservationRepository;

    public String saveReservation(String jsonData) throws JsonProcessingException {
        Reservation reservation = objectMapper.readValue(jsonData, Reservation.class);
        Reservation result = reservationRepository.saveReservation(reservation.getPlace_id(), reservation.getIdentification(),
                reservation.getAge(), reservation.getName(), reservation.getLast_name(), reservation.getEmail(), reservation.getPhoneNumber(), reservation.getIsFirstTime());

        return objectMapper.writeValueAsString(result);
    }
}
