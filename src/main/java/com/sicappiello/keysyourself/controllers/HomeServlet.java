package com.sicappiello.keysyourself.controllers;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("")
public class HomeServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("latestGames",getLatestGames());
        req.setAttribute("cheapGames",getCheapGames());
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, res);
    }

    public List<Game> getCheapGames(){
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        List<Game> cheapGames = gameDAO.getByPriceRange(0, 10);
        return gameDAO.get3RandomGames(cheapGames);
    }

    public List<Game> getLatestGames(){
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        List<Game> cheapGames = gameDAO.getAll();
        List<Game> latestGames = new ArrayList<>();
        int length = cheapGames.size();

        if(length >=3) {
            latestGames.add(cheapGames.get(length - 1));
            latestGames.add(cheapGames.get(length - 2));
            latestGames.add(cheapGames.get(length - 3));
        }
        return latestGames;
    }
}
