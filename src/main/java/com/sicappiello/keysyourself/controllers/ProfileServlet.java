package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.models.beans.Genre;
import com.sicappiello.keysyourself.models.beans.Order;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.GameDAO;
import com.sicappiello.keysyourself.models.dao.OrderDAO;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO(Functions.getContextDatabase(this));
        User userFound = userDAO.getById(Integer.parseInt(request.getParameter("id")));
        if(userFound!=null){
            request.setAttribute("userFound",userFound);
            OrderDAO orderDAO = new OrderDAO(Functions.getContextDatabase(this));
            List<Order> userOrders = orderDAO.getAll(userFound);
            request.setAttribute("userOrders",userOrders);
        } else {
            throw new RuntimeException("Nessun utente trovato.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/results/profile.jsp");
        rd.forward(request,response);
    }
}
