<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
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
                <jsp:include page="/WEB-INF/include/errorAlert.jsp" />
                <div>
                    <h4>Indirizzo di Fatturazione</h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="firstName" type="text" class="input" id="firstName" placeholder="Nome" value="${param.firstName}" pattern=".{1,150}" required>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="lastName" type="text" class="input" id="lastName" placeholder="Cognome" value="${param.lastName}" pattern=".{1,50}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="email" type="email" class="input" id="email" placeholder="Email" value="${param.email}" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" required>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <input name="phoneNumber" type="tel" class="input" id="phone" placeholder="Telefono" value="${param.phoneNumber}" pattern="^\+\d{2,6}\s?[\d\s]{10,16}$" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-12 col-sm-12 p-1">
                                <input name="address" type="text" class="input" id="address" placeholder="Indirizzo" value="${param.address}" pattern=".{1,100}" required>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                                <input name="city" type="text" class="input" id="city" placeholder="Città" value="${param.city}" pattern=".{1,100}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12 p-1">
                                <input name="state" type="text" class="input" id="state" placeholder="Regione" value="${param.state}" pattern=".{1,100}" required>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12 p-1">
                                <input name="zip" type="text" class="input" id="zip" placeholder="CAP" value="${param.zip}" pattern="^\d{5}$" required>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                                <input name="country" type="text" class="input" id="country" placeholder="Paese" value="${param.country}" pattern=".{1,50}" required>
                            </div>
                        </div>
                </div>

                <div>
                    <h4>Metodo di pagamento</h4>
                    <img class="cards" src="assets/images/cards.png">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                            <input name="creditCardNumber" type="text" class="input" id="creditCardNumber" placeholder="Numero carta di credito" value="${param.creditCardNumber}" pattern="^\d{16}$" required>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12 p-1">
                            <input name="creditCardExpiration" type="text" class="input" id="creditCardExpiration" placeholder="mm/YY" value="${param.creditCardExpiration}" pattern="^(0[1-9]|1[0-2])\/([0-9]{4})$" required>
                        </div>
                        <div class="col-lg-2 col-md-12 col-sm-12 p-1">
                            <input name="creditCardCVV" type="text" class="input" id="creditCardCVV" placeholder="CVV" value="${param.creditCardCVV}" pattern="^\d{3}$" required>
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