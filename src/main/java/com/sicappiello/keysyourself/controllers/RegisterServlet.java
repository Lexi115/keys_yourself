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

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("tel");

        Database db = Functions.getContextDatabase(this);
        UserDAO userDAO = new UserDAO(db);
        User user;

        try {
            // Vedi se l'utente esiste già
            user = userDAO.getByEmail(email);
            if (user == null) {
                //Utente non esiste, si può salvare
                User u = createUser(email, password, name, address, phoneNumber);
                userDAO.save(u);

                request.getSession().setAttribute("info", "Registrazione effettuata correttamente!");
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            } else {
                //Utente esiste
                request.getSession().setAttribute("RegError", "Utente già esistente!");
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

    private User createUser(String email, String password, String name, String address, String phoneNumber) {
        User u = new User();

        u.setEmail(email);

        // TODO: sostituire con hashed password!!!!!!
        u.setPassword(password);

        u.setName(name);
        u.setAddress(address);
        u.setPhoneNumber(phoneNumber);

        // Imposta ruolo default (utente)
        u.setRoleId(0);

        u.setAuthToken("xxxxxxxx");

        return u;
    }
}

