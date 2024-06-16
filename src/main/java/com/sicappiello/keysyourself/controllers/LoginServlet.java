package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Database db = Functions.getContextDatabase(this);
        UserDAO userDAO = new UserDAO(db);
        User user;
        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<>();

        try {
            // Cerca utente con quella mail
            user = userDAO.getByEmail(email);
            if (user != null) {

                // Verifica password inserita con quella salvata nel database
                if (Functions.passwordVerify(password,user)) {
                    session.setAttribute("user", user);
                    user.setAuthToken(Functions.sendAuthenticationToken(response,user));
                    userDAO.update(user);

                    //controllo se è admin
                    if(user.isAdmin()){
                        session.setAttribute("isAdmin","true");
                    } else {
                        session.setAttribute("isAdmin","false");
                    }

                    response.sendRedirect(request.getContextPath() + "/");
                    return;
                } else {
                    errors.add("Password errata!");
                }

            } else {
                errors.add("Utente non trovato!");
            }

            session.setAttribute("error", errors);
            doGet(request, response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("loginPage.jsp");
        rd.forward(req,res);
    }
}
