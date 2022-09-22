package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Model.Sponsor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class EditionRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Edition> getAll(){
        try {
            String query = "SELECT * FROM edicion";
            PreparedStatement statement;
            List<Edition> editions = new ArrayList<>();

            try {
                 statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery();

                 while (resultSet.next()) {
                     Edition edition = new Edition();

                     edition.setId(resultSet.getLong(1));
                     edition.setName(resultSet.getString(2));
                     edition.setDetails(resultSet.getString(3));
                     edition.setDate(resultSet.getDate(4).toLocalDate());

                     editions.add(edition);
                 }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return editions;
        }catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Edition getEditionById(Long id){
        String query = "SELECT * FROM edicion WHERE \"ID\"=?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Edition edition = new Edition();

            while (resultSet.next()) {
                edition.setId(resultSet.getLong(1));
                edition.setName(resultSet.getString(2));
                edition.setDetails(resultSet.getString(3));
                edition.setDate(resultSet.getDate(4).toLocalDate());
            }

            return edition;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Sponsor> getSponsorsByEdition(Long id) {
        List<Sponsor> sponsors = new ArrayList<>();
        PreparedStatement statement;
        String query = "SELECT patrocinadorid, patrocinador.nombre, patrocinador.imagen FROM patrocinadorxedicion INNER JOIN patrocinador ON patrocinadorxedicion.patrocinadorid = patrocinador.\"ID\" WHERE edicionid = ?";

        try {
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();

                while(resultSet.next()) {
                    Sponsor sponsor = new Sponsor();
                    String sponsorName = resultSet.getString(2);
                    Blob blobImage = resultSet.getBlob(3);
                    byte[] byteImage = blobImage.getBytes(1, (int)blobImage.length());
                    FileOutputStream file = new FileOutputStream("../Img/" + sponsorName + ".jpg");
                    file.write(byteImage);
                    file.close();

                    sponsor.setId(resultSet.getLong(1));
                    sponsor.setName(sponsorName);

                    sponsors.add(sponsor);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return sponsors;
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }
}
