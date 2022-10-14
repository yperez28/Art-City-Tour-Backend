package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.Companion;
import com.catware.artCityTour.Repository.CompanionRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanionService {

    @Autowired
    private CompanionRepository companionRepository;

    public Long saveCompanion(String identification, String age, String name, String lastName) {
        Long idCompanion = companionRepository.saveCompanion(identification, age, name, lastName);

        return idCompanion;
    }

    public Integer deleteCompanion (Long id) throws JsonProcessingException {

        return companionRepository.deleteCompanion(id);
    }

    public List<Companion> getCompanionByUser(Long id) throws JsonProcessingException {
        List<Companion> companionList = companionRepository.getCompanionByUser(id);

        return companionList;
    }

    public List<Companion> getCompanionByReservation(Long id) throws JsonProcessingException {
        List<Companion> companions = companionRepository.getCompanionByReservation(id);

        return companions;
    }
}
