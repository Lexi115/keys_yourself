package com.sicappiello.keysyourself.core;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.ShoppingCart;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class AutoLoginFilter implements Filter {

    //Intercetta la richiesta alla servlet per effettuare il login automatico
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;


        HttpSession session = req.getSession(false);

        // La sessione non esiste?
        if(session == null) {
            // Crea nuova sessione
            session = req.getSession();
            session.setAttribute("cart",new ShoppingCart());
            session.setAttribute("total", String.format("%.2f", 0.0));
            session.setAttribute("isAdmin","false");

            //Verifica presenza authToken nel cookie (altrimenti è un guest e ha solo la sessione)
            Cookie authTokenCookie = Functions.getCookie("auth_token", req);
            if(authTokenCookie != null) {
                ServletContext context = req.getServletContext();
                Database database = (Database) context.getAttribute("db");
                UserDAO userDAO = new UserDAO(database);

                User user = userDAO.getByToken(authTokenCookie.getValue());
                if (user != null) {
                    session.setAttribute("user", user);
                    //controllo se è admin
                    if(user.isAdmin()){
                        session.setAttribute("isAdmin","true");
                    }
                }
            }
        }

        //controllo accesso alle funzioni da admin
        String path = req.getRequestURI().substring(req.getContextPath().length());
        if(path.startsWith("/admin")){
            if(Objects.equals(session.getAttribute("isAdmin"), "true")) {
                //può entrare
                chain.doFilter(req, res);
            } else {
                //non può entrare, redirect a login
                List<String> errors = new ArrayList<>();
                errors.add("Accesso negato.");
                session.setAttribute("error",errors);
                res.sendRedirect(req.getContextPath() + "/login");
            }
        } else {
        //non è una pagina admin continua normalmente
        chain.doFilter(req, res);
    }
    }
}
