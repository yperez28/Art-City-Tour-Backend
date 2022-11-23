package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.*;
import com.catware.artCityTour.Repository.EditionRepository;
import com.catware.artCityTour.Repository.RouteRepository;
import com.catware.artCityTour.Repository.SponsorRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
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
        List<Edition> editions = editionRepository.getAll();
        for (Edition edition: editions) {
            edition.setSponsors(sponsorService.getSponsorByEditionId(edition.getId()));
            edition.setImages(imageService.getImagesByEditionId(edition.getId()));
        }
        Collections.reverse(editions);
        return objectMapper.writeValueAsString(editions);
    }

    public String getEditionById(Long id) throws JsonProcessingException {
        Edition edition = getEditionByIdObject(id);
        return objectMapper.writeValueAsString(edition);
    }

    public Edition getEditionByIdObject(Long id){
        Edition edition = editionRepository.getEditionById(id);
        edition.setSponsors(sponsorService.getSponsorByEditionId(edition.getId()));
        edition.setImages(imageService.getImagesByEditionId(id));
        return edition;
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

        for (Sponsor sponsor: edition.getSponsors()) {
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

    public boolean deleteEdition(Long id) throws JsonProcessingException {
        imageService.deleteImagesByEdition(id);
        sponsorService.deleteSponsorsByEdition(id);
        routeService.deleteRoute(id);
        Integer result = editionRepository.deleteEdition(id);
        return result == 1;
    }

    public Grid getGrid() {
        List<String> columns = getColumns();
        List<List<String>> rows = getRows();
        return new Grid(columns, rows);
    }

    private List<List<String>> getRows() {
        List<Edition> allEditions = getAllEditions();
        List<List<String>> rows = new ArrayList<>();
        for (Edition edition: allEditions){
            List<String> row = new ArrayList<>();
            row.add(String.valueOf(edition.getId()));
            row.add(edition.getName());
            row.add(edition.getDetails());
            row.add(String.valueOf(edition.getDate()));
            row.add(getSponsors(edition));
            row.add(edition.getCurrent() ? "Si" : "No");
            rows.add(row);
        }
        return rows;
    }

    private List<Edition> getAllEditions() {
        List<Edition> allEditions = editionRepository.getAll();
        allEditions.forEach(e -> e.setSponsors(sponsorService.getSponsorByEditionId(e.getId())));
        return allEditions;
    }

    private String getSponsors(Edition edition) {
        String sponsorsList = "";
        List<Sponsor> sponsorsByEdition = edition.getSponsors();
        if (sponsorsByEdition.size() == 0)
            return "";
        if (sponsorsByEdition.size() == 1){
            return sponsorsByEdition.get(0).getName();
        }
        for (Sponsor s: sponsorsByEdition){
            sponsorsList = sponsorsList + s.getName() + ", ";
        }
        return sponsorsList;
    }

    private List<String> getColumns() {
        return Arrays.asList("ID", "Nombre", "Detalles", "Fecha", "Patrocinadores", "Actual");
    }
}
