<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cappi
  Date: 27/05/2024
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>grazie chemp</title>
</head>
<body>
grazie per l'acquisto<br>
${requestScope.order}<br><br>
<c:forEach items="${requestScope.order.games}" var="purchasedGame">
    gioco 1 : ${purchasedGame} <br>
</c:forEach>

</body>
</html>
