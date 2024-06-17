package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class addGameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //redirect alla pagina aggiungi gioco
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/addGame.jsp");
        rd.forward(req,res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res){
        //riceviamo i dati del gioco, convalidiamoli
        Game newGame = new Game();

        newGame.setName(req.getParameter("name"));
        newGame.setDescription(req.getParameter("description"));
        newGame.setPrice(Integer.parseInt(req.getParameter("price")));
        newGame.setProducer(req.getParameter("producer"));

        String[] genres = req.getParameterValues("genres");

    }
}
