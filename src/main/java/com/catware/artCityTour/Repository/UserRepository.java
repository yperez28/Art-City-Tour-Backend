package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.TypeUser;
import com.catware.artCityTour.Model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.*;
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
                    if (getAdminUserByUserId(user.getId())){
                        user.setTypeUser(TypeUser.ADMIN.getName());
                    }else{
                        user.setTypeUser(TypeUser.NORMAL_USER.getName());
                    }
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
                if (getAdminUserByUserId(user.getId())){
                    user.setTypeUser(TypeUser.ADMIN.getName());
                }else{
                    user.setTypeUser(TypeUser.NORMAL_USER.getName());
                }
            }
            return user;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean getAdminUserByUserId(Long userId) {
        try {
            String userQuery = "SELECT * FROM admin WHERE user_id = ?";
            PreparedStatement mainStatement = connection.prepareStatement(userQuery);
            mainStatement.setLong(1, userId);
            ResultSet user = mainStatement.executeQuery();
            return user.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Long saveUser(String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age) {
        try {
            String query = "INSERT INTO public.user (name, lastname, email, password, identification, phone_number, address, age) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, identification);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setInt(8, age);
            statement.executeUpdate();
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

    public Integer updateUser (String name, String lastname, String email, String password, String identification, String phoneNumber, String address, Integer age, Long id) {
        try {
            String query = "UPDATE public.user SET name=?, lastname=?, email=?, password=?, identification=?, phone_number=?, address=?, age=? WHERE id= ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, identification);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setInt(8, age);
            statement.setLong(9, id);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean changePassword(String mail, String newPassword){
        try {
            String query = "UPDATE public.user SET password=? WHERE email=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, newPassword);
            statement.setString(2, mail);
            return statement.executeUpdate() == 1;
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

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User getLogin(String email, String password) {
        try {
            String userQuery = "SELECT * FROM public.user WHERE email=? AND password=?";
            PreparedStatement mainStatement = connection.prepareStatement(userQuery, Statement.RETURN_GENERATED_KEYS);
            mainStatement.setString(1, email);
            mainStatement.setString(2, password);
            ResultSet resultSet = mainStatement.executeQuery();
            while (resultSet.next()){
                return getUserById(resultSet.getLong(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean changePassword(String email, String currentPass, String newPass) {
        try {
            String userQuery = "SELECT * FROM public.user WHERE email=? AND password=?";
            PreparedStatement mainStatement = connection.prepareStatement(userQuery);
            mainStatement.setString(1, email);
            mainStatement.setString(2, currentPass);
            ResultSet user = mainStatement.executeQuery();
            boolean exists = user.next();
            if (exists){
                return changePassword(email, newPass);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "";
    }

    public void saveNormalUser(long result) {
        try {
            String userQuery = "INSERT into public.normal_user(user_id) VALUES(?) ";
            PreparedStatement mainStatement = connection.prepareStatement(userQuery);
            mainStatement.setLong(1, result);
            mainStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void saveAdmin(long result) {

    }

    public List<String> getAllUserEmails() {
        try {
            List<String> emails = new ArrayList<>();
            String userQuery = "SELECT email FROM public.user";
            PreparedStatement mainStatement = connection.prepareStatement(userQuery);
            ResultSet resultSet = mainStatement.executeQuery();
            while (resultSet.next()){
                emails.add(resultSet.getString(1));
            }
            return emails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
