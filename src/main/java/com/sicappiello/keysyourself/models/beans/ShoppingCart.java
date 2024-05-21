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

    public boolean addGame(Game game) {
        if (!containsGame(game)) {
            this.games.add(game);
            return true;
        }

        return false;
    }

    public void removeGame(Game game) {
        this.games.remove(game);
    }

    public boolean containsGame(Game game) {
        for (Game g : games) {
            if (g.getId() == game.getId()) {
                return true;
            }
        }

        return false;
    }
}
