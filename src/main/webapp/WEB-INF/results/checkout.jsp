<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Checkout</p>
        </div>

        <form action="checkout" method="post">
        <div class="row">
            <!-- Colonna indirizzi di fatturazione -->
            <div class="col-lg-8 col-md-12 col-sm-12 p-6">
                <div>
                    <h4>Indirizzo di Fatturazione</h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="firstName" type="text" class="input" id="firstName" placeholder="Nome" required>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="lastName" type="text" class="input" id="lastName" placeholder="Cognome" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="email" type="email" class="input" id="email" placeholder="Email" required>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="phoneNumber" type="tel" class="input" id="phone" placeholder="Telefono" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-12 col-sm-12 p-1">
                                <input name="address" type="text" class="input" id="address" placeholder="Indirizzo" required>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                                <input name="city" type="text" class="input" id="city" placeholder="Città" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12 p-1">
                                <input name="state" type="text" class="input" id="state" placeholder="Provincia" required>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12 p-1">
                                <input name="zip" type="text" class="input" id="zip" placeholder="CAP" required>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                                <input name="country" type="text" class="input" id="country" placeholder="Paese" required>
                            </div>
                        </div>
                </div>

                <div>
                    <h4>Metodo di pagamento</h4>
                    <img class="cards" src="assets/images/cards.png">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                            <input name="creditCardNumber" type="text" class="input" id="creditCardNumber" placeholder="Numero carta di credito" required>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                            <input name="creditCardExpiration" type="text" class="input" id="creditCardExpiration" placeholder="mm/YY" required>
                        </div>
                        <div class="col-lg-2 col-md-12 col-sm-12 p-1">
                            <input name="creditCardCVV" type="text" class="input" id="creditCardCVV" placeholder="CVV" required>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Colonna riepilogo ordine -->
            <div class="col-lg-4 col-md-12 col-sm-12 p-6">
                <div class="riepilogoContainer">
                    <h4 class="center">Riepilogo</h4>

                    <div>
                        <ul>
                            <c:forEach items="${sessionScope.cart.games}" var="game">
                                <li>${game.name} - € ${game.price}</li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="row right">
                        <div class="col-12 right" style="text-align: end">
                            <p class="price">Totale: € <span class="sub-lead">${sessionScope.total}</span></p>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="fieldButton clickableNoShadow">
                                <i class="bi bi-bag-check-fill"></i> Acquista
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</main>
</body>
</html>