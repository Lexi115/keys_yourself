<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cerca</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body>

<jsp:include page="../include/header.jsp"/>
<main>

    <div class="container w-90">
        <div class="row center" style="justify-content: flex-start;">
            <c:if test="${user.admin}">
                <a href="${pageContext.request.contextPath}/admin/addGame">
                    <button class="center mb-3 mt-3 fieldButton clickableNoShadow">
                        <i class="bi bi-plus-lg"></i> Aggiungi un gioco
                    </button>
                </a>
            </c:if>
            <h1></h1>
        </div>

        <div class="row" id="search-result">
            <c:forEach items="${requestScope.games}" var="game">
                <div class="col-lg-4 col-md-6 col-sm-12 flexHorizontal p-2">

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
            <c:if test="${empty requestScope.games}">
                <div class="sub-lead center">Nessun risultato pertinente</div>
            </c:if>
        </div>

        <c:if test="${not empty requestScope.games}">
        <!-- Div di cambio pagina -->
        <div class="row flexHorizontal" style="align-items: center" id="pagination">
            <div class="col-lg-1 col-md-2 col-sm-3 ${not requestScope.isLeftAvailable ? "disabled" : ""}">
                <button ${not requestScope.isLeftAvailable ? 'disabled' : ''} onclick="location.href = '${pageContext.request.contextPath}/search?query=${param.query}&p=${requestScope.pageNumber - 1}';" class="center mb-3 mt-3 fieldButton ${not requestScope.isLeftAvailable ? '' : 'clickableNoShadow'}">
                    <i class="bi bi-caret-left-fill"></i>
                </button>
            </div>
            <div class="col-lg-10 col-md-8 col-sm-6 center">
                ${requestScope.pageNumber}/${requestScope.totalPages}
            </div>
            <div class="col-lg-1 col-md-2 col-sm-3 ${not requestScope.isRightAvailable ? "disabled" : ""}">
                <button ${not requestScope.isRightAvailable ? 'disabled' : ''} onclick="location.href = '${pageContext.request.contextPath}/search?query=${param.query}&p=${requestScope.pageNumber + 1}';" class="center mb-3 mt-3 fieldButton ${not requestScope.isRightAvailable ? '' : 'clickableNoShadow'}">
                    <i class="bi bi-caret-right-fill"></i>
                </button>
            </div>
        </div>
        </c:if>
    </div>
</main>
<script>

    let searchBar = document.getElementById('searchBar');

    let searchBarMobile = document.getElementById('searchBarMobile');
    searchResult = document.getElementById('search-result');
    let queryStringSpan = document.getElementById('queryStringSpan');
    let pagination = document.getElementById('pagination');

    searchBar.focus();

    searchBar.oninput = function () {fetchAjaxSearch(searchBar.value);};
    searchBarMobile.oninput = function () {fetchAjaxSearch(searchBarMobile.value);};


    function fetchAjaxSearch(value) {
        // Nascondi tasti paginazione quando si fa ricerca AJAX
        if (pagination)
            pagination.style.display = 'none';

        fetch('AsyncSearch?q=' + value)
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

        container.classList.add('col-lg-4','col-md-6','col-sm-12','flexHorizontal','p-2');

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
        pTitle.classList.add('title', 'cut-text');
        pTitle.innerHTML = game.name;

        let pSubTitle = document.createElement('p');
        pSubTitle.classList.add('subtitle', 'cut-text');
        pSubTitle.innerHTML = game.producer;

        let pPrice = document.createElement('p');
        pPrice.classList.add('price', 'cut-text');
        pPrice.innerHTML =  '€ ';

        let span = document.createElement('span');
        span.classList.add('sub-lead');
        let numberFormat = new Intl.NumberFormat('it-IT', {currency: 'EUR'});
        span.innerHTML = numberFormat.format(game.price);

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