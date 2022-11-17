package com.catware.artCityTour.Model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Setter
@Getter
public class Grid {
    private List<String> columns;
    private List<List<String>> rows;
    public Grid(List<String> columns, List<List<String>> rows) {
        this.columns = columns;
        this.rows = rows;
    }
}
