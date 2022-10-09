package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Reservation;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class ReservationRepository {

    private final Connection connection = DBCConnection.getConnection();

    public Reservation saveReservation(Integer placeId, String identification, String age, String name, String lastName, String email, String phoneNumber, Boolean isFirstTime) {
        try {
            String query = "INSERT INTO reservation (place_id, identification, age, name, lastname, email, phone_number, is_first_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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

            int result = statement.executeUpdate();
            if (result > 0) {
                reservation.setPlace_id(placeId);
                reservation.setIdentification(identification);
                reservation.setAge(age);
                reservation.setName(name);
                reservation.setLast_name(lastName);
                reservation.setEmail(email);
                reservation.setPhoneNumber(phoneNumber);
                reservation.setIsFirstTime(isFirstTime);
            }

            return reservation;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
