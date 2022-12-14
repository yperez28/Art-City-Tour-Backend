package com.catware.artCityTour.Controller;
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

    @CrossOrigin
    @RequestMapping(value = "/createMembershipByUser", method=RequestMethod.GET)
    public String saveMembershipxUser(@RequestParam Long userId, @RequestParam Long membershipId)
            throws JsonProcessingException {
        return membershipService.saveMembershipxUser(userId, membershipId);
    }

    @CrossOrigin
    @RequestMapping(value = "/updateMembershipByUser", method=RequestMethod.GET)
    public String updateMembershipxUser(@RequestParam Long id, @RequestParam String startDate,
                                        @RequestParam String endDate ) throws JsonProcessingException {
        return membershipService.updateMembershipxUser(id, startDate, endDate);
    }

    @CrossOrigin
    @RequestMapping(value="/deleteMembershipByUser", method = RequestMethod.GET)
    public String deleteMembershipxUser(@RequestParam Long id) throws JsonProcessingException {
        return membershipService.deleteMembershipxUser(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getByUserId", method = RequestMethod.GET)
    public String getMembershipByUser(@RequestParam Long userId) throws JsonProcessingException {
        return membershipService.getMembershipByUser(userId);
    }

}
