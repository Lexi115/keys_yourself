package com.sicappiello.keysyourself.models.beans;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private List<Game> games;

    public ShoppingCart() {
        this.games = new ArrayList<>();
    }

    public List<Game> getGames() {
        return games;
    }

    public void setGames(List<Game> games) {
        this.games = games;
    }

    public void addGame(Game game) {
        this.games.add(game);
    }

    public void removeGame(Game game) {
        this.games.remove(game);
    }
}
