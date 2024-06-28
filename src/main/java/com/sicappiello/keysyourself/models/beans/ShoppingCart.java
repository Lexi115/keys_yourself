package com.sicappiello.keysyourself.models.beans;

import java.util.HashSet;
import java.util.Set;

public class ShoppingCart {
    private Set<Game> games;
    double total;

    public ShoppingCart() {
        this.games = new HashSet<>();
        this.total = 0;
    }

    public Set<Game> getGames() {
        return games;
    }

    public void setGames(Set<Game> games) {
        this.games = games;
    }

    public boolean addGame(Game game) {
        if (containsGame(game.getId()) == null) {
            this.games.add(game);
            return true;
        }

        return false;
    }

    public void removeGame(Game game) {
        for (Game g : games) {
            if (g.getId() == game.getId()) {
                this.games.remove(game);
                return;
            }
        }
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Game containsGame(int id) {
        for (Game g : games) {
            if (g.getId() == id) {
                return g;
            }
        }

        return null;
    }
}
