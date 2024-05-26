<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${game.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="gameContainer mt-4 w-90">
        <div class="row">
            <div class="lead mb-1">${game.name}</div>
            <div class="sub-lead mb-6">${game.producer}</div>
        </div>
        <div class="row">
            <div class="gamePageThumbnail col-7 col-md-12">
                <img src="assets/images/tmp.jpg">
            </div>
            <div class="col-4 col-md-12 offset-1 offset-md-0" style="padding:0px 17px">
                <div class="mb-11 mt-6 row">
                    <div class="col-12">
                        <div class="sub-lead mb-1">Descrizione</div>
                        <div class="game-description">${game.description}</div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 mt-6">
                    <div class="lead mb-2">€ ${game.price}</div>
                    <form method="post" action="cart">
                        <input type="hidden" name="id" value="${game.id}">
                        <jsp:include page="../include/infoAlert.jsp" />
                        <jsp:include page="../include/errorAlert.jsp" />
                        <button class="fieldButton clickableNoShadow" type="submit">
                            Aggiungi al carrello
                        </button>
                    </form>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>