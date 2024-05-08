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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Prelevo dal database la lista dei giochi in base alla query dell'utente
        Database db = Functions.getContextDatabase(this);
        GameDAO gameDao = new GameDAO(db);
        List<Game> games = gameDao.getByName(request.getParameter("query"));
        request.setAttribute("games",games);

        RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
        rd.forward(request,response);
    }
}
