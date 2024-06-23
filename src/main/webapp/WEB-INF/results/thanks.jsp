<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grazie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class=w-90">
    <div class="lead center" style="font-size: 30px; margin-top: 3px; ">Grazie per l'acquisto!</div>
    <div class="sub-lead">Giochi acquistati</div>
    <c:forEach items="${requestScope.order.games}" var="purchasedGame">
        <div style="padding-left: 5px;padding-right: 15px;" class="col-12 mb-6">
                <div class="card gameContainerCheckout" style="width: 100%;">
                    <div class="row">
                        <div class="col-2 col-md-12 col-sm-12">
                            <a href="game?id=${purchasedGame.game.id}">
                            <div class="clickable thumbnail">
                                <img src="assets/images/games/${purchasedGame.game.id}.jpg">
                            </div>
                            </a>
                        </div>
                        <div class="col-10 col-md-12 col-sm-12">
                            <div style="padding-left: 10px">
                                <div class="lead" style="margin-top: 30px">${purchasedGame.gameName}</div>
                                <div class="sub-lead" style="margin-top: 5px">${purchasedGame.gameCode}</div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </c:forEach>
    <div class="right col-3 col-md-12 col-sm-12 offset-md-0 mb-5" style="margin-right: 20px">
        <a href="">
            <button class="fieldButton clickableNoShadow">
                <i class="bi bi-house"></i> Home
            </button>
        </a>
    </div>
    </div>
</main>
</body>
</html>
