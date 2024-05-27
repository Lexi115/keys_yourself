package com.sicappiello.keysyourself.core.database;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TimeZone;

public class Database {
    private String host;
    private int port;
    private String username;
    private String password;
    private String databaseName;

    private static DataSource dataSource;
    private Connection connection;

    public Database(String username, String password, String databaseName) {
        this("localhost", username, password, databaseName, 3306);
    }

    public Database(String host, String username, String password, String databaseName) {
        this(host, username, password, databaseName, 3306);
    }

    public Database(String host, String username, String password, String databaseName, int port) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.databaseName = databaseName;
    }

    public boolean connect() {
        try {
            connection = this.getConnection();
        } catch (SQLException e) {
            System.err.println("Errore di connessione al database: " + e.getMessage());
        }

        return this.isConnected();
    }

    private Connection getConnection() throws SQLException {
        if (dataSource == null) {
            PoolProperties p = new PoolProperties();
            p.setUrl(this.getUrl());
            p.setDriverClassName("com.mysql.cj.jdbc.Driver");
            p.setUsername(this.getUsername());
            p.setPassword(this.getPassword());
            p.setMaxActive(100);
            p.setInitialSize(10);
            p.setMinIdle(10);
            p.setRemoveAbandonedTimeout(60);
            p.setRemoveAbandoned(true);
            dataSource = new DataSource();
            dataSource.setPoolProperties(p);
        }

        return dataSource.getConnection();
    }

    public boolean isConnected() {
        return this.connection != null;
    }

    public boolean close() {
        if (this.isConnected()) {
            try {
                connection.close();
                connection = null;

                return true;
            } catch (SQLException e) {
                System.err.println("Errore di chiusura connessione al database: " + e.getMessage());
            }
        }

        return false;
    }

    public static DataSource getDataSource() {
        return dataSource;
    }

    public ResultSet executeQuery(String query, Object... parameters) throws SQLException {
        if (!this.isConnected()) {
            return null;
        }

        PreparedStatement statement = connection.prepareStatement(query);

        // Imposta dinamicamente i parametri
        this.fillParameters(statement, parameters);

        return statement.executeQuery();
    }

    public int executeUpdate(String query, Object... parameters) throws SQLException {
        if (!this.isConnected()) {
            return -1;
        }

        PreparedStatement statement = connection.prepareStatement(query);

        // Imposta dinamicamente i parametri
        this.fillParameters(statement, parameters);

        return statement.executeUpdate();
    }

    private void fillParameters(PreparedStatement statement, Object... parameters) throws SQLException {
        for (int i = 0; i < parameters.length; i++) {
            statement.setObject(i + 1, parameters[i]);
        }
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getUrl() {
        return "jdbc:mysql://" + host + ":" + port + "/" + databaseName + "?serverTimezone=" + TimeZone.getDefault().getID();
    }
}
