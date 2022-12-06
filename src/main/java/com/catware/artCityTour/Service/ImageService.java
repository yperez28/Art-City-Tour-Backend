package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.AdminSections;
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

    public String deleteImagesByEdition(Long editionId){
        return String.valueOf(imageRepository.deleteImagesByEdition(editionId));
    }

    public Long createImage(Image image){
        String drivePath = getLinkToSaveInDB(image.getDrivePath());
        return imageRepository.createImage(image.getName(), drivePath);
    }

    public int updateImage(Image image){

        Image current = imageRepository.getImageById(image.getImageId());
        if (!current.getDrivePath().equals(image.getDrivePath())){
            String link = getLinkToSaveInDB(image.getDrivePath());
            image.setDrivePath(link);
        }
        return imageRepository.updateImage(image.getImageId(), image.getName(), image.getDrivePath());
    }

    public int createImageForEdition(Long editionId, Long imageId){
        return imageRepository.createImageForEdition(editionId, imageId);
    }

    public String getImageLogin() {
        return imageRepository.getImageByName("Login");
    }

    public String getPrincipalPage(){
        return imageRepository.getImageByName("Principal Page");
    }

    public String getAdminPH(AdminSections sectionPH) {

        switch (sectionPH){
            case PLACES:
                return imageRepository.getImageByName("Lugares");
            case SPONSORS:
                return imageRepository.getImageByName("Patrocinadores");
            case NEWS:
                return imageRepository.getImageByName("Noticias");
            case USERS:
                return imageRepository.getImageByName("Usuarios");
            case EDITIONS:
                return imageRepository.getImageByName("Ediciones");
            default:
                return "Not Image Found";
        }
    }

    public String getLinkToSaveInDB(String googleDriveShareLink){
        System.out.println(googleDriveShareLink + " link");
        String[] imgLinkSplit = googleDriveShareLink.split("/");
        String id = imgLinkSplit[imgLinkSplit.length-2];
        return "https://drive.google.com/uc?id=" + id;
    }
}
