<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Aggiungi gioco</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Aggiungi gioco</p>
        </div>

        <form action="addGameServlet" method="post" enctype="multipart/form-data">
            <div class="row">
                <!-- Colonna dati del gioco -->
                <div class="col-lg-8 col-md-12 col-sm-12 p-6">
                    <jsp:include page="/WEB-INF/include/infoAlert.jsp" />
                    <jsp:include page="/WEB-INF/include/errorAlert.jsp" />
                    <div>
                        <h4>Dettagli gioco</h4>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <input name="name" type="text" class="input" id="name" placeholder="Nome" value="${param.name}" pattern=".{1,150}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <input name="producer" type="text" class="input" id="producer" placeholder="Produttore" value="${param.producer}" pattern=".{1,50}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <textarea name="description" class="input" id="description" placeholder="Descrizione del gioco qui..." minlength="5" maxlength="2000" required>${param.description}</textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-6 col-sm-12 p-1">
                                <input name="price" type="number" step="0.01" class="input" id="price" placeholder="Prezzo" min="0" value="${param.price}" pattern="^\d{1,10}.\d{2}$" required>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h4>Generi gioco</h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <select name="genres" class="input" id="genresSelect">
                                    <option value="null" selected>Seleziona un genere</option>
                                    <c:forEach items="${applicationScope.genreList}" var="genre">
                                        <option id="genre-${genre.id}" value="${genre.id}">${genre.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-5 col-md-12 col-sm-12 p-1 riepilogoContainer offset-md-0" style="left: 3%; min-height:20px;">
                                <ul id="genreListUl" style="list-style-type: none;">
                                    <!-- lista generi riempita dinamicamente -->
                                </ul>
                            </div>
                        </div>

                        <input type="hidden" name="genres" id="genreInput">
                    </div>
                </div>

                <!-- Colonna aggiunta immagine -->
                <div class="col-lg-4 col-md-12 col-sm-12 p-6">
                    <h4>Aggiungi immagine gioco</h4>
                    <div class="riepilogoContainer" style="min-height: 320px">
                        <div class="thumbnail">
                            <img src="../assets/images/games/tmp.jpg">
                        </div>
                        <input type="file" name="image" id="imageField" required>
                    </div>

                    <button type="submit" class="mt-6 fieldButton clickableNoShadow">
                        <i class="bi bi-plus-lg"></i> Aggiungi gioco
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>
<script>
    let genreList = [];
    let genresSelect = document.getElementById("genresSelect");
    let genreListUl = document.getElementById("genreListUl");
    let genreInput = document.getElementById("genreInput");

    genresSelect.oninput = function () {
        let genreId = genresSelect.value;
        let genreName = document.getElementById("genre-" + genreId).innerHTML;
        addGenre(genreId, genreName);
    }

    function printGenreList() {
        genreListUl.innerHTML = "";
        
        genreList.forEach(genre => {
            let li = document.createElement('li');
            let xSpan = document.createElement('span');

            xSpan.innerHTML = '<i style="color:red; padding-right: 5px" class="bi bi-x-lg"></i>';
            xSpan.classList.add("clickableNoShadow");
            xSpan.onclick = function () {
                removeGenre(genre);
            }
            li.appendChild(xSpan);
            let genreName = document.createTextNode(genre.name); // innerHTML non va bene qui
            li.appendChild(genreName);
            genreListUl.appendChild(li);
        });

        console.log(genreList);
    }

    function addGenre(genreId, genreName) {
        if (!genreListContains(genreId)) {
            genreList.push({
                id: genreId,
                name: genreName
            });
        }
        printGenreList();
        genresSelect.value = null;
    }

    function genreListContains(genreId) {
        for (let i = 0; i < genreList.length; i++) {
            let obj = genreList[i];
            if (obj.id === genreId) {
                return true;
            }
        }

        return false;
    }

    function removeGenre(genre) {
        const index = genreList.indexOf(genre);
        if (index > -1) {
            genreList.splice(index, 1);
        }
        printGenreList();
    }

    function genresToString(){
        let resultString = "";
        for (let i = 0; i < genreList.length; i++) {
            resultString += genreList[i].id + ",";
        }
        resultString = resultString.slice(0, -1); // rimuove ultimo carattere (la virgola)
        genreInput.value = resultString;
    }

</script>
</body>
</html>