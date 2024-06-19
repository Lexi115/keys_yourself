<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="row center" style="justify-content: flex-start;">
            <c:if test="${user.admin}">
                <a href="${pageContext.request.contextPath}/admin/addGame">
                    <button class="offset-3 mb-3 mt-3 fieldButton clickableNoShadow">
                        <i class="bi bi-plus-lg"></i> Aggiungi un gioco
                    </button>
                </a>
            </c:if>
            <h1></h1>
        </div>
        <div class="row" id="search-result">
            <c:forEach items="${requestScope.games}" var="game">
                <div class="col-4 col-md-6 col-sm-12 mb-6 center">

                    <!-- Card del gioco cliccabile -->
                    <a href="game?id=${game.id}">
                        <div class="card clickable">
                            <div class="row">
                                <div class="thumbnail">
                                    <img src="assets/images/games/${game.id}.jpg" alt="Immagine">
                                </div>
                            </div>
                            <div class="row">
                                <p class="title">${game.name}</p>
                                <p class="subtitle">${game.producer}</p>
                            </div>
                            <div class="row">
                                <p class="price right">€ <span class="sub-lead"><fmt:formatNumber value="${game.price}" minFractionDigits="2" /></span></p>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
            <c:if test="${empty requestScope.games}">
                <div class="sub-lead center">Nessun risultato pertinente</div>
            </c:if>
        </div>
    </div>
</main>
<script>
    let searchBar = document.getElementById('searchBar');
    let searchResult = document.getElementById('search-result');
    let queryStringSpan = document.getElementById('queryStringSpan');

    searchBar.focus();

    searchBar.oninput = function () {
        fetch('AsyncSearch?q=' + searchBar.value)
            .then(response => response.json())
            .then(json => {
                // resetta il contenuto del div searchresult
                searchResult.innerHTML = '';

                // giochi non trovati...
                if (json.length === 0) {
                    let div = document.createElement('div');
                    div.classList.add('sub-lead', 'center');
                    div.innerHTML = 'Nessun risultato pertinente';
                    searchResult.appendChild(div);
                }
                else
                {
                    // per ogni gioco crea una card e "appendila" al div container
                    json.forEach(game => {
                        let card = createCard(game);
                        searchResult.appendChild(card);
                    })
                }
            });
    }

    function createCard(game) {
        //creiamo la card del gioco
        let container = document.createElement('div');
        container.classList.add('col-4','col-md-6','col-sm-12','mb-6','center');

        let a = document.createElement('a');
        a.href = 'game?id=' + game.id;

        let card = document.createElement('div');
        card.classList.add('card','clickable');

        let row = document.createElement('div');
        row.classList.add('row');

        let row2 = document.createElement('div');
        row2.classList.add('row');

        let row3 = document.createElement('div');
        row3.classList.add('row');

        let thumbnail = document.createElement('div');
        thumbnail.classList.add('thumbnail');

        let img = document.createElement('img');
        img.src = 'assets/images/games/'+ game.id +'.jpg';
        img.alt = 'Immagine gioco';

        let pTitle = document.createElement('p');
        pTitle.classList.add('title');
        pTitle.innerHTML = game.name;

        let pSubTitle = document.createElement('p');
        pSubTitle.classList.add('subtitle');
        pSubTitle.innerHTML = game.producer;

        let pPrice = document.createElement('p');
        pPrice.classList.add('price','right');
        pPrice.innerHTML =  '€ ';

        let span = document.createElement('span');
        span.classList.add('sub-lead');
        span.innerHTML = game.price;

        //incapsulamento degli elementi

        pPrice.appendChild(span);
        row3.appendChild(pPrice);
        row2.appendChild(pTitle);
        row2.appendChild(pSubTitle);
        thumbnail.appendChild(img);
        row.appendChild(thumbnail);
        card.appendChild(row);
        card.appendChild(row2);
        card.appendChild(row3);
        a.appendChild(card);
        container.appendChild(a);

        return container;
    }

</script>
</body>
</html>