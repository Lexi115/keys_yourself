<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cerca</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Risultati per: <b>${param.query}</b></p>
        </div>
        <div class="row">
            <c:forEach items="${requestScope.games}" var="game">
                <div class="col-4 col-md-6 col-sm-12 mb-6 center">
                    <div class="card clickable">
                        <div class="row">
                            <div class="thumbnail">
                                <img src="assets/images/tmp.jpg">
                            </div>
                        </div>
                        <div class="row">
                            <p class="title">${game.name}</p>
                            <p class="subtitle">${game.producer}</p>
                        </div>
                        <div class="row">
                            <p class="price right">€ <span class="sub-lead">${game.price}</span></p>
                        </div>
                    </div>
                    <form method="post" action="cart"><input type="hidden" name="id" value="${game.id}">
                        <input type="submit" value="Aggiungi al carrello"> </form>
                </div>
            </c:forEach>
        </div>
    </div>
</main>
</body>
</html>