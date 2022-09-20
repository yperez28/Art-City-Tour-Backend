package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Mappers.EditionMapper;
import com.catware.artCityTour.Model.Edition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class EditionRepository {

    @Autowired
    @ACTBD
    private JdbcTemplate jdbcTemplate;

//    @Autowired
//    public EditionRepository(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//    }

    public List<Edition> getAll(){
        try {
            String query = "SELECT * FROM edicion";
            return jdbcTemplate.query(query, new EditionMapper());
        }catch (EmptyResultDataAccessException e){
            return new ArrayList<>();
        }
    }

    public Edition getEditionById(Long id){
        String query = "SELECT * FROM edicion WHERE id = ?";
        return (Edition) jdbcTemplate.query(query, new Object[]{id}, new EditionMapper());
    }
}
