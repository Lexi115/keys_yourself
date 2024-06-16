package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/removeGame")
public class RemoveGameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");

        if(user.isAdmin()){
            //può eliminare il gioco
            GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
            int gameId = Integer.parseInt(req.getParameter("id"));
                if(gameDAO.getById(gameId) != null){
                    //gioco esiste, elimino vari messaggi di errore/successo
                    int rows = gameDAO.delete(gameId);
                    if(rows > 0){
                        session.setAttribute("info","Gioco eliminato correttamente!");
                        res.sendRedirect(req.getContextPath() + "/");
                    } else {
                        throw new RuntimeException("Qualcosa è andato storto durante l'eliminazione del gioco.");
                    }
                } else {
                    //gioco non esiste
                    throw new RuntimeException("Gioco non esistente");
                }
        } else {
            res.sendRedirect(req.getContextPath() + "/");
        }
    }
}
