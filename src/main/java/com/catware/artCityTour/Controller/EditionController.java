package com.catware.artCityTour.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EditionController {

    @RequestMapping(value = "/edicion/create", method = RequestMethod.POST)
    public String createEdition(){
        return "POST La Edición";
    }

    @RequestMapping(value = "/edicion/getAll", method = RequestMethod.GET)
    public String getEdition(){
        return "GET La Edición";
    }

    @RequestMapping(value = "/edicion/update", method = RequestMethod.PUT)
    public String updateEdition(){
        return "UPDATE La Edición";
    }

    @RequestMapping(value = "/edicion/delete", method = RequestMethod.DELETE)
    public String deleteEdition(){
        return "DELETE La Edición";
    }
}
