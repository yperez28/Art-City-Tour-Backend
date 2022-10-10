package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Companion;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CompanionRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Long saveCompanion(String identification, String age, String name, String lastName) {
        try {
            String query = "INSERT INTO companion (identification, age, name, last_name) VALUES (?, ?, ?, ?) RETURNING id";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setString(1, identification);
            statement.setString(2, age);
            statement.setString(3, name);
            statement.setString(4, lastName);
            ResultSet resultSet = statement.executeQuery();
            Long result = null;

            if (resultSet.next()) {
                result = resultSet.getLong(1);
            }

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteCompanion(Long id) {
        try {
            String reservationQuery = "DELETE FROM companionxreservation WHERE companion_id = ?";
            String companionQuery = "DELETE FROM companion WHERE id=?";
            PreparedStatement reservationStatement = connection.prepareStatement(reservationQuery);
            PreparedStatement companionStatement = connection.prepareStatement(companionQuery);

            reservationStatement.setLong(1, id);
            companionStatement.setLong(1, id);

            reservationStatement.executeUpdate();
            Integer result = companionStatement.executeUpdate();

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Companion> getCompanionByUser(Long id) {
        try {
            String query = "SELECT * FROM companion INNER JOIN companionxreservation ON companion.id = companionxreservation.companion_id WHERE companionxreservation.reservation_id=?";
            PreparedStatement statement;
            List<Companion> companionList = new ArrayList<>();

            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();

                while(resultSet.next()) {
                    Companion companion = new Companion();
                    companion.setId(resultSet.getLong(1));
                    companion.setIdentification(resultSet.getString(2));
                    companion.setAge(resultSet.getString(3));
                    companion.setName(resultSet.getString(4));
                    companion.setLast_name(resultSet.getString(5));

                    companionList.add(companion);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return companionList;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public List<Companion> getCompanionByReservation(Long id) {
        try {
            String query = "SELECT * FROM companion INNER JOIN companionxreservation ON companion.id = companionxreservation.companion_id WHERE companionxreservation.reservation_id=?";
            List<Companion> companions = new ArrayList<>();

            try {
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Companion companion = new Companion();

                    companion.setId(resultSet.getLong(1));
                    companion.setIdentification(resultSet.getString(2));
                    companion.setAge(resultSet.getString(3));
                    companion.setName(resultSet.getString(4));
                    companion.setLast_name(resultSet.getString(5));

                    companions.add(companion);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return companions;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }
}
