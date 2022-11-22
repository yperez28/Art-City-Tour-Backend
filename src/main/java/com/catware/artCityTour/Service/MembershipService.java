package com.catware.artCityTour.Service;
import com.catware.artCityTour.Model.Membership;
import com.catware.artCityTour.Repository.MembershipRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class MembershipService {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private MembershipRepository membershipRepository;

    @Autowired
    private ImageService imageService;

    public String getAll() throws JsonProcessingException {
        List<Membership> membership = membershipRepository.getAll();
        for (Membership mem:membership) {
            mem.setPhoto(imageService.getImageById(mem.getImageId()));
        }
        return objectMapper.writeValueAsString(membership);
    }

    public String getMembershipById(Long id) throws JsonProcessingException {
        Membership membership = membershipRepository.getMembershipById(id);
        membership.setPhoto(imageService.getImageById(membership.getImageId()));
        return objectMapper.writeValueAsString(membership);
    }

    public String getPrincipalMembership() throws JsonProcessingException {
        Membership membership = membershipRepository.getPrincipalMembership();
        return imageService.getImageById(membership.getImageId()).getDrivePath();
    }

    public String saveMembershipxUser(Long userId, Long membershipId) throws JsonProcessingException {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.MONTH, 1);
        Date expiration = c.getTime();
        Integer result = membershipRepository.saveMembershipxUser(userId, membershipId, dateFormat.format(currentDate), dateFormat.format(expiration));
        return objectMapper.writeValueAsString(result);
    }

    public String updateMembershipxUser(Long id, String startDate, String endDate) throws JsonProcessingException {
        Integer result = membershipRepository.updateMembershipxUser(id, startDate, endDate);
        return objectMapper.writeValueAsString(result);
    }

    public String deleteMembershipxUser(Long id) throws JsonProcessingException {
        Integer result = membershipRepository.deleteMembershipxUser(id);

        return objectMapper.writeValueAsString(result);
    }
}
