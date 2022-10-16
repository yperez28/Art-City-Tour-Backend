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

    public String deleteImagesByEdition(Long editionId){
        return String.valueOf(imageRepository.deleteImagesByEdition(editionId));
    }

    public Long createImage(Image image){
        return imageRepository.createImage(image.getName(), image.getDrivePath());
    }

    public int updateImage(Image image){
        return imageRepository.updateImage(image.getImageId(), image.getName(), image.getDrivePath());
    }

    public int createImageForEdition(Long editionId, Long imageId){
        return imageRepository.createImageForEdition(editionId, imageId);

    }

}
