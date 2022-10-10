package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Sponsor;
import com.catware.artCityTour.Repository.SponsorRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SponsorService {

    @Autowired
    private SponsorRepository sponsorRepository;
    @Autowired
    private ImageService imageService;
    @Autowired
    private ObjectMapper objectMapper;

    public List<Sponsor> getSponsorByEditionId(Long editionId){
        List<Sponsor> sponsors = sponsorRepository.getSponsorsByEdition(editionId);
        for (Sponsor sponsor: sponsors){
            sponsor.setImage(imageService.getImageById(sponsor.getImageId()));
        }
        return sponsors;
    }

    public int saveSponsorForEdition(Long editionId, Long sponsorId){
        return sponsorRepository.saveSponsorForEdition(editionId, sponsorId);
    }

    public String deleteSponsorsByEdition(Long editionId){
        return String.valueOf(sponsorRepository.deleteSponsorsByEdition(editionId));
    }

    public String createSponsor(String jsonData) throws JsonProcessingException {
        Sponsor sponsor = objectMapper.readValue(jsonData, Sponsor.class);
        sponsor.setImageId(imageService.createImage(sponsor.getImage()));
        int result = sponsorRepository.createSponsor(sponsor.getName(), sponsor.getImageId());
        if (result > 0) {
            return objectMapper.writeValueAsString(sponsor);
        }
        return "";
    }
}
