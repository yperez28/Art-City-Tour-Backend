package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository {

    private final Connection connection = DBCConnection.getConnection();
    public List<User> getAll() {
        try {
            String query = "SELECT * FROM public.user";
            List<User> users = new ArrayList<>();
            PreparedStatement statement;

            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    User user = new User();

                    user.setId(resultSet.getLong(1));
                    user.setName(resultSet.getString(2));
                    user.setLastname(resultSet.getString(3));
                    user.setEmail(resultSet.getString(4));
                    user.setPassword(resultSet.getString(5));
                    user.setIdentification(resultSet.getString(6));
                    user.setPhoneNumber(resultSet.getString(7));
                    user.setAddress(resultSet.getString(8));
                    user.setAge(resultSet.getInt(9));
                    user.setImageId(resultSet.getLong(10));

                    users.add(user);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return users;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public User getUserById(Long id) {
        String query = "SELECT * FROM public.user WHERE id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            User user = new User();

            while(resultSet.next()) {
                user.setId(resultSet.getLong(1));
                user.setName(resultSet.getString(2));
                user.setLastname(resultSet.getString(3));
                user.setEmail(resultSet.getString(4));
                user.setPassword(resultSet.getString(5));
                user.setIdentification(resultSet.getString(6));
                user.setPhoneNumber(resultSet.getString(7));
                user.setAddress(resultSet.getString(8));
                user.setAge(resultSet.getInt(9));
                user.setImageId(resultSet.getLong(10));
            }

            return user;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User saveUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age, Long imageId) {
        try {
            String query = "INSERT INTO public.user (name, lastname, email, password, identification, phone_number, address, age, image_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, identification);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setInt(8, age);
            statement.setLong(9, imageId);

            int result = statement.executeUpdate();
            User user = new User();
            if (result > 0) {
                user.setName(name);
                user.setLastname(lastname);
                user.setEmail(email);
                user.setPassword(password);
                user.setIdentification(identification);
                user.setPhoneNumber(phoneNumber);
                user.setAddress(address);
                user.setAge(age);
                user.setImageId(imageId);
            }

            return user;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer updateUser (String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age, Long imageId, Long id) {
        try {
            String query = "UPDATE public.user SET name=?, lastname=?, email=?, password=?, identification=?, phone_number=?, address=?, age=?, image_id=? WHERE id= ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, identification);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setInt(8, age);
            statement.setLong(9, imageId);
            statement.setLong(10, id);

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteUser(Long id) {
        try {
            String membershipQuery = "DELETE FROM membershipxuser WHERE userid = ?";
            String mainQuery = "DELETE FROM public.user WHERE id = ?";
            PreparedStatement mainStatement = connection.prepareStatement(mainQuery);
            PreparedStatement membershipStatement = connection.prepareStatement(membershipQuery);

            mainStatement.setLong(1, id);
            membershipStatement.setLong(1, id);
            membershipStatement.executeUpdate();
            Integer result = mainStatement.executeUpdate();
            connection.close();

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
