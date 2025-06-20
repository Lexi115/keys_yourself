<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Carrello</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Carrello</p>
        </div>
        <div class="row">
            <c:forEach items="${sessionScope.cart.games}" var="game">
                <div class="col-12 mb-6">
                    <a href="game?id=${game.id}">
                        <div class="card clickable" style="width: 100%;">
                            <div class="row">
                                <div class="col-2 col-md-12 col-sm-12">
                                    <div class="thumbnail">
                                        <img src="assets/images/games/${game.id}.jpg" alt="Immagine del gioco">
                                    </div>
                                </div>
                                <div class="col-4 col-md-12 col-sm-12">
                                    <div style="padding-left: 10px">
                                        <p class="title">${game.name}</p>
                                        <p class="subtitle">${game.producer}</p>
                                        <p class="price">€ <span class="sub-lead"><fmt:formatNumber value="${game.price}" minFractionDigits="2" /></span></p>
                                    </div>
                                </div>
                                    <div class="col-2 col-md-6 right col-sm-12" style="margin-top: 30px;margin-right: 5px">
                                        <a href="cartremove?id=${game.id}">
                                            <button class="fieldButton clickableNoShadow">
                                                <i class="bi bi-bag-dash-fill"></i> Rimuovi
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
            </c:forEach>
            <c:if test="${empty sessionScope.cart.games}">
                <div class="sub-lead center">Il carrello è vuoto.</div>
            </c:if>
        </div>

        <div class="row right">
            <div class="col-12 right" style="text-align: end">
                <p class="price">Totale: € <span class="sub-lead">${sessionScope.total}</span></p>
            </div>
            <div class="col-12">
                <a href="${not empty sessionScope.cart.games ? 'checkout' : '#'}">
                    <button class="mb-2 fieldButton ${empty sessionScope.cart.games ? 'disabled' : 'clickableNoShadow'}">
                        <i class="bi bi-bag-check-fill"></i> Pagamento
                    </button>
                </a>
            </div>
        </div>
    </div>
</main>
</body>
</html>