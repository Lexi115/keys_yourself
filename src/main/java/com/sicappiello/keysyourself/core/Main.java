package com.sicappiello.keysyourself.core;

import com.sicappiello.keysyourself.core.database.Database;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import org.apache.tomcat.jdbc.pool.DataSource;

public class Main extends HttpServlet {

    @Override
    public void init() throws ServletException {
            ServletContext ctx = getServletContext();

            // Inizializzazione database
            String dbHost = ctx.getInitParameter("dbHost");
            int dbPort = Integer.parseInt(ctx.getInitParameter("dbPort"));
            String dbName = ctx.getInitParameter("dbName");
            String dbUser = ctx.getInitParameter("dbUser");
            String dbPassword = ctx.getInitParameter("dbPassword");

            Database database = new Database(dbHost, dbUser, dbPassword, dbName, dbPort);
            ctx.setAttribute("db", database);
        super.init();
    }

    @Override
    public void destroy() {
        // Chiudi tutte le connessioni al database
        DataSource ds = Database.getDataSource();
        if (ds != null) {
            ds.close(true);
        }

        ServletContext ctx = getServletContext();
        ctx.removeAttribute("db");
    }
}
