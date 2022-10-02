package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Service.EditionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/edition")
public class EditionController {

    @Autowired
    private EditionService editionService;

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getEdition() throws JsonProcessingException {
        return editionService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getEditionById(@RequestParam Long id) throws JsonProcessingException {
        return editionService.getEditionById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getCurrent", method = RequestMethod.GET)
    public String getEditionById() throws JsonProcessingException {
        return editionService.getCurrentEdition();
    }
}
