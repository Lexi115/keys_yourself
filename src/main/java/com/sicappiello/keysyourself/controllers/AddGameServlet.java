package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.models.validators.GameValidator;
import com.sicappiello.keysyourself.util.FileSize;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/addGame")
@MultipartConfig(
        maxFileSize = FileSize.MAX_REAL,      // 20 MB in caso di emergenza
        maxRequestSize = FileSize.REQUEST_MAX   // 20 MB
)
public class AddGameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //redirect alla pagina aggiungi gioco
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/addGame.jsp");
        rd.forward(req,res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();

        //riceviamo i dati del gioco, convalidiamoli
        Game newGame = new Game();
        HttpSession session = req.getSession();
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        String name = req.getParameter("name").trim();

        //controllo se esiste già il gioco nel database
        List<Game> gamesCheck = gameDAO.getByName(name);
        if(Functions.nameAlreadyUsed(gamesCheck,name)){
            errors.add("Il gioco " + name + " esiste già");
            session.setAttribute("error", errors);
            doGet(req,res);
            return;
        }

        newGame.setName(name);
        newGame.setDescription(req.getParameter("description"));
        newGame.setPrice(Double.parseDouble(req.getParameter("price")));
        newGame.setProducer(req.getParameter("producer"));

        //recupero la lista di id di generi per abbinarli al gioco
        String genresString = req.getParameter("genres");
        if (genresString == null || genresString.isEmpty()) {
            errors.add("Aggiungere almeno un genere!");
        }
        else {
            String[] genresId = genresString.split(",");
            List<Genre> genres = new ArrayList<>();
            for (String s : genresId) {
                Genre genre = new Genre();
                genre.setId(Integer.parseInt(s));
                genres.add(genre);
            }

            newGame.setGenres(genres);

            //valido il gioco appena inserito
            GameValidator validator = new GameValidator();
            boolean gameValid = validator.validate(newGame, errors);

            //Controllo immagine
            Part filePart = req.getPart("image");
            boolean imageValid = Functions.isImageValid(filePart,errors,true);

            if (gameValid && imageValid) {
                //è valido, lo aggiungo al database
                GameDAO dao = new GameDAO(Functions.getContextDatabase(this));
                int gameId = dao.saveOrUpdate(newGame);

                // Carica immagine di anteprima
                if (gameId != -1) {
                    Functions.uploadImage(req, getServletContext(), gameId);
                    session.setAttribute("info", "Gioco aggiunto correttamente");
                    res.sendRedirect(req.getContextPath() + "/game?id=" + gameId);
                    return;
                }

            }
        }


        //non è valido, ritorno gli errori e lo rimando alla addpage
        session.setAttribute("error", errors);
        doGet(req,res);
    }
}
