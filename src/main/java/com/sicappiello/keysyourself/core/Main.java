package com.sicappiello.keysyourself.core;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.models.dao.GenreDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import org.apache.tomcat.jdbc.pool.DataSource;

import java.util.List;

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

            // Aggiungi generi giochi al servlet context
            List<Genre> genreList = getGenres();
            ctx.setAttribute("genreList", genreList);
            System.out.println("Generi caricati: " + genreList);

            //Imposto come attributo del ServletContext i giochi del giorno
            GameDAO gameDAO = new GameDAO(database);
            List<Game> randomGames = gameDAO.get3RandomGames(gameDAO.getAll());
            ctx.setAttribute("gamesOfTheDay",randomGames);
            System.out.println(randomGames);

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
    private List<Genre> getGenres() {
        Database db = Functions.getContextDatabase(this);
        GenreDAO dao = new GenreDAO(db);

        return dao.getAll();
    }

}
