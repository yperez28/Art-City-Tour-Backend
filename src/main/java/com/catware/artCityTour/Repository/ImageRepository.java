package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Image;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ImageRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Image getImageById(Long imageId){
        String query = "SELECT * FROM image WHERE image_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, imageId);
            ResultSet resultSet = statement.executeQuery();
            Image image = new Image();

            while (resultSet.next()) {
                image.setImageId(resultSet.getLong(1));
                image.setName(resultSet.getString(2));
                image.setDrivePath(resultSet.getString(3));
            }

            return image;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Image> getImagesByEditionId(Long editionId){
        try {
            String query = "SELECT * FROM image INNER JOIN images_edition ON image.image_id = images_edition.image_id WHERE edition_id=?";
            PreparedStatement statement;
            List<Image> images = new ArrayList<>();

            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, editionId);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    images.add(getImageById(resultSet.getLong(1)));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return images;
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public int deleteImagesByEdition(Long editionId){
        String query = "DELETE FROM images_edition WHERE edition_id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
