package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.ShoppingCart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cartremove")
public class CartRemoveServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        synchronized (session) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            List<String> errors = new ArrayList<>();
            session.setAttribute("error",errors);

            //Recupero il gioco in base all'id fornito dal form
            int gameId = Integer.parseInt(request.getParameter("id"));
            Game game = cart.containsGame(gameId);
            if (game != null) {
                cart.removeGame(game);
                session.setAttribute("total", String.format("%.2f",cart.getTotal()));
            }
        }

        //redirect
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
