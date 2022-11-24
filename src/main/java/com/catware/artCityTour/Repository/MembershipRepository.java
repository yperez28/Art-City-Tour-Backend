package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Membership;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MembershipRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Membership> getAll() {
        try {
            String query = "SELECT * FROM membership ORDER BY price";
            PreparedStatement statement;
            List<Membership> resultArray = new ArrayList<>();
            try {
                statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Membership membership = new Membership();
                    membership.setId(resultSet.getLong(1));
                    membership.setName(resultSet.getString(2));
                    membership.setDetails(resultSet.getString(3));
                    membership.setPrice(resultSet.getDouble(4));
                    membership.setImageId(resultSet.getLong(5));
                    resultArray.add(membership);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return resultArray;
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public Membership getMembershipById(Long id) {
        String query = "SELECT * FROM membership WHERE id=?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Membership membership = new Membership();
            while (resultSet.next()) {
                membership.setId(resultSet.getLong(1));
                membership.setName(resultSet.getString(2));
                membership.setDetails(resultSet.getString(3));
                membership.setPrice(resultSet.getDouble(4));
                membership.setImageId(resultSet.getLong(5));
            }
            return membership;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Membership> getMembershipsByUser(Long id) {
        try {
            List<Membership> memberships = new ArrayList<>();
            PreparedStatement statement;
            String query = "SELECT * FROM membership INNER JOIN membershipxuser ON membership.id = membershipxuser.membershipid WHERE userid = ?";

            try {
                statement = connection.prepareStatement(query);
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Membership membership = new Membership();
                    membership.setId(resultSet.getLong(1));
                    membership.setName(resultSet.getString(2));
                    membership.setDetails(resultSet.getString(3));
                    membership.setPrice(resultSet.getDouble(4));
                    membership.setImageId(resultSet.getLong(5));

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

    public Membership getPrincipalMembership() {
        String query = "SELECT id FROM membership WHERE name='Principal'";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            return getMembershipById(resultSet.getLong(1));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer saveMembershipxUser(Long userId, Long membershipId, String startDate, String endDate) {
        try {
            String query = "INSERT INTO membershipxuser (userid, membershipid, startdate, enddate) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setLong(1, userId);
            statement.setLong(2, membershipId);
            statement.setDate(3, Date.valueOf(startDate));
            statement.setDate(4, Date.valueOf(endDate));

            return statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer updateMembershipxUser(Long id, String startDate, String endDate) {
        try {
            String query = "UPDATE membershipxuser SET startdate=?, enddate=? WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setDate(1, Date.valueOf(startDate));
            statement.setDate(2, Date.valueOf(endDate));
            statement.setLong(3, id);

            return statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer deleteMembershipxUser(Long id) {
        try {
            String query = "DELETE FROM membershipxuser WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setLong(1, id);

            return statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
