package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Model.Sponsor;
import com.catware.artCityTour.Service.SponsorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/sponsor")
public class SponsorController {

    @Autowired
    private SponsorService sponsorService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createSponsor(@RequestBody String jsonData) throws JsonProcessingException {
        return sponsorService.createSponsor(jsonData);
    }
    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateSponsor(@RequestBody String jsonData) throws JsonProcessingException {
        return sponsorService.updateSponsor(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean deleteSponsor(@RequestParam Long id) throws JsonProcessingException {
        return sponsorService.deleteSponsor(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public Sponsor getSponsorById(@RequestParam Long id) throws JsonProcessingException {
        return sponsorService.getSponsorById(id);
    }


}
