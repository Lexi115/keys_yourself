package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.enums.Role;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.models.validators.UserValidator;
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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("tel");

        Database db = Functions.getContextDatabase(this);
        UserDAO userDAO = new UserDAO(db);
        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<>();

        try {
            // Vedi se l'utente esiste già
            User existingUser = userDAO.getByEmail(email);

            if (existingUser == null) {
                //Utente non esiste, si può salvare
                User newUser = createUser(email, password, name, surname, address, phoneNumber);
                UserValidator validator = new UserValidator();

                // Controlla che l'utente sia valido (input form corretti)
                if (validator.validate(newUser, errors)) {

                    // Fai hash della password
                    String hashedPassword = Functions.hash(password);
                    newUser.setPassword(hashedPassword);

                    if(userDAO.save(newUser)==1) {
                        session.setAttribute("info", "Registrazione effettuata correttamente!");
                        response.sendRedirect(request.getContextPath() + "/login");
                        return;
                    } else {
                        errors.add("Si è verificato un errore lato server");
                    }
                }
            } else {
                //Utente esiste
                errors.add("Utente già esistente!");
            }

            session.setAttribute("error", errors);
            doGet(request, response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("registerPage.jsp");
        rd.forward(req,res);
    }

    private User createUser(String email, String password, String name, String surname, String address, String phoneNumber) {
        User u = new User();

        u.setEmail(email);

        u.setPassword(password);

        u.setName(name);
        u.setSurname(surname);
        u.setAddress(address);
        u.setPhoneNumber(phoneNumber);

        // Imposta ruolo default (utente)
        u.setRoleId(Role.USER);

        return u;
    }
}

