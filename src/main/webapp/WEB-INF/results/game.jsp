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
    <div class="container w-90">
        <div class="row">
            <p class="lead">${game.name}</p>
        </div>
        <div class="row">
            <div class="col-2 col-md-6 col-sm-12">
                <form method="post" action="cart">
                    <input type="hidden" name="id" value="${game.id}">
                    <button class="fieldButton clickableNoShadow" type="submit">
                        Aggiungi al carrello
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>