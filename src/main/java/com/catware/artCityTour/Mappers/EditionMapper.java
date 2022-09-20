//package com.catware.artCityTour.Mappers;
//
//import com.catware.artCityTour.Model.Edition;
//import org.springframework.jdbc.core.RowMapper;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class EditionMapper implements RowMapper<Edition> {
//    @Override
//    public Edition mapRow(ResultSet rs, int rowNum) throws SQLException {
//        return new Edition(
//                rs.getLong("id"),
//                rs.getString("nombre"),
//                rs.getString("detalles"),
//                rs.getDate("fecha")
//        );
//    }
//}
