package com.catware.artCityTour.Repository;

import com.catware.artCityTour.Conection.DBCConnection;
import com.catware.artCityTour.Model.Edition;
import com.catware.artCityTour.Model.News;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class NewsRepository {

    private final Connection connection = DBCConnection.getConnection();

    public List<News> getAll() {
        String query = "SELECT id, title, description, date, image_id, link FROM news ORDER BY date";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            List<News> newsList = new ArrayList<>();
            while (resultSet.next()) {
                News news = new News();
                String fullDescription = resultSet.getString(3);
                String description = "";
                if (fullDescription.length() > 100) {
                    description = fullDescription.substring(0, 100);
                } else {
                    description = fullDescription;
                }
                news.setId(resultSet.getLong(1));
                news.setTitle(resultSet.getString(2));
                news.setDescription(description);
                news.setDate(resultSet.getString(4));
                news.setImageId(resultSet.getLong(5));
                news.setLink(resultSet.getString(6));
                newsList.add(news);
            }
            return newsList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public News getNewsById(Long id) {
        String query = "SELECT id, title, description, date, image_id, link FROM news WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            News news = new News();
            while (resultSet.next()) {
                news.setId(resultSet.getLong(1));
                news.setTitle(resultSet.getString(2));
                news.setDescription(resultSet.getString(3));
                news.setDate(resultSet.getString(4));
                news.setImageId(resultSet.getLong(5));
                news.setLink(resultSet.getString(6));
            }
            return news;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int createNews(String title, String description, Long imageId, String date, String link) {
        String query = "INSERT INTO news (title, description, image_id, date, link) values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setLong(3, imageId);
            statement.setString(4, date);
            statement.setString(5, link);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int updateNews(Long id, String title, String description, String date, Long imageId, String link) {
        String query = "UPDATE news set title = ?, description = ?, date = ?, image_id=?, link=? WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setString(3, date);
            statement.setLong(4, imageId);
            statement.setString(5, link);
            statement.setLong(6, id);
            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteNews(Long id) {
        String query = "DELETE FROM news WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, id);

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
