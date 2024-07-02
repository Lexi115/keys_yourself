package com.sicappiello.keysyourself.util;

import com.google.common.hash.Hashing;
import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Random;

public class Functions {
    public static Database getContextDatabase(HttpServlet servlet) {
        Object obj = servlet.getServletContext().getAttribute("db");
        return obj == null ? null : (Database) obj;
    }

    public static String hash(String input) {
        return Hashing.sha256()
                .hashString(input, StandardCharsets.UTF_8)
                .toString();
    }

    public static boolean passwordVerify(String password, User user) {
        String hashedPassword = hash(password);
        return hashedPassword.equals(user.getPassword());
    }

    public static String sendAuthenticationToken(HttpServletResponse response, User user) {
        String token = hash(user.getEmail() + user.getPassword());
        Cookie cookie = new Cookie("auth_token", token);
        cookie.setSecure(true); // solo HTTPS
        cookie.setMaxAge(604800); // 7 giorni
        cookie.setPath("/");
        response.addCookie(cookie);
        return Functions.hash(token);
    }
    public static void clearAuthenticationToken(HttpServletResponse response) {
        Cookie cookie = new Cookie("auth_token", "");
        cookie.setSecure(true); // solo HTTPS
        cookie.setMaxAge(0); // rimuovi cookie settando maxAge a 0
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public static Cookie getCookie(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }

        return null;
    }

    //generate code string

    private static char randomAlphanumeric() {
        String alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        return alphanumeric.charAt(random.nextInt(alphanumeric.length()));
    }

    public static String generateCode(){
        StringBuilder code = new StringBuilder();
        for(int i=1;i<20;i++){
            if(i%5==0){
                code.append("-");
            } else {
                code.append(randomAlphanumeric());
            }
        }
        return code.toString();
    }

    public static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch(NumberFormatException e){
            return false;
        }
    }

    public static boolean isImageValid(Part filePart,List<String> errors,boolean required) throws IOException {
        //Non hai caricato nessun'immagine?
        if(filePart == null){
            if(required){
                //Non hai il permesso di non uploadare un'immagine
                return false;
            } else {
                //Utilizzi l'immagine già presente
                return true;
            }
        }

        // Controllo dimensioni appropriate
        long fileSize = filePart.getSize();
        if(fileSize <= FileSize.MIN ) {
            errors.add("Nessuna immagine caricata.");
            return false;
        }
        if (fileSize > FileSize.MAX) {
            errors.add("Immagine troppo grande <b>(Max " + FileSize.MAX_MB + " MB)</b>");
            return false;
        }

        // È un'immagine?
        BufferedImage image = ImageIO.read(filePart.getInputStream());
        if (image == null) {
            errors.add("File non è un immagine.");
            return false;
        }

        //E' un .jpg?
        String fileName = filePart.getSubmittedFileName().toLowerCase();
        if (!fileName.endsWith(".jpg") && !fileName.endsWith(".jpeg")) {
            errors.add("Non è un .jpg / .jpeg.");
            return false;
        }

        // L'aspect ratio è valido?
        double aspectRatio = Functions.getAspectRatio(image);
        double minAr = 1.8;
        double maxAr = 2.2;

        if (!isRatioValid(minAr, maxAr, aspectRatio)) {
            errors.add("Aspect ratio non valido.");
            return false;
        }

        return true;
    }


    public static void uploadImage(HttpServletRequest request, ServletContext context, int gameId) throws ServletException, IOException {
        // Cartella dove caricare le immagini
        String relativePath = "/assets/images/games";
        String imageDirectory = context.getRealPath(relativePath);

        //upload dell'immagine sul server
        for (Part part : request.getParts()) {
            part.write(imageDirectory + "/" + gameId + ".jpg");
        }
    }

    public static boolean nameAlreadyUsed(List<Game> games, String name){
        return !games.isEmpty() && games.get(0).getName().equalsIgnoreCase(name);
    }

    public static double getAspectRatio(BufferedImage image) {
        return (double) image.getWidth() / image.getHeight();
    }

    public static boolean isRatioValid(double minAr, double maxAr, double aspectRatio) {
        return aspectRatio>=minAr && aspectRatio<=maxAr;
    }
}
