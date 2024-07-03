<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${game.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <jsp:include page="../include/errorAlert.jsp" />
    <jsp:include page="../include/infoAlert.jsp" />
    <div class="gameContainer mt-4 mb-3 w-90">
        <div class="row">
            <div class="lead mb-1">${game.name}</div>
            <div class="sub-lead mb-6">${game.producer}</div>
        </div>
        <div class="row">
            <div class="gamePageThumbnail col-lg-7 col-md-12 col-sm-12">
                <img src="assets/images/games/${game.id}.jpg">
            </div>
            <div class="col-4 col-md-12 col-sm-12 offset-1 offset-md-0 offset-sm-0" style="padding:0px 17px">
                <div class="mb-11 mt-6 row">
                    <div class="col-12">
                        <div class="sub-lead mb-1">Descrizione</div>
                        <div class="game-description">${game.description}</div>
                    </div>
                </div>
                <div class="mb-11 mt-6 row">
                    <div class="col-12">
                        <div class="sub-lead mb-1">Generi</div>
                        <div class="game-description">${gameGenres}</div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 mt-6">
                    <div class="lead mb-2">€ <fmt:formatNumber value="${game.price}" minFractionDigits="2" /></div>
                        <jsp:include page="../include/infoAlert.jsp" />
                        <jsp:include page="../include/errorAlert.jsp" />
                        <form method="post" action="cart">
                            <input type="hidden" name="id" value="${game.id}">
                            <button class="fieldButton clickableNoShadow" type="submit">
                                <i class="bi bi-cart-plus"></i> Aggiungi al carrello
                            </button>
                        </form>
                        <c:if test="${user.admin}">
                            <div class="row mt-2">
                                <div class="col-lg-5 col-md-12 col-sm-12">
                                    <button onclick="location.href='${pageContext.request.contextPath}/admin/removeGame?id=${game.id}'" class="fieldButton clickableNoShadow mb-2">
                                        <i class="bi bi-trash3"></i> Rimuovi gioco
                                    </button >
                                </div>
                                <div class="col-lg-5 col-md-12 col-sm-12 offset-lg-2">
                                    <button onclick="location.href='${pageContext.request.contextPath}/admin/editGame?id=${game.id}'" class="fieldButton clickableNoShadow mb-2">
                                        <i class="bi bi-gear-wide-connected"></i> Modifica gioco
                                    </button >
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                </div>
            </div>
        </div>
</main>
</body>
</html>