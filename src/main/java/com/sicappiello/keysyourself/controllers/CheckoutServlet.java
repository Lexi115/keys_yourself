package com.sicappiello.keysyourself.controllers;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.*;
import com.sicappiello.keysyourself.models.dao.GameDAO;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private Set<Game> getInvalidGames(Set<Game> games)
    {
        Set<Game> invalidGames = new HashSet<>();
        GameDAO gameDAO = new GameDAO(Functions.getContextDatabase(this));
        for (Game g : games) {
            if (gameDAO.getById(g.getId()) == null) {
                invalidGames.add(g);
            }
        }

        return invalidGames;
    }

    //clicca procedi al pagamento
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Set<Game> gamesInCart = cart.getGames();


        Set<Game> invalidGames = getInvalidGames(gamesInCart);

        //Per evitare il checkout fantasma (con giochi che non esistono più)
        //Rimuovi giochi non più esistenti
        if(!invalidGames.isEmpty()) {
            for (Game g : invalidGames) {
                cart.removeGame(g);
            }
            session.setAttribute("total", String.format("%.2f",cart.getTotal()));
            session.setAttribute("info", "Sono stati rimossi dei giochi invalidi (" + invalidGames.size() + ")");
        }

        //Il cart è vuoto? Rimanda alla home page
        if (gamesInCart.isEmpty()){
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/results/checkout.jsp");
        rd.forward(req,res);
    }

    //clicca checkout
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        synchronized (session) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Set<Game> gamesInCart = cart.getGames();

            if (gamesInCart.isEmpty()) {
                res.sendRedirect(req.getContextPath() + "/");
                return;
            }

            Set<Game> invalidGames = getInvalidGames(gamesInCart);

            //Per evitare il checkout fantasma (con giochi che non esistono più)
            //Rimuovi giochi non più esistenti
            if(!invalidGames.isEmpty()) {
                for (Game g : invalidGames) {
                    cart.removeGame(g);
                }
                session.setAttribute("total", String.format("%.2f",cart.getTotal()));
                session.setAttribute("info", "Sono stati rimossi dei giochi invalidi (" + invalidGames.size() + ")");
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

            boolean isValidOrder = orderValidator.validate(order,errors);
            boolean isValidCreditCard = creditCardValidator.validate(creditCard,errors);
                if((!isValidOrder)||(!isValidCreditCard)) {
                    //torna alla pagina del checkout
                    session.setAttribute("error", errors);
                    doGet(req, res);
                    return;
                }

                //Formatting del totale
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
            }
        }
    }
