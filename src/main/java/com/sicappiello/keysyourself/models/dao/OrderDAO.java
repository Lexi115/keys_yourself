package com.sicappiello.keysyourself.models.dao;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.DAO;
import com.sicappiello.keysyourself.models.beans.Order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO implements DAO<Order> {
    private final Database database;

    public OrderDAO(Database database) {
        this.database = database;
    }

    @Override
    public Order getById(long id) {
        database.connect();
        Order order = null;

        String query = "SELECT * FROM ordini WHERE id = ?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            List<Order> orders = fetch(rs);
            if (!orders.isEmpty()) {
                order = orders.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return order;
    }

    @Override
    public List<Order> getAll() {
        database.connect();
        List<Order> orders = new ArrayList<>();

        String query = "SELECT * FROM ordini";
        try {
            ResultSet rs = database.executeQuery(query);
            orders = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return orders;
    }

    @Override
    public int save(Order entity) {
        int rowsAffected = 0;
        database.connect();
        String query = "INSERT INTO ordini(id,utente,gioco,quantita,data_acquisto,prezzo," +
                "nome_utente,nome_gioco) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Object[] params = new Object[]{
                entity.getId(),
                entity.getUserId(),
                entity.getGameId(),
                entity.getQuantity(),
                entity.getOrderDate(),
                entity.getPrice(),
                entity.getUserName(),
                entity.getGameName()
        };

        try {
            rowsAffected = database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    @Override
    public int update(Order entity) {
        int rowsAffected = 0;
        database.connect();
        String query = "UPDATE ordini SET utente = ?,gioco = ?,quantita = ?," +
                "data_acquisto = ?,prezzo = ?,nome_utente = ?, nome_gioco = ? WHERE id = ?";

        Object[] params = new Object[]{
                entity.getUserId(),
                entity.getGameId(),
                entity.getQuantity(),
                entity.getOrderDate(),
                entity.getPrice(),
                entity.getUserName(),
                entity.getGameName(),
                entity.getId()
        };

        try {
            rowsAffected = database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    @Override
    public int saveOrUpdate(Order entity) {
        if (this.getById(entity.getId()) == null) {
            return this.save(entity);
        } else {
            return this.update(entity);
        }
    }

    @Override
    public int delete(Order entity) {
        return delete(entity.getId());
    }

    @Override
    public int delete(long id) {
        int rowsAffected = 0;
        database.connect();
        String query = "DELETE FROM ordini WHERE id = ?";

        try {
            rowsAffected = database.executeUpdate(query, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return rowsAffected;
    }

    @Override
    public List<Order> fetch(ResultSet rs) throws SQLException {
        List<Order> orders = new ArrayList<>();

        while (rs.next()) {
            Order order = new Order();

            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("utente"));
            order.setGameId(rs.getInt("gioco"));
            order.setQuantity(rs.getInt("quantita"));
            order.setOrderDate((rs.getDate("data_acquisto")).toLocalDate());
            order.setPrice(rs.getDouble("prezzo"));
            order.setUserName(rs.getString("nome_utente"));
            order.setGameName(rs.getString("nome_gioco"));

            orders.add(order);
        }

        return orders;
    }
}
