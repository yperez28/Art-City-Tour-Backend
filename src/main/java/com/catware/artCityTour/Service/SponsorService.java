package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Sponsor;
import com.catware.artCityTour.Repository.SponsorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SponsorService {

    @Autowired
    private SponsorRepository sponsorRepository;
    @Autowired
    private ImageService imageService;

    public List<Sponsor> getSponsorByEditionId(Long editionId){
        List<Sponsor> sponsors = sponsorRepository.getSponsorsByEdition(editionId);
        for (Sponsor s: sponsors){
            s.setPhoto(imageService.getImageById(s.getImageId()).getDrivePath());
        }
        return sponsors;
    }
}
