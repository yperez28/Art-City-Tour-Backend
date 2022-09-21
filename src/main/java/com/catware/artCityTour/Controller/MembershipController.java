package com.catware.artCityTour.Controller;
import com.catware.artCityTour.Service.EditionService;
import com.catware.artCityTour.Service.MembershipService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping(value = "/membership")
public class MembershipController {

    @Autowired
    MembershipService membershipService;

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return membershipService.getAll();
    }
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getMembershipById(@RequestParam Long id) throws JsonProcessingException {
        return membershipService.getMembershipById(id);
    }

}
