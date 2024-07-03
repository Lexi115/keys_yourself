package com.sicappiello.keysyourself.models.dao;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.DAO;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class GameDAO implements DAO<Game> {
    private final Database database;

    public GameDAO(Database database) {
        this.database = database;
    }

    @Override
    public Game getById(int id) {
        database.connect();
        Game game = null;

        String query = "SELECT * FROM giochi g JOIN giochi_generi gg ON gg.gioco = g.id JOIN generi ge ON gg.genere = ge.id WHERE g.id = ?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            List<Game> games = fetch(rs);
            if (!games.isEmpty()) {
                game = games.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return game;
    }

    public List<Game> getByName(String name) {
        return getByName(name, 12, 0);
    }

    public List<Game> getByName(String name, int limit, int offset) {
        database.connect();
        List<Game> games = new ArrayList<>();

        String query = "SELECT * FROM giochi g WHERE g.nome LIKE ? LIMIT ? OFFSET ?";

        try {
            ResultSet rs = database.executeQuery(query, name, limit, offset);
            games = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return games;
    }

    public int getByNameCount(String name) {
        database.connect();
        int count = 0;

        String query = "SELECT COUNT(*) AS cnt FROM giochi g WHERE g.nome LIKE ?";
        try {
            ResultSet rs = database.executeQuery(query,name);
            if (rs.next()) {
                count = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return count;
    }

    @Override
    public List<Game> getAll() {
        database.connect();
        List<Game> games = new ArrayList<>();

        String query = "SELECT * FROM giochi";
        try {
            ResultSet rs = database.executeQuery(query);
            games = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return games;
    }

    @Override
    public int save(Game entity) {
        int key;
        database.connect();
        String query = "INSERT INTO giochi(id,nome,prezzo,descrizione,produttore) VALUES (?, ?, ?, ?, ?)";

        String genreQuery = "INSERT INTO giochi_generi(gioco,genere) VALUES (?, ?)";

        Object[] params = new Object[]{
                entity.getId(),
                entity.getName(),
                entity.getPrice(),
                entity.getDescription(),
                entity.getProducer(),
        };

        try {
            key = database.executeUpdateReturnKeys(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }

        for(Genre genre : entity.getGenres()) {


            Object[] genreParams = new Object[]{
                    key,
                    genre.getId(),
            };

            try {
                database.executeUpdate(genreQuery, genreParams);
            } catch (SQLException e) {
                e.printStackTrace();
                return -1;
            }

        }

        database.close();
        //in maniera eccezionale il save torna la chiave appena data al gioco
        return key;

    }

    @Override
    public int update(Game entity) {
        int rowsAffected = 0;
        database.connect();
        String query = "UPDATE giochi SET nome = ?, prezzo = ?," +
                " descrizione = ?, produttore = ? WHERE id = ?";

        String deleteOldGenresQuery = "DELETE FROM giochi_generi WHERE gioco = ?";

        String addNewGenresQuery = "INSERT INTO giochi_generi(gioco,genere) VALUES (?, ?)";

        Object[] params = new Object[]{
                entity.getName(),
                entity.getPrice(),
                entity.getDescription(),
                entity.getProducer(),
                entity.getId()
        };

        try {
            rowsAffected = database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //aggiorno i generi, prima elimino i passati

        try {
            rowsAffected += database.executeUpdate(deleteOldGenresQuery, entity.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //ora aggiungo i nuovi
        for(Genre genre : entity.getGenres()) {

            Object[] genreParams = new Object[]{
                    entity.getId(),
                    genre.getId(),
            };

            try {
                rowsAffected += database.executeUpdate(addNewGenresQuery, genreParams);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        database.close();
        return rowsAffected;
    }

    @Override
    public int saveOrUpdate(Game entity) {
        if (this.getById(entity.getId()) == null) {
            database.close();
            return this.save(entity);
        } else {
            database.close();
            return this.update(entity);
        }

    }

    @Override
    public int delete(int id) {
        int rowsAffected = 0;
        database.connect();
        String query = "DELETE FROM giochi WHERE id = ?";

        try {
            rowsAffected = database.executeUpdate(query, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    //Rimuove sia il gioco sia l'immagine
    public int delete(int id, String imagePath) {
        int rowsAffected = 0;
        database.connect();
        String query = "DELETE FROM giochi WHERE id = ?";

        try {
            rowsAffected = database.executeUpdate(query, id);

            // Rimuovi file immagine
            File file = new File(imagePath);
            file.delete();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    @Override
    public List<Game> fetch(ResultSet rs) throws SQLException {
        List<Game> games = new ArrayList<>();

        while (rs.next()) {
            Game game = new Game();

            game.setId(rs.getInt("id"));
            game.setName(rs.getString("nome"));
            game.setPrice(rs.getDouble("prezzo"));
            game.setDescription(rs.getString("descrizione"));
            game.setProducer(rs.getString("produttore"));
            game.setGenres(getGenresByGameId(game.getId()));


            games.add(game);
        }

        return games;
    }

    public List<Genre> getGenresByGameId(int id){
        database.connect();
        List<Genre> genres = new ArrayList<>();
        String query = "SELECT ge.id,ge.nome FROM giochi g JOIN giochi_generi gg ON gg.gioco = g.id JOIN generi ge ON gg.genere = ge.id WHERE g.id=?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            while(rs.next()) {
                Genre genre = new Genre();

                genre.setId(rs.getInt("id"));
                genre.setName(rs.getString("nome"));

                genres.add(genre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return genres;
    }

    public List<Game> getByPriceRange(double min, double max) {
        database.connect();
        List<Game> games = new ArrayList<>();

        String query = "SELECT * FROM giochi g WHERE g.prezzo BETWEEN ? AND ?";

        try {
            ResultSet rs = database.executeQuery(query, min, max);
            games = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return games;
    }

    public List<Game> get3RandomGames(List<Game> gameList){
        List<Game> selectedGames = new ArrayList<>();
        Random random = new Random();

        if (gameList.size() >= 3)
            for(int i = 0; i < 3; i++){
                int randomNumber = random.nextInt(gameList.size());
                selectedGames.add(gameList.get(randomNumber));
                gameList.remove(randomNumber);
            }

        return selectedGames;
    }
}

