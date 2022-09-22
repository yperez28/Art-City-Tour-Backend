package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Itinerary;
import com.catware.artCityTour.Model.Membership;
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
            String query = "SELECT * FROM usuario";
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
        String query = "SELECT * FROM usuario WHERE \"ID\" = ?";

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
            }

            return user;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Membership> getMembershipsByUser(Long id) {
        try {
            List<Membership> memberships = new ArrayList<>();
            PreparedStatement statement;
            String query = "SELECT membresiaid, membresia.nombre, membresia.detalles, membresia.imagen FROM membresiaxpersona INNER JOIN membresia ON membresiaxpersona.membresiaid = membresia.\"ID\" WHERE usuarioid = ?";

            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Membership membership =  new Membership();
                    membership.setId(resultSet.getLong(1));
                    membership.setNombre(resultSet.getString(2));
                    membership.setDetalles(resultSet.getString(3));

                    memberships.add(membership);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return memberships;

        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Integer saveUser(String name, String lastname, String email, String password) {
        try {
            String query = "INSERT INTO usuario (nombre, apellido, correo, contrasenna) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);

            Integer result = statement.executeUpdate();

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer updateUser (String name, String lastname, String email, String password, Long id) {
        try {
            String query = "UPDATE usuario SET nombre=?, apellido=?, correo=?, contrasenna=? WHERE \"ID\" = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setLong(5, id);

            Integer result = statement.executeUpdate();

            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteUser(Long id) {
        try {
            String query = "DELETE FROM usuario WHERE \"ID\" = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            Integer result = statement.executeUpdate();
            connection.close();

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
