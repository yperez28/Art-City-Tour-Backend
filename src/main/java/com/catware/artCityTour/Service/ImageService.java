package com.catware.artCityTour.Service;

import com.catware.artCityTour.Constants.Constants;
import com.catware.artCityTour.Model.Image;
import com.catware.artCityTour.Repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<Image> getImagesByEditionId(Long editionId){
        return imageRepository.getImagesByEditionId(editionId);
    }

    public Image getImageById(Long imageId) {
        return imageRepository.getImageById(imageId);
    }

    public String getLinkToSaveInDB(String googleDriveShareLink){
        String[] imgLinkSplit = googleDriveShareLink.split("/");
        String id = imgLinkSplit[imgLinkSplit.length-2];
        return Constants.VIEW_LINK + id;
    }

    public String getImageLogin() {
        return imageRepository.getLoginImage();
    }
}
