package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //Prelevo dal database la lista dei giochi in base alla query dell'utente e al numero di pagina
        Database db = Functions.getContextDatabase(this);
        GameDAO gameDao = new GameDAO(db);
        int page;

        //Verifichiamo il formato della query string nell url
        String query = req.getParameter("query");
        if (query==null || query.length() > 150) {
            query = "";
        }

        String pageString = req.getParameter("p");
        //Verifichiamo il formato del numero di pagina nell url
        if(pageString!=null && !pageString.isEmpty() && Functions.isNumeric(pageString)) {
            page = Integer.parseInt(pageString);

            if(page < 1) {
                page = 1;
            }

        } else {
            page = 1;
        }

        //offset di pagina
        int offset = (page - 1) * 12;
        //limit = solo 12 risultati per pagina
        int limit = 12;
        List<Game> games = gameDao.getByName("%" + query + "%", limit, offset);
        int gameCount = gameDao.getByNameCount("%" + query + "%");
        int totalPages = getTotalPages(gameCount);

        req.setAttribute("games",games);
        req.setAttribute("pageNumber",page);
        req.setAttribute("totalPages", totalPages);

        // Disponibilità pulsanti di pagina
        req.setAttribute("isRightAvailable",page < totalPages);
        req.setAttribute("isLeftAvailable",page > 1);

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/searchResult.jsp");
        rd.forward(req,res);
    }

    private int getTotalPages(int gameCount) {
        System.out.println(gameCount);
        return (int) (Math.ceil(gameCount / 12.0));
    }
}
