package com.catware.artCityTour;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class ArtCityTourApplication {

	public static void main(String[] args) {
		SpringApplication.run(ArtCityTourApplication.class, args);
	}
}
