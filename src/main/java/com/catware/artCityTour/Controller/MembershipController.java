package com.catware.artCityTour.Controller;
import com.catware.artCityTour.Service.EditionService;
import com.catware.artCityTour.Service.MembershipService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/membership")
public class MembershipController {

    @Autowired
    MembershipService membershipService;

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return membershipService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getMembershipById(@RequestParam Long id) throws JsonProcessingException {
        return membershipService.getMembershipById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getPrincipal", method = RequestMethod.GET)
    public String getPrincipalImage() throws JsonProcessingException {
        return membershipService.getPrincipalMembership();
    }


}
