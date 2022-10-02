package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Repository.EditionRepository;
import com.catware.artCityTour.Repository.SponsorRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EditionService {

    //lista de todas las ediciones que se cargue cuando se inicie el proyecto -- clase intermedia
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EditionRepository editionRepository;
    @Autowired
    private SponsorRepository sponsorRepository;

    public String getAll() throws JsonProcessingException {
        List<Edition> editions = editionRepository.getAll(); //claseIntermediaMemoria.getAll()
        for (Edition edition: editions) {
            edition.setSponsors(sponsorRepository.getSponsorsByEdition(edition.getId()));
        }
        return objectMapper.writeValueAsString(editions);
    }

    public String getEditionById(Long id) throws JsonProcessingException {
        Edition edition = editionRepository.getEditionById(id);
        edition.setSponsors(sponsorRepository.getSponsorsByEdition(id));
        return objectMapper.writeValueAsString(edition);
    }

    public String getCurrentEdition() throws JsonProcessingException {
        Edition edition = editionRepository.getCurrentEdition();
        edition.setSponsors(sponsorRepository.getSponsorsByEdition(edition.getId()));
        return objectMapper.writeValueAsString(edition);
    }

}
