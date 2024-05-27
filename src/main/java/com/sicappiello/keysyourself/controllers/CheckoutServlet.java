package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.*;
import com.sicappiello.keysyourself.models.dao.OrderDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    //clicca procedi al pagamento
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("cart") == null) {res.sendRedirect("index.jsp");}

        //in caso nel cart ci sta qualcosa
        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/checkout.jsp");
        rd.forward(req,res);

        //todo maybe : preleva da database informazioni di fatturazione

    }

    //clicca checkout
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //validator delle billing info
        HttpSession session = req.getSession();
        synchronized (session) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            Order order = new Order();

            //se l'utente esiste salviamo anche id utente
            if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
                order.setUserId(user.getUid());
            } else {
                // -1 perchè l'utente non ha un account
                order.setUserId(-1);
            }

            order.setFirstName(req.getParameter("firstName"));
            order.setLastName(req.getParameter("lastName"));
            order.setEmail(req.getParameter("email"));
            order.setPhoneNumber(req.getParameter("phone"));
            order.setAddress(req.getParameter("address"));
            order.setCity(req.getParameter("city"));
            order.setState(req.getParameter("state"));
            order.setZip(req.getParameter("zip"));
            order.setCountry(req.getParameter("country"));
            LocalDate date = LocalDate.now();
            order.setOrderDate(LocalDate.of(date.getYear(), date.getMonthValue(), date.getDayOfMonth()));

            String total = (String) session.getAttribute("total");
            total = total.replace(",",".");
            order.setPrice(Double.parseDouble(total));


            //converto ogni gioco in purchasedGame e genero un codice per ognuno, mettendoli infine nella lista dei giochi comprati
            List<PurchasedGame> purchasedGames = order.getGames();
            for (Game g : cart.getGames()) {
                purchasedGames.add(new PurchasedGame(g, g.getName(), Functions.generateCode()));
            }

            //salvo l'ordine nel database
            Database db = Functions.getContextDatabase(this);
            OrderDAO orderDAO = new OrderDAO(db);
            orderDAO.save(order);

            req.setAttribute("order", order);
            RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/thanks.jsp");
            rd.forward(req,res);

        }
    }
}
