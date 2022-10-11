package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.time.LocalDate;
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
                     edition.setCurrent(resultSet.getBoolean(5));
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
                edition.setCurrent(resultSet.getBoolean(5));
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
                edition.setCurrent(resultSet.getBoolean(5));
            }

            return edition;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Long createEdition(String name, String details, LocalDate date, Boolean current){
        String query = "INSERT INTO edition (name, details, date, current) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, details);
            statement.setDate(3, Date.valueOf(date));
            statement.setBoolean(4, current);
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

    public int updateEdition(Long id, String name, String details, LocalDate date, Boolean current) {
        String query = "UPDATE edition set name = ?, details = ?, date = ?, current = ? WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, details);
            statement.setDate(3, Date.valueOf(date));
            statement.setBoolean(4, current);
            statement.setLong(5, id);
            return statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int updateCurrent(){
        String query = "UPDATE edition SET current = false";
        try {
            PreparedStatement statement  = connection.prepareStatement(query);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteEdition(Long editionId){
        String query = "DELETE FROM edition WHERE id = ?";
        try {
            PreparedStatement statement  = connection.prepareStatement(query);
            statement.setLong(1, editionId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
