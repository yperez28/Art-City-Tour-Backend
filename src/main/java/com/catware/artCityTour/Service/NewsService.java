package com.catware.artCityTour.Service;

import com.catware.artCityTour.Model.News;
import com.catware.artCityTour.Repository.NewsRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private ImageService imageService;

    public String getAll() throws JsonProcessingException {
        List<News> newsList = newsRepository.getAll();
        for (News news:newsList) {
            news.setImage(imageService.getImageById(news.getImageId()));
        }
        return objectMapper.writeValueAsString(newsList);
    }

    public String getNewsById(Long id) throws JsonProcessingException {
        News news = newsRepository.getNewsById(id);
        news.setImage(imageService.getImageById(news.getImageId()));
        return objectMapper.writeValueAsString(news);
    }

    public String createNews(String jsonData) throws JsonProcessingException {
        News news = objectMapper.readValue(jsonData, News.class);
        news.setImageId(imageService.createImage(news.getImage()));
        int result = newsRepository.createNews(news.getTitle(), news.getDescription(), news.getImageId(), news.getDate());
        if (result > 0) {
            return objectMapper.writeValueAsString(news);
        }
        return "";
    }

    public String updateNews(String jsonData) throws JsonProcessingException {
        News news = objectMapper.readValue(jsonData, News.class);
        imageService.updateImage(news.getImage());
        int result = newsRepository.updateNews(news.getId(), news.getTitle(), news.getDescription(), news.getDate());
        if (result > 0) {
            return objectMapper.writeValueAsString(news);
        }
        return "";
    }

    public String deleteNews(Long id){
        return String.valueOf(newsRepository.deleteNews(id));
    }

}
