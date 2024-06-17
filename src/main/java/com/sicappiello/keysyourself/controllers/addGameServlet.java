package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.models.validators.GameValidator;
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
@WebServlet("/admin/addGameServlet")
public class addGameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //redirect alla pagina aggiungi gioco
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/addGame.jsp");
        rd.forward(req,res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //riceviamo i dati del gioco, convalidiamoli
        Game newGame = new Game();
        HttpSession session = req.getSession();

        newGame.setName(req.getParameter("name"));
        newGame.setDescription(req.getParameter("description"));
        newGame.setPrice(Integer.parseInt(req.getParameter("price")));
        newGame.setProducer(req.getParameter("producer"));

        //recupero la lista di id di generi per abbinarli al gioco
        String[] genresId = req.getParameter("genresId").split(",");
        List<Genre> genres = new ArrayList<>();

        for (String s : genresId) {
            Genre genre = new Genre();
            genre.setId(Integer.parseInt(s));
            genres.add(genre);
        }

        newGame.setGenres(genres);

        //valido il gioco appena inserito
        GameValidator validator = new GameValidator();
        List<String> errors = new ArrayList<>();

        boolean valid = validator.validate(newGame, errors);

        if (valid){
            //è valido lo aggiungo al database
            GameDAO dao = new GameDAO(Functions.getContextDatabase(this));
            int key = dao.save(newGame);

            session.setAttribute("info", "Gioco aggiunto correttamente");
            res.sendRedirect(req.getContextPath() + "/game?id=" + key);
        } else {
            //non è valido torno gli errori e lo rimando alla homepage
            session.setAttribute("errors", errors);
            doGet(req,res);
        }


    }
}
