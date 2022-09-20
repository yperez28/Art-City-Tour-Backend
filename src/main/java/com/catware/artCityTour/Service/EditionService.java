package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Repository.EditionRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EditionService { //aquí va la lógica

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private EditionRepository editionRepository;

    public String getEditionById(Long id) throws JsonProcessingException {
        Edition edition = editionRepository.getEditionById(id);
        return objectMapper.writeValueAsString(edition);
    }

}
