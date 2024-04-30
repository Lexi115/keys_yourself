package com.sicappiello.keysyourself.models.dao;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.DAO;
import com.sicappiello.keysyourself.models.beans.Genre;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GenreDAO implements DAO<Genre> {
    private final Database database;

    public GenreDAO(Database database) {
        this.database = database;
    }

    @Override
    public Genre getById(long id) {
        database.connect();
        Genre genre = null;

        String query = "SELECT * FROM generi WHERE id = ?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            List<Genre> genres = fetch(rs);
            if (!genres.isEmpty()) {
                genre = genres.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return genre;
    }

    @Override
    public List<Genre> getAll() {
        database.connect();
        List<Genre> genres = new ArrayList<>();

        String query = "SELECT * FROM generi";
        try {
            ResultSet rs = database.executeQuery(query);
            genres = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return genres;
    }

    @Override
    public int save(Genre entity) {
        database.connect();
        String query = "INSERT INTO generi(id,nome) VALUES (?, ?)";

        Object[] params = new Object[]{
                entity.getId(),
                entity.getName(),
        };

        try {
            return database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int update(Genre entity) {
        database.connect();
        String query = "UPDATE generi nome = ? WHERE id = ?";

        Object[] params = new Object[]{
                entity.getName(),
                entity.getId(),
        };

        try {
            return database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int saveOrUpdate(Genre entity) {
        database.connect();

        if (this.getById(entity.getId()) == null) {
            return this.save(entity);
        } else {
            return this.update(entity);
        }
    }

    @Override
    public int delete(Genre entity) {
        return delete(entity.getId());
    }

    @Override
    public int delete(long id) {
        database.connect();
        String query = "DELETE FROM generi WHERE id = ?";

        try {
            return database.executeUpdate(query, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Genre> fetch(ResultSet rs) throws SQLException {
        List<Genre> genres = new ArrayList<>();

        while (rs.next()) {
            Genre genre = new Genre();

            genre.setId(rs.getInt("id"));
            genre.setName(rs.getString("nome"));

            genres.add(genre);
        }

        return genres;
    }
}
