package com.catware.artCityTour.Controller;

import com.catware.artCityTour.Constants.Constants;
import org.springframework.stereotype.Service;

@Service
public class ImagesController {

    public String getLinkToSaveInDB(String googleDriveShareLink){
        String[] imgLinkSplit = googleDriveShareLink.split("/");
        String id = imgLinkSplit[imgLinkSplit.length-2];
        return Constants.VIEW_LINK + id;
    }
}
