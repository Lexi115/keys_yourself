package com.sicappiello.keysyourself.models.dao;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.DAO;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.util.Functions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements DAO<User> {
    private final Database database;

    public UserDAO(Database database) {
        this.database = database;
    }

    @Override
    public User getById(long id) {
        database.connect();
        User user = null;

        String query = "SELECT * FROM utenti u JOIN ruoli r ON u.ruolo = r.id WHERE u.uid = ?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            List<User> users = fetch(rs);
            if (!users.isEmpty()) {
                user = users.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getByEmail(String email) {
        database.connect();
        User user = null;

        String query = "SELECT * FROM utenti u JOIN ruoli r ON u.ruolo = r.id WHERE u.email = ?";
        try {
            ResultSet rs = database.executeQuery(query, email);
            List<User> users = fetch(rs);
            if (!users.isEmpty()) {
                user = users.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getByToken(String token) {
        database.connect();
        User user = null;
        String newToken = Functions.hash(token);
        String query = "SELECT * FROM utenti u JOIN ruoli r ON u.ruolo = r.id WHERE u.auth_token= ?";
        try {
            ResultSet rs = database.executeQuery(query, token);
            List<User> users = fetch(rs);
            if (!users.isEmpty()) {
                user = users.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }



    @Override
    public List<User> getAll() {
        database.connect();
        List<User> users = new ArrayList<>();

        String query = "SELECT * FROM utenti";
        try {
            ResultSet rs = database.executeQuery(query);
            users = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public int save(User entity) {
        database.connect();
        String query = "INSERT INTO utenti(email,password,nome,cognome,indirizzo," +
                "telefono,ruolo,auth_token) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Object[] params = new Object[]{
                entity.getEmail(),
                entity.getPassword(),
                entity.getName(),
                entity.getSurname(),
                entity.getAddress(),
                entity.getPhoneNumber(),
                entity.getRoleId(),
                entity.getAuthToken()
        };

        try {
            return database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int update(User entity) {
        database.connect();
        String query = "UPDATE utenti SET email = ?, password = ?, nome = ?, cognome = ?," +
                " indirizzo = ?, telefono = ?, ruolo = ?, auth_token = ? WHERE uid = ?";

        Object[] params = new Object[]{
                entity.getEmail(),
                entity.getPassword(),
                entity.getName(),
                entity.getSurname(),
                entity.getAddress(),
                entity.getPhoneNumber(),
                entity.getRoleId(),
                entity.getAuthToken(),
                entity.getUid()
        };

        try {
            return database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int saveOrUpdate(User entity) {
        database.connect();

        if (this.getById(entity.getUid()) == null) {
            return this.save(entity);
        } else {
            return this.update(entity);
        }
    }

    @Override
    public int delete(User entity) {
        return delete(entity.getUid());
    }

    @Override
    public int delete(long id) {
        database.connect();
        String query = "DELETE FROM utenti WHERE uid = ?";

        try {
            return database.executeUpdate(query, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<User> fetch(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();

        while (rs.next()) {
            User user = new User();

            user.setUid(rs.getInt("uid"));
            user.setName(rs.getString("nome"));
            user.setSurname(rs.getString("cognome"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setAddress(rs.getString("indirizzo"));
            user.setPhoneNumber(rs.getString("telefono"));
            user.setRoleId(rs.getInt("ruolo"));
            user.setRoleName(rs.getString("nome_ruolo"));
            user.setAuthToken(rs.getString("auth_token"));

            users.add(user);
        }

        return users;
    }


}
