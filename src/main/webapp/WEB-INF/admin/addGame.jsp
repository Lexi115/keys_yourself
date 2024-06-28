<%@ page import="com.sicappiello.keysyourself.util.FileSize" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Aggiungi gioco</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/custom.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Aggiungi gioco</p>
        </div>

        <form action="addGame" method="post" id="myForm" enctype="multipart/form-data">
            <div class="row">
                <!-- Colonna dati del gioco -->
                <div class="col-lg-7 col-md-12 col-sm-12 p-6">
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
                            <div class="col-lg-3 col-md-6 col-sm-12 p-1">
                                <input name="price" type="number" step="0.01" class="input" id="price" placeholder="Prezzo" min="0" value="${param.price}" pattern="^\d{1,10}.\d{2}$" required>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h4>Generi gioco</h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <select class="input" id="genresSelect">
                                    <option value="null" selected>Seleziona un genere</option>
                                    <c:forEach items="${applicationScope.genreList}" var="genre">
                                        <option id="genre-${genre.id}" value="${genre.id}">${genre.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-5 col-md-12 col-sm-12 p-1 riepilogoContainer offset-md-0" style="margin-left:  3%; min-height:20px;">
                                <ul id="genreListUl" style="list-style-type: none;">
                                    <!-- lista generi riempita dinamicamente -->
                                </ul>
                            </div>
                        </div>

                        <input type="hidden" name="genres" id="genreInput">
                    </div>
                </div>

                <!-- Colonna aggiunta immagine -->
                <div class="col-lg-5 col-md-12 col-sm-12 p-6">
                    <h4>Aggiungi immagine gioco</h4>
                    <div class="riepilogoContainer">
                        <div class="thumbnail">
                            <img id="imagePreview" src="../assets/images/games/tmp.jpg" alt="Anteprima immagine">
                        </div>
                        <input type="file" class="input" style="display: none;" name="image" id="imageField">
                        <button class="fieldButton clickableNoShadow" type="button" id="btnFile"><i class="bi bi-cloud-upload"></i> Carica immagine</button>
                        <p style="margin-bottom: 0"><b>Max:</b> <%=FileSize.MAX_MB %> MB</p>
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
    let myForm = document.getElementById("myForm");
    let btnFile = document.getElementById("btnFile");
    let imageField = document.getElementById("imageField");
    let imagePreview = document.getElementById("imagePreview");

    btnFile.onclick = function () {
        imageField.click();
    }

    imageField.onchange = function (event) {
        let photo = event.target.files[0];

        // Se è maggiore di 10 MB, scarta
        if (photo.size > <%=FileSize.MAX%>) {
            alert('Il file è troppo grande (max 10 MB)');
            return false;
        }

        if (!photo.type.startsWith('image')) {
            alert('Il file caricato non è un\'immagine');
            return false;
        }

        // crea url temporaneo per immagine
        imagePreview.src = URL.createObjectURL(photo);

        imagePreview.onload = function () {
            // libera memoria
            URL.revokeObjectURL(imagePreview.src);
        }
    }

    myForm.onsubmit = function () {
        genresToString();

        if (genreInput.value === '') {
            alert('Aggiungere almeno un genere!');
            return false;
        }

        if (imageField.value === null) {
            alert('Caricare una immagine!');
        }
    }

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