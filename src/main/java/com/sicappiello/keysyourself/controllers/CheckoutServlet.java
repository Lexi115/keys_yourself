package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.core.interfaces.Validator;
import com.sicappiello.keysyourself.models.beans.*;
import com.sicappiello.keysyourself.models.dao.OrderDAO;
import com.sicappiello.keysyourself.models.validators.CreditCardValidator;
import com.sicappiello.keysyourself.models.validators.OrderValidator;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    //clicca procedi al pagamento
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (((ShoppingCart) session.getAttribute("cart")).getGames().isEmpty()) {
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }
        System.out.println(req.getParameter("firstName"));

        //in caso nel cart ci sta qualcosa
        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/checkout.jsp");
        rd.forward(req,res);

        //todo maybe : preleva da database informazioni di fatturazione

    }

    //clicca checkout
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(req.getParameter("firstName"));
        synchronized (session) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart.getGames().isEmpty()) {
                res.sendRedirect(req.getContextPath() + "/");
                return;
            }

            Order order = new Order();
            CreditCard creditCard = new CreditCard();

            //se l'utente esiste salviamo anche id utente
            if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
                order.setUserId(user.getUid());
            } else {
                // -1 perchè l'utente non ha un account
                order.setUserId(-1);
            }

            //creo l'ordine
            order.setFirstName(req.getParameter("firstName"));
            order.setLastName(req.getParameter("lastName"));
            order.setEmail(req.getParameter("email"));
            order.setPhoneNumber(req.getParameter("phoneNumber"));
            order.setAddress(req.getParameter("address"));
            order.setCity(req.getParameter("city"));
            order.setState(req.getParameter("state"));
            order.setZip(req.getParameter("zip"));
            order.setCountry(req.getParameter("country"));
            LocalDate date = LocalDate.now();
            order.setOrderDate(LocalDate.of(date.getYear(), date.getMonthValue(), date.getDayOfMonth()));

            //creo l'oggetto carta di credito
            creditCard.setCardNumber(req.getParameter("creditCardNumber"));
            creditCard.setExpirationDate(req.getParameter("creditCardExpiration"));
            creditCard.setCvv(req.getParameter("creditCardCVV"));


            //valido l'ordine e la carta di credito
            OrderValidator orderValidator = new OrderValidator();
            CreditCardValidator creditCardValidator = new CreditCardValidator();

            List<String> errors = new ArrayList<>();
            //todo FINIRE IL CONTROLLO
            boolean isValidOrder = orderValidator.validate(order,errors);
            boolean isValidCreditCard = creditCardValidator.validate(creditCard,errors);
            if((isValidOrder)&&(isValidCreditCard)) {

                String total = (String) session.getAttribute("total");
                total = total.replace(",", ".");
                order.setPrice(Double.parseDouble(total));


                //converto ogni gioco in purchasedGame e genero un codice per ognuno, mettendoli infine nella lista dei giochi comprati
                List<PurchasedGame> purchasedGames = order.getGames();
                for (Game g : cart.getGames()) {
                    purchasedGames.add(new PurchasedGame(g, g.getName(), Functions.generateCode()));
                }

                //salvo l'ordine e i giochi acquistati nel database
                Database db = Functions.getContextDatabase(this);
                OrderDAO orderDAO = new OrderDAO(db);
                orderDAO.save(order);

                //svuoto il carrello
                session.setAttribute("cart", new ShoppingCart());
                session.setAttribute("total", String.format("%.2f", 0.0));

                //aggiungo l'ordine nella request per la pagina grazie per l'acquisto
                req.setAttribute("order", order);

                RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/thanks.jsp");
                rd.forward(req, res);
            } else {

                //torna alla pagine del checkout
                session.setAttribute("error", errors);
                doGet(req, res);
            }
        }
    }
}
