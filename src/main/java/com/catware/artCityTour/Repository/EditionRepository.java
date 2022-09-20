package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Edition;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class EditionRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<Edition> getAll(){
        try {
            String query = "SELECT * FROM edicion";
            PreparedStatement statement;
            try {
                 statement = connection.prepareStatement(query);
                System.out.println(statement.executeQuery());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return new ArrayList<>();
        }catch (EmptyResultDataAccessException e){
            return new ArrayList<>();
        }
    }

    public Edition getEditionById(Long id){
        String query = "SELECT * FROM edicion WHERE \"ID\"=?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            Edition edition = new Edition();
            while (resultSet.next()){
                edition.setId(resultSet.getLong(1));
                edition.setNombre(resultSet.getString(2));
                edition.setDetalles(resultSet.getString(3));
                edition.setFecha(resultSet.getDate(4).toLocalDate());
            }
            return edition;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
