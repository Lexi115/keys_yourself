<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cappi
  Date: 17/05/2024
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bazingaz</title>
</head>
<body>
vefefvreve
<c:forEach items="${sessionScope.cart.games}" var="game">
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
    </div>
</c:forEach>


</body>
</html>
