<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profilo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="gameContainer mt-4 mb-4 w-90">
        <div class="row">
            <div class="lead">${user.fullName}</div>
            <div class="sub-lead">${user.email}</div>
        </div>
        <p>
            <b>Indirizzo:</b> ${user.address}<br>
            <b>Telefono:</b> ${user.phoneNumber}
        </p>
    </div>

    <div class="w-90">
        <div class="row">
            <c:forEach items="${requestScope.orders}" var="order">
                <div class="col-12 mb-4">
                    <div class="card" style="width: 100%;">
                        <div class="row">
                            <p class="sub-lead">Ordine #${order.id}</p>
                            <ul>
                                <c:forEach items="${order.games}" var="game">
                                    <li>${game.gameName}</li>
                                </c:forEach>
                            </ul>
                            <p class="price">€ <span class="sub-lead">${order.price}</span></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty requestScope.orders}">
                <div class="sub-lead center">Nessun ordine processato</div>
            </c:if>
        </div>
    </div>

</main>
</body>
</html>