package com.sicappiello.keysyourself.models.beans;

import java.util.ArrayList;
import java.util.List;

public class Game {
    private int id;
    private String name;
    private double price;
    private int availableQuantity;
    private String description;
    private String producer;
    private List<Genre> genres;

    public List<Genre> getGenres() { return genres;}

    public void setGenres(List<Genre> genres) { this.genres = genres;}

    public Game() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", producer='" + producer + '\'' +
                ", genres=" + genres +
                '}';
    }
}
