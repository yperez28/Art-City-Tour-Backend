package com.catware.artCityTour.Repository;
import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Membership;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MembershipRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Membership> getAll(){
        try {
            String query = "SELECT * FROM membresia";
            PreparedStatement statement;
            List<Membership> resultArray = new ArrayList<>();
            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Membership membership = new Membership();
                    membership.setId(resultSet.getLong(1));
                    membership.setName(resultSet.getString(2));
                    membership.setDetails(resultSet.getString(3));
                    membership.setPhoto(resultSet.getString(4));
                    resultArray.add(membership);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        return resultArray;
        }catch (EmptyResultDataAccessException e){
            return new ArrayList<>();
        }
    }

    public Membership getMembershipById(Long id){
        String query = "SELECT * FROM membresia WHERE \"ID\"=?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Membership membership = new Membership();
            while(resultSet.next()) {
                membership.setId(resultSet.getLong(1));
                membership.setName(resultSet.getString(2));
                membership.setDetails(resultSet.getString(3));
                membership.setPhoto(resultSet.getString(4));
            }
            return membership;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
