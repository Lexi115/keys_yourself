package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
            Functions.clearAuthenticationToken(res);
        }

        // redirect alla home
        res.sendRedirect(req.getContextPath() + "/");
    }
}
