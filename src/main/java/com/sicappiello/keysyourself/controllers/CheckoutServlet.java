package com.sicappiello.keysyourself.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    //clicca procedi al pagamento
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
        rd.forward(req,res);
    }

    //clicca checkout
    public void doPost(HttpServletRequest req, HttpServletResponse res){

    }
}
