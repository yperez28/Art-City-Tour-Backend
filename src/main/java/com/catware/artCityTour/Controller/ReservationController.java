package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.ReservationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.IOException;

@RestController
@RequestMapping(value="/reservation")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @CrossOrigin
    @RequestMapping(value="/create", method= RequestMethod.GET)
    public String createReservation(@RequestBody String jsonData) throws IOException, WriterException, MessagingException {
        return reservationService.saveReservation(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value="/getAll", method=RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return reservationService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value="/update", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateReservation(@RequestBody String jsonData) throws JsonProcessingException {
        return reservationService.updateReservation(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value="/delete", method = RequestMethod.GET)
    public String deleteReservation(@RequestParam Long id) throws JsonProcessingException {
        return reservationService.deleteReservation(id);
    }

    @CrossOrigin
    @RequestMapping(value="/getAllByUser", method = RequestMethod.GET)
    public String getByUser(@RequestParam Long idUser) throws JsonProcessingException {
        return reservationService.getReservationByUser(idUser);
    }

    @CrossOrigin
    @RequestMapping(value="/getActiveByUser", method = RequestMethod.GET)
    public String getActiveByUser(@RequestParam Long userId) throws JsonProcessingException {
        return reservationService.getActiveByUser(userId);
    }

    @CrossOrigin
    @RequestMapping(value="/getRecordByUser", method = RequestMethod.GET)
    public String getRecordByUser(@RequestParam Long userId) throws JsonProcessingException {
        return reservationService.getRecordByUser(userId);
    }
}
