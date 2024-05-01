package com.sicappiello.keysyourself.core;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

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

            //Verifica presenza authToken nel cookie (altrimenti è un guest e ha solo la sessione)
            Cookie authTokenCookie = Functions.getCookie("auth_token", req);
            if(authTokenCookie != null) {
                ServletContext context = req.getServletContext();
                Database database = (Database) context.getAttribute("db");
                UserDAO userDAO = new UserDAO(database);

                User user = userDAO.getByToken(authTokenCookie.getValue());
                if (user != null) {
                    session.setAttribute("user", user);
                }
            }
        }
            //Continua la chain di filter
            chain.doFilter(req, res);
    }
}
