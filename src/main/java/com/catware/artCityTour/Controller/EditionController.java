package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.EditionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping(value = "/edition")
public class EditionController {

    @Autowired
    private EditionService editionService;

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getEdition() throws JsonProcessingException {
        return editionService.getAll();
    }

    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getEditionById(@RequestParam Long id) throws JsonProcessingException {
        return editionService.getEditionById(id);
    }
}
