package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Repository.EditionRepository;
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


    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createEdition(){
        return "POST La Edición";
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getEdition(){
        return "GET La Edición";
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public String updateEdition(){
        return "UPDATE La Edición";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public String deleteEdition(){
        return "DELETE La Edición";
    }

    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getEditionById(@RequestParam Long id) throws JsonProcessingException {
        return editionService.getEditionById(id);
    }
}
