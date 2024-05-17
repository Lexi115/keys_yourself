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

import javax.xml.crypto.Data;
import java.io.IOException;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Database db = Functions.getContextDatabase(this);
        GameDAO gameDAO = new GameDAO(db);

        //Recupero il gioco dal database in base all'id fornito dal form
        int gameId = Integer.parseInt(request.getParameter("id"));
        Game selectedGame = gameDAO.getById(gameId);
        if (selectedGame != null) {
            cart.addGame(selectedGame);

            session.setAttribute("info", selectedGame.getName() + " aggiunto al carrello!");

           //response.sendRedirect(request.getContextPath() + "/game?id=" + selectedGame.getId());
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            session.setAttribute("error","Gioco non esistente");
          // response.sendRedirect(request.getContextPath() + "/");
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
