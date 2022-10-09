package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Constants.Constants;
import com.catware.artCityTour.Service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping(value = "/images")
public class ImagesController {

    @Autowired
    private ImageService imageService;

    @CrossOrigin
    @RequestMapping(value = "/getLogin", method = RequestMethod.GET)
    public String loginImagePath(){
        return imageService.getImageLogin();
    }
}
