package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Model.Sponsor;
import com.catware.artCityTour.Service.EditionService;
import com.catware.artCityTour.Service.SponsorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/sponsor")
public class SponsorController {

    @Autowired
    private SponsorService sponsorService;

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createSponsor(@RequestBody String jsonData) throws JsonProcessingException {
        return sponsorService.createSponsor(jsonData);
    }
    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateSponsor(@RequestBody String jsonData) throws JsonProcessingException {
        return sponsorService.updateSponsor(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Boolean deleteSponsor(@RequestParam Long id) throws JsonProcessingException {
        return sponsorService.deleteSponsor(id);
    }


}
