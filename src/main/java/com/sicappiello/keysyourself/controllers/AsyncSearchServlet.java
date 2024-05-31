package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AsyncSearch")
public class AsyncSearchServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String query = req.getParameter("q");
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));

        List<Game> gamesList = gameDAO.getByName(query,3);
        JSONArray games = new JSONArray();
        if(!gamesList.isEmpty()){
            for(Game game : gamesList){
                JSONObject gameJSON = new JSONObject();
                gameJSON.put("id", game.getId());
                gameJSON.put("name", game.getName());
                gameJSON.put("producer", game.getProducer());
                gameJSON.put("price" , game.getPrice());
                games.add(gameJSON);
            }
        }
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = resp.getWriter();

        printWriter.print(games.toJSONString());
        printWriter.flush();
        printWriter.close();
    }

}
