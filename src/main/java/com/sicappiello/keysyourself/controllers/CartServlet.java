package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.ShoppingCart;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/results/cart.jsp");
        rd.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        synchronized (session) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Database db = Functions.getContextDatabase(this);
            GameDAO gameDAO = new GameDAO(db);
            List<String> errors = new ArrayList<>();
            session.setAttribute("error",errors);

            //Recupero il gioco dal database in base all'id fornito dal form
            int gameId = Integer.parseInt(request.getParameter("id"));
            Game selectedGame = gameDAO.getById(gameId);
            if (selectedGame != null) {
                //il gioco era già presente nel carrello?
                if( cart.addGame(selectedGame) ){
                    //gioco non era presente
                    session.setAttribute("info", selectedGame.getName() + " aggiunto al carrello!");
                    session.setAttribute("total", String.format("%.2f",cart.getTotal()));
                } else {
                    //gioco è già presente
                    errors.add(selectedGame.getName() + " è già nel carrello.");
                }

                //redirect
                response.sendRedirect(request.getContextPath() + "/game?id=" + selectedGame.getId());

            } else {
                //gioco non esiste
                errors.add("Gioco non esistente");
                response.sendRedirect(request.getContextPath() + "/");
            }
        }
    }
}
