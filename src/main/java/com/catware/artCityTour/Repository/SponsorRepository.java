package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Sponsor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SponsorRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Sponsor> getSponsorsByEdition(Long id) {
        List<Sponsor> sponsors = new ArrayList<>();
        PreparedStatement statement;
        String query = "SELECT * FROM sponsor INNER JOIN sponsorxedition ON sponsor.id = sponsorxedition.sponsorid WHERE editionid = ?";

        try {
            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();

                while(resultSet.next()) {
                    Sponsor sponsor = new Sponsor();

                    sponsor.setId(resultSet.getLong(1));
                    sponsor.setName(resultSet.getString(2));
                    sponsor.setImageId(resultSet.getLong(3));
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

    public int saveSponsorForEdition(Long editionId, Long sponsorId){
        String query = "INSERT INTO sponsorxedition (editionid, sponsorid) values(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            statement.setLong(2, sponsorId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int createSponsor(String name, Long image_id){
        String query = "INSERT INTO sponsor (name, image_id) values(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setLong(2, image_id);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteSponsorsByEdition(Long editionId){
        String query = "DELETE FROM sponsorxedition WHERE editionid = ?";
        try {
            PreparedStatement statement  = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<Sponsor> getAllSponsors() {
        String query = "SELECT * FROM sponsor";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            List<Sponsor> sponsors = new ArrayList<>();
            while (resultSet.next()){
                Sponsor sponsor = new Sponsor();
                sponsor.setId(resultSet.getLong(1));
                sponsor.setName(resultSet.getString(2));
                sponsor.setImageId(resultSet.getLong(3));
                sponsors.add(sponsor);
            }
            return sponsors;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Long> getSponsorInEditionById(Long valueId) {
        String query = "SELECT * FROM sponsorxedition WHERE sponsorid = ?";
        List<Long> ids = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, valueId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                ids.add(resultSet.getLong(1));
            }
            return ids;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteSponsorXEditionById(Long id) {
        String query = "DELETE FROM sponsorxedition WHERE id = ?";
        try {
            PreparedStatement statement  = connection.prepareStatement(query);
            statement.setLong(1, id);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteSponsorById(Long valueId) {
        String query = "DELETE FROM sponsor WHERE id = ?";
        try {
            PreparedStatement statement  = connection.prepareStatement(query);
            statement.setLong(1, valueId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
