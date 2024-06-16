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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Se l'utente non è autenticato, redirect alla pagina login
        Object userObj = session.getAttribute("user");
        if (userObj == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) userObj;

        // ottieni tutti gli ordini dell'utente
        OrderDAO orderDAO = new OrderDAO(Functions.getContextDatabase(this));
        List<Order> userOrders = orderDAO.getAll(user);
        request.setAttribute("orders",userOrders);

        System.out.println(userOrders);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/results/profile.jsp");
        rd.forward(request,response);
    }
}
