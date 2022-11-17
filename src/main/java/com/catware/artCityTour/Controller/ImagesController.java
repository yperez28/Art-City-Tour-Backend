package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Constants.Constants;
import com.catware.artCityTour.Model.AdminSections;
import com.catware.artCityTour.Service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

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

    @CrossOrigin
    @RequestMapping(value = "/getAdminPH", method = RequestMethod.GET)
    public String getAdminPH(@RequestParam String sectionPH){
        return imageService.getAdminPH(AdminSections.valueOf(sectionPH));
    }
}
