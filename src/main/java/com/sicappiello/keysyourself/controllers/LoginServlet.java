package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Database db = Functions.getContextDatabase(this);
        UserDAO userDAO = new UserDAO(db);
        User user;

        try {
            // Cerca utente con quella mail
            user = userDAO.getByEmail(email);
            if (user != null) {

                // TODO: sostituire con hashed password!!!!!!
                if (user.getPassword().equals(password)) {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/");
                    return;
                } else {
                    request.setAttribute("error", "Password errata!");
                }

            } else {
                request.setAttribute("error", "Utente non trovato!");
            }

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
