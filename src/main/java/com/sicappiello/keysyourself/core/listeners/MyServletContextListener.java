package com.sicappiello.keysyourself.core.listeners;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.apache.tomcat.jdbc.pool.DataSource;

public class MyServletContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        ServletContext ctx = event.getServletContext();

        // Inizializzazione database
        String dbHost = ctx.getInitParameter("dbHost");
        int dbPort = Integer.parseInt(ctx.getInitParameter("dbPort"));
        String dbName = ctx.getInitParameter("dbName");
        String dbUser = ctx.getInitParameter("dbUser");
        String dbPassword = ctx.getInitParameter("dbPassword");

        Database database = new Database(dbHost, dbUser, dbPassword, dbName, dbPort);
        ctx.setAttribute("db", database);
    }

    public void contextDestroyed(ServletContextEvent event) {
        // Chiudi tutte le connessioni al database
        DataSource ds = Database.getDataSource();
        if (ds != null) {
            ds.close(true);
        }

        ServletContext ctx = event.getServletContext();
        ctx.removeAttribute("db");
    }
}
