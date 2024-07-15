package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/removeGame")
public class RemoveGameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();
        ServletContext context = getServletContext();

        //può eliminare il gioco
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        int gameId = Integer.parseInt(req.getParameter("id"));
        if(gameDAO.getById(gameId) != null){
            //gioco esiste, trovo il path della cartella immagini dei giochi
            String relativePath = "/assets/images/games";
            String imageDirectory = context.getRealPath(relativePath) + "/" + gameId + ".jpg";
            int rows = gameDAO.delete(gameId,imageDirectory);
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
    }
}
