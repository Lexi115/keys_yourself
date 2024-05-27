package com.sicappiello.keysyourself.models.beans;

public class PurchasedGame {
    private Game game;
    private String gameName;
    private String gameCode;

    public PurchasedGame(Game game, String gameName, String gameCode) {
        this.game = game;
        this.gameName = gameName;
        this.gameCode = gameCode;
    }

    public PurchasedGame(){}

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameCode() {
        return gameCode;
    }

    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    }

    @Override
    public String toString() {
        return "PurchasedGame{" +
                "game=" + game +
                ", gameName='" + gameName + '\'' +
                ", gameCode='" + gameCode + '\'' +
                '}';
    }
}
