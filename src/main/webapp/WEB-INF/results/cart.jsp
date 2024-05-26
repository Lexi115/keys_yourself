<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Carrello</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
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
                                        <img src="assets/images/tmp.jpg">
                                    </div>
                                </div>
                                <div class="col-10 col-md-12 col-sm-12">
                                    <div style="padding-left: 10px">
                                        <p class="title">${game.name}</p>
                                        <p class="subtitle">${game.producer}</p>
                                        <p class="price">€ <span class="sub-lead">${game.price}</span></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 col-md-6 col-sm-12">
                                        <a href="cartremove?id=${game.id}">
                                            <button class="fieldButton clickableNoShadow">
                                                <i class="bi bi-bag-dash-fill"></i> Rimuovi
                                            </button>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="row right">
            <div class="col-12 right" style="text-align: end">
                <p class="price">Totale: € <span class="sub-lead">${sessionScope.total}</span></p>
            </div>
            <div class="col-12">
                <button class="fieldButton clickableNoShadow">
                    Vai al checkout
                </button>
            </div>
        </div>
    </div>
</main>
</body>
</html>