package com.catware.artCityTour.Controller;
import com.catware.artCityTour.Service.EditionService;
import com.catware.artCityTour.Service.NewsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping(value = "/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @CrossOrigin
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public String getAll() throws JsonProcessingException {
        return newsService.getAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getById(@RequestParam Long id) throws JsonProcessingException {
        return newsService.getNewsById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createNews(@RequestBody String jsonData) throws JsonProcessingException {
        return newsService.createNews(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateNews(@RequestBody String jsonData) throws JsonProcessingException {
        return newsService.updateNews(jsonData);
    }

    @CrossOrigin
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public boolean deleteNews(@RequestParam Long id) throws JsonProcessingException {
        return newsService.deleteNews(id);
    }

}
