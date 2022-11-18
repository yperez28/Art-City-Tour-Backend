package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Model.Image;
import com.catware.artCityTour.Model.Sponsor;
import com.catware.artCityTour.Model.User;
import com.catware.artCityTour.Repository.EditionRepository;
import com.catware.artCityTour.Repository.RouteRepository;
import com.catware.artCityTour.Repository.SponsorRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EditionService {

    //lista de todas las ediciones que se cargue cuando se inicie el proyecto -- clase intermedia
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EditionRepository editionRepository;

    @Autowired
    private SponsorService sponsorService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private RouteService routeService;

    public String getAll() throws JsonProcessingException {
        List<Edition> editions = editionRepository.getAll(); //claseIntermediaMemoria.getAll()
        for (Edition edition: editions) {
            edition.setSponsors(sponsorService.getSponsorByEditionId(edition.getId()));
            edition.setImages(imageService.getImagesByEditionId(edition.getId()));
        }
        Collections.reverse(editions);
        return objectMapper.writeValueAsString(editions);
    }

    public String getEditionById(Long id) throws JsonProcessingException {
        Edition edition = editionRepository.getEditionById(id);
        edition.setSponsors(sponsorService.getSponsorByEditionId(edition.getId()));
        edition.setImages(imageService.getImagesByEditionId(id));
        return objectMapper.writeValueAsString(edition);
    }

    public String getCurrentEdition() throws JsonProcessingException {
        Edition edition = editionRepository.getCurrentEdition();
        edition.setSponsors(sponsorService.getSponsorByEditionId(edition.getId()));
        edition.setImages(imageService.getImagesByEditionId(edition.getId()));
        return objectMapper.writeValueAsString(edition);
    }

    public String createEdition(String jsonData) throws JsonProcessingException {
        Edition edition = objectMapper.readValue(jsonData, Edition.class);
        if(edition.getCurrent()){
            editionRepository.updateCurrent();
        }
        edition.setId( editionRepository.createEdition(edition.getName(), edition.getDetails(), edition.getDate(), edition.getCurrent()));

        for (Sponsor sponsor:edition.getSponsors()) {
            sponsorService.saveSponsorForEdition(edition.getId(), sponsor.getId());
        }
        for (Image image: edition.getImages()) {
            image.setImageId(imageService.createImage(image));
            imageService.createImageForEdition(edition.getId(),image.getImageId());
        }
        return objectMapper.writeValueAsString(edition);
    }

    public String updateEdition(String jsonData) throws JsonProcessingException {
        Edition edition = objectMapper.readValue(jsonData, Edition.class);
        if(edition.getCurrent()){
            editionRepository.updateCurrent();
        }
        editionRepository.updateEdition(edition.getId(), edition.getName(), edition.getDetails(), edition.getDate(), edition.getCurrent());

        sponsorService.deleteSponsorsByEdition(edition.getId());
        for (Sponsor sponsor:edition.getSponsors()) {
            sponsorService.saveSponsorForEdition(edition.getId(), sponsor.getId());
        }

        imageService.deleteImagesByEdition(edition.getId());
        for (Image image: edition.getImages()) {
            image.setImageId(imageService.createImage(image));
            imageService.createImageForEdition(edition.getId(),image.getImageId());
        }
        return objectMapper.writeValueAsString(edition);
    }

    public String deleteEdition(Long id) throws JsonProcessingException {
        imageService.deleteImagesByEdition(id);
        sponsorService.deleteSponsorsByEdition(id);
        routeService.deleteRoute(id);
        return String.valueOf(editionRepository.deleteEdition(id));
    }

}
