package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Repository.EditionRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EditionService {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EditionRepository editionRepository;

    public String getAll() throws JsonProcessingException {
        List<Edition> editions = editionRepository.getAll();
        for (Edition edition: editions) {
            edition.setSponsors(editionRepository.getSponsorsByEdition(edition.getId()));
        }

        return objectMapper.writeValueAsString(editions);
    }

    public String getEditionById(Long id) throws JsonProcessingException {
        Edition edition = editionRepository.getEditionById(id);
        edition.setSponsors(editionRepository.getSponsorsByEdition(edition.getId()));

        return objectMapper.writeValueAsString(edition);
    }

}
