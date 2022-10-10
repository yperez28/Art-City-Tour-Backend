package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Reservation;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ReservationRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Integer saveReservation(Long placeId, String identification, String age, String name, String lastName, String email, String phoneNumber, Boolean isFirstTime, Long userId, List<Long> companionIds) {
        try {
            String query = "INSERT INTO reservation (place_id, identification, age, name, lastname, email, phone_number, is_first_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING id";
            PreparedStatement statement = connection.prepareStatement(query);
            Reservation reservation = new Reservation();

            statement.setLong(1, placeId);
            statement.setString(2, identification);
            statement.setString(3, age);
            statement.setString(4, name);
            statement.setString(5, lastName);
            statement.setString(6, email);
            statement.setString(7, phoneNumber);
            statement.setBoolean(8, isFirstTime);

            ResultSet resultSet = statement.executeQuery(); // returns the id of the new reservation
            Integer result = null;
            if (resultSet.next()) {
                // reservation is related to the companions and to user
                String userQuery = "INSERT INTO reservationxuser (user_id, reservation_id) VALUES (?, ?)";
                PreparedStatement userStatement = connection.prepareStatement(userQuery);
                userStatement.setLong(1, userId);
                userStatement.setLong(2, resultSet.getLong(1));
                userStatement.executeUpdate();

                for(Long id:companionIds) {
                    String companionQuery = "INSERT INTO companionxreservation (reservation_id, companion_id) VALUES (?, ?)";
                    PreparedStatement companionStatement = connection.prepareStatement(companionQuery);
                    companionStatement.setLong(1, resultSet.getLong(1));
                    companionStatement.setLong(2, id);
                    result = companionStatement.executeUpdate();
                }
            }

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Reservation> getAll() {
        try {
            String query = "SELECT * FROM reservation";
            List<Reservation> reservations = new ArrayList<>();
            PreparedStatement statement;

            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Reservation reservation = new Reservation();

                    reservation.setId(resultSet.getLong(1));
                    reservation.setPlaceId(resultSet.getLong(2));
                    reservation.setIdentification(resultSet.getString(3));
                    reservation.setAge(resultSet.getString(4));
                    reservation.setName(resultSet.getString(5));
                    reservation.setLast_name(resultSet.getString(6));
                    reservation.setEmail(resultSet.getString(7));
                    reservation.setPhoneNumber(resultSet.getString(8));
                    reservation.setIsFirstTime(resultSet.getBoolean(9));

                    reservations.add(reservation);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return reservations;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Integer updateReservation() {
        return 0;
    }

    public Integer deleteReservation(Long id) {
        try {
            String userQuery = "DELETE FROM reservationxuser WHERE reservation_id=?";
            String mainQuery = "DELETE FROM reservation WHERE id=?";
            PreparedStatement userStatement = connection.prepareStatement(userQuery);
            PreparedStatement mainStatement = connection.prepareStatement(mainQuery);

            userStatement.setLong(1, id);
            mainStatement.setLong(1, id);
            userStatement.executeUpdate();
            Integer result = mainStatement.executeUpdate();

            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Reservation> getReservationByUser(Long id) {
        String query = "SELECT * FROM reservation INNER JOIN reservationxuser ON reservation.id = reservationxuser.reservation_id WHERE reservationxuser.user_id = ?";
        List<Reservation> reservations = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(resultSet.getLong(1));
                reservation.setPlaceId(resultSet.getLong(2));
                reservation.setIdentification(resultSet.getString(3));
                reservation.setAge(resultSet.getString(4));
                reservation.setName(resultSet.getString(5));
                reservation.setLast_name(resultSet.getString(6));
                reservation.setEmail(resultSet.getString(7));
                reservation.setPhoneNumber(resultSet.getString(8));
                reservation.setIsFirstTime(resultSet.getBoolean(9));
                reservation.setUserId(resultSet.getLong(10));

                reservations.add(reservation);
            }

            return reservations;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
