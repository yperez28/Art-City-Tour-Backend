package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Edition;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class EditionRepository {
    private final Connection connection = DBCConnection.getConnection();
    public List<Edition> getAll(){
        try {
            String query = "SELECT * FROM edition";
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
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Edition getEditionById(Long id){
        String query = "SELECT * FROM edition WHERE id = ?";

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


    public Edition getCurrentEdition() {
        String query = "SELECT * FROM edition WHERE current=true";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
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

}
