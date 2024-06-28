package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
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

@WebServlet("/game")
public class GameServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/results/game.jsp");
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        Game selectedGame = gameDAO.getById(Integer.parseInt(request.getParameter("id")));
        if(selectedGame!=null){
            request.setAttribute("game",selectedGame);
            request.setAttribute("gameGenres", getGenreString(selectedGame));
        } else {
            throw new RuntimeException("Nessun gioco trovato.");
        }
        rd.forward(request,response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response){
        // aggiungi nuovo gioco
    }

    private String getGenreString(Game game)
    {
        List<Genre> genreList = game.getGenres();
        String[] genreArray = new String[genreList.size()];
        for (int i = 0; i < genreArray.length; i++) {
            genreArray[i] = genreList.get(i).getName();
        }

        return String.join(", ", genreArray);
    }
}
