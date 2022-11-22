package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Image;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.*;
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

    public int updateImage(Long id, String name, String drivePath){
        String query = "UPDATE image set name = ?, drive_path = ? WHERE image_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, drivePath);
            statement.setLong(3, id);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public long createImage(String name, String drivePath){
        String query = "INSERT INTO image (name, drive_path) values(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, drivePath);
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getLong(1);
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int createImageForEdition(Long editionId, Long imageId){
        String query = "INSERT INTO images_edition (edition_id, image_id) values(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            statement.setLong(2, imageId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteImagesByEdition(Long editionId){
        String query = "DELETE FROM images_edition WHERE edition_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public String getImageByName(String name) {
        String query = "SELECT drive_path FROM image WHERE name=?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, "Login");
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            return resultSet.getString(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
