package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.models.validators.GameValidator;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/admin/addGameServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 30, // 30 KB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 20   // 20 MB
)
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
        newGame.setPrice(Double.parseDouble(req.getParameter("price")));
        newGame.setProducer(req.getParameter("producer"));

        //recupero la lista di id di generi per abbinarli al gioco
        String[] genresId = req.getParameter("genres").split(",");
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
        if (valid) {
            //è valido lo aggiungo al database
            GameDAO dao = new GameDAO(Functions.getContextDatabase(this));
            int key = dao.save(newGame);

            // Carica immagine di anteprima
            if (key != -1 && uploadImage(req, key, errors)) {
                System.out.println("ok");
                session.setAttribute("info", "Gioco aggiunto correttamente");
                res.sendRedirect(req.getContextPath() + "/game?id=" + key);
                return;
            }else {
                System.out.println("error img o db");
            }

        }

        //non è valido torno gli errori e lo rimando alla addpage
        session.setAttribute("error", errors);
        doGet(req,res);
    }

    private boolean uploadImage(HttpServletRequest request, int gameId, List<String> errors) throws ServletException, IOException {
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // Cartella dove caricare le immagini
        ServletContext context = getServletContext();
        String relativePath = "/assets/images/games";
        String imageDirectory = context.getRealPath(relativePath);
        System.out.println(imageDirectory);
        HttpSession session = request.getSession();

        // E' stato car
        if(filePart.getSize() > 0) {
            // E' un'immagine?
            BufferedImage image = ImageIO.read(filePart.getInputStream());
            if (image != null) {
                //E' un .jpg?
                if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
                    // L'aspect ratio è valido?
                    double aspectRatio = getAspectRatio(image);
                    double minAr = 1.8;
                    double maxAr = 2.2;

                    if (isRatioValid(minAr, maxAr, aspectRatio)) {
                        session.setAttribute("info", "Caricamento effettuato correttamente!");

                        //upload immagine nel server
                        for (Part part : request.getParts()) {
                            part.write(imageDirectory + "/" + gameId + ".jpg");
                        }

                        return true;
                    } else {
                        errors.add("Aspect ratio non valido.");
                    }
                } else {
                    errors.add("Non è un .jpg / .jpeg.");
                }
            } else {
                errors.add("File non è un immagine.");
            }
        } else {
            errors.add("Nessun file caricato.");
        }

        return false;
    }

    private double getAspectRatio(BufferedImage image) {
        return (double) image.getWidth() / image.getHeight();
    }

    private boolean isRatioValid(double minAr, double maxAr, double aspectRatio) {
        return aspectRatio>=minAr && aspectRatio<=maxAr;
    }
}
