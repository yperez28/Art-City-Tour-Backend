package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Sponsor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}
