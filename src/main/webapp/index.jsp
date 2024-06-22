<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/style.css" rel="stylesheet">
    <link href="./assets/css/custom.css" rel="stylesheet">
</head>
<body>
<jsp:include page="WEB-INF/include/header.jsp" />
<jsp:include page="WEB-INF/include/errorAlert.jsp" />
<jsp:include page="WEB-INF/include/infoAlert.jsp" />

<main>

    <!-- Banner -->
    <div class="bg-container">

        <section class="hero">

            <h1 class="hero-title">Benvenuto</h1>
            <p class="hero-subtitle">Scopri i migliori giochi ai prezzi più bassi del mercato</p>

        </section>
        <!-- Sfondo scorrevole -->

        <div class="hero-bg"></div>

    </div>
    <!-- Parte principale -->
    <div class="container w-90">

        <section class="gameContainer" style="margin-top: 30px">
            <h1 style="font-size:340px">Giochi del giorno</h1>
            <div class="row" id="idk">
                <c:forEach items="${applicationScope.gamesOfTheDay}" var="game">
                    <div class="col-lg-4 col-md-12 col-sm-12 flexHorizontal p-2">

                        <!-- Card del gioco cliccabile -->
                        <a href="game?id=${game.id}">
                            <div class="card clickable">
                                <div class="row">
                                    <div class="thumbnail">
                                        <img src="assets/images/games/${game.id}.jpg" alt="Immagine">
                                    </div>
                                </div>
                                <div class="row">
                                    <p class="title cut-text">${game.name}</p>
                                    <p class="subtitle cut-text">${game.producer}</p>
                                    <p class="price cut-text">€ <span class="sub-lead"><fmt:formatNumber value="${game.price}" minFractionDigits="2" /></span></p>
                                </div>

                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </section>

        <section>
            <h2>Ultime uscite</h2>
            <c:forEach items="${requestScope.latestGames}" var="game">
                <div class="col-lg-4 col-md-12 col-sm-12 flexHorizontal p-2">

                    <!-- Card del gioco cliccabile -->
                    <a href="game?id=${game.id}">
                        <div class="card clickable">
                            <div class="row">
                                <div class="thumbnail">
                                    <img src="assets/images/games/${game.id}.jpg" alt="Immagine">
                                </div>
                            </div>
                            <div class="row">
                                <p class="title cut-text">${game.name}</p>
                                <p class="subtitle cut-text">${game.producer}</p>
                                <p class="price cut-text">€ <span class="sub-lead"><fmt:formatNumber value="${game.price}" minFractionDigits="2" /></span></p>
                            </div>

                        </div>
                    </a>
                </div>
            </c:forEach>
        </section>

        <section>
            <h2>Sotto i €10</h2>
            <c:forEach items="${requestScope.cheapGames}" var="game">
                <div class="col-lg-4 col-md-12 col-sm-12 flexHorizontal p-2">

                    <!-- Card del gioco cliccabile -->
                    <a href="game?id=${game.id}">
                        <div class="card clickable">
                            <div class="row">
                                <div class="thumbnail">
                                    <img src="assets/images/games/${game.id}.jpg" alt="Immagine">
                                </div>
                            </div>
                            <div class="row">
                                <p class="title cut-text">${game.name}</p>
                                <p class="subtitle cut-text">${game.producer}</p>
                                <p class="price cut-text">€ <span class="sub-lead"><fmt:formatNumber value="${game.price}" minFractionDigits="2" /></span></p>
                            </div>

                        </div>
                    </a>
                </div>
            </c:forEach>
        </section>


    </div>
</main>
<script>
    // JavaScript può essere aggiunto qui
</script>
</body>
</html>
