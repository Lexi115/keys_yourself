package com.sicappiello.keysyourself.models.dao;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.DAO;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Order;
import com.sicappiello.keysyourself.models.beans.PurchasedGame;
import com.sicappiello.keysyourself.models.beans.User;

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
    public Order getById(int id) {
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

    public List<Order> getAll(User user) {
        database.connect();
        List<Order> orders = new ArrayList<>();
      
        String query = "SELECT * FROM ordini WHERE utente = ?";
        try {
            ResultSet rs = database.executeQuery(query, user.getUid());
            orders = fetch(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return orders;
    }

    @Override
    public int save(Order entity) {
        int orderId;
        database.connect();
        String query = "INSERT INTO ordini(utente,nome,cognome,email,telefono,indirizzo,citta,regione,cap,stato,data_acquisto,prezzo)" +
                " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        String purchasedGamesQuery = "INSERT INTO giochi_acquistati(id_ordine,gioco,nome_gioco,codice_gioco)" +
                " VALUES (?,?,?,?)";

        Object[] orderParams = new Object[]{
                entity.getUserId(),
                entity.getFirstName(),
                entity.getLastName(),
                entity.getEmail(),
                entity.getPhoneNumber(),
                entity.getAddress(),
                entity.getCity(),
                entity.getState(),
                entity.getZip(),
                entity.getCountry(),
                entity.getOrderDate(),
                entity.getPrice()
        };

        try {
            orderId = database.executeUpdateReturnKeys(query, orderParams);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }

        //aggiungo i giochi comprati nella tabella giochi_acquistati
        for(PurchasedGame g : entity.getGames()) {

            Object[] gameParams = new Object[]{
                    orderId,
                    g.getGame().getId(),
                    g.getGameName(),
                    g.getGameCode()
            };

            try {
                database.executeUpdate(purchasedGamesQuery, gameParams);
                System.out.println("Purchased game " + g.getGame().getId() + " " + g.getGameName());
            } catch (SQLException e) {
                e.printStackTrace();
                return -1;
            }
        }

        database.close();
        return orderId;
    }

    @Override
    public int update(Order entity) {
        int rowsAffected = 0;
        database.connect();
        String query = "UPDATE ordini SET utente = ?,nome = ?,cognome = ?,email = ?,telefono = ?,indirizzo = ?,citta = ?,regione = ?,cap = ?,stato = ?,data_acquisto = ?,prezzo = ?" +
                "prezzo = ? WHERE id = ?";

        Object[] params = new Object[]{
                entity.getUserId(),
                entity.getFirstName(),
                entity.getLastName(),
                entity.getEmail(),
                entity.getPhoneNumber(),
                entity.getAddress(),
                entity.getCity(),
                entity.getState(),
                entity.getZip(),
                entity.getCountry(),
                entity.getOrderDate(),
                entity.getPrice(),
                entity.getId()
        };

        try {
            rowsAffected = database.executeUpdate(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        database.close();
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
    public int delete(int id) {
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
            order.setFirstName(rs.getString("nome"));
            order.setLastName(rs.getString("cognome"));
            order.setEmail(rs.getString("email"));
            order.setPhoneNumber(rs.getString("telefono"));
            order.setAddress(rs.getString("indirizzo"));
            order.setCity(rs.getString("citta"));
            order.setState(rs.getString("regione"));
            order.setZip(rs.getString("cap"));
            order.setCountry(rs.getString("stato"));
            order.setOrderDate((rs.getDate("data_acquisto")).toLocalDate());
            order.setPrice(rs.getDouble("prezzo"));
            order.setGames(getGamesByOrderId(order.getId()));

            orders.add(order);
        }

        return orders;
    }

    public List<PurchasedGame> getGamesByOrderId(int id){
        database.connect();
        List<PurchasedGame> purchasedGames = new ArrayList<>();
        String query = "SELECT ga.gioco,ga.nome_gioco,ga.codice_gioco FROM giochi_acquistati ga JOIN ordini o ON o.id = ga.id_ordine WHERE ga.id_ordine=?";
        try {
            ResultSet rs = database.executeQuery(query, id);
            while(rs.next()) {
                PurchasedGame purchasedGame = new PurchasedGame();

                purchasedGame.setGameName(rs.getString("nome_gioco"));
                purchasedGame.setGameCode(rs.getString("codice_gioco"));

                GameDAO gameDAO = new GameDAO(database);
                Game purchasedGameBean = gameDAO.getById(rs.getInt("gioco"));
                purchasedGame.setGame(purchasedGameBean);

                purchasedGames.add(purchasedGame);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        database.close();
        return purchasedGames;
    }
}
